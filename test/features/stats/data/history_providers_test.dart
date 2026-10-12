import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/core/db/database_providers.dart';
import 'package:onemoresip/core/flags/feature_flags.dart';
import 'package:onemoresip/features/drinks/domain/drink.dart';
import 'package:onemoresip/features/logging/data/drink_log_repository.dart';
import 'package:onemoresip/features/profile/data/profile_repository.dart';
import 'package:onemoresip/features/stats/data/history_providers.dart';
import 'package:onemoresip/features/streaks/data/streak_providers.dart';

Drink _drink(String id, {double waterPct = 100, bool isAlcoholic = false}) =>
    Drink(
      id: id,
      nameEn: id,
      nameId: id,
      localName: '',
      category: isAlcoholic ? DrinkCategory.alcohol : DrinkCategory.water,
      defaultServingMl: 250,
      waterPct: waterPct,
      isAlcoholic: isAlcoholic,
      sugarGPer100Ml: 0,
      caffeineMgPer100Ml: 0,
    );

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  final water = _drink('water');
  final juice = _drink('juice', waterPct: 88);
  final beer = _drink('beer', waterPct: 92, isAlcoholic: true);
  final now = DateTime(2026, 10, 11, 20);
  DateTime daysAgo(int days, [int hour = 12]) =>
      DateTime(now.year, now.month, now.day - days, hour);

  late AppDatabase db;
  late ProviderContainer container;
  late DrinkLogRepository logs;
  late Profile profile;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    container = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
        clockProvider.overrideWithValue(() => now),
      ],
    );
    logs = container.read(drinkLogRepositoryProvider);
    profile = await container
        .read(profileRepositoryProvider)
        .getOrCreateGuest(timezone: 'Asia/Jakarta');
    // Keep the derived providers alive between reads.
    container
      ..listen(historyProvider, (_, _) {})
      ..listen(currentStreakProvider, (_, _) {})
      ..listen(dayHydrationProvider(daysAgo(0, 0)), (_, _) {});
  });
  tearDown(() async {
    container.dispose();
    await db.close();
  });

  Future<DrinkLog> add(Drink drink, int volumeMl, DateTime at) => logs.add(
    profileId: profile.id,
    drink: drink,
    volumeMl: volumeMl,
    source: 'app',
    loggedAt: at,
  );

  Future<T> read<T>(ProviderListenable<Future<T>> provider) async {
    await pumpEventQueue();
    return await container.read(provider);
  }

  Future<List<HistoryDay>> history() => read(historyProvider.future);
  Future<int> streak() async =>
      (await read(currentStreakProvider.future)).length;
  Future<int> today() => read(dayHydrationProvider(daysAgo(0, 0)).future);

  Future<void> setProfile(Profile Function(Profile) change) async {
    profile = await container
        .read(profileRepositoryProvider)
        .update(change(profile));
  }

  test('groups logs by local day, newest first, today always shown', () async {
    final older = await add(water, 250, daysAgo(2, 9));
    final later = await add(juice, 300, daysAgo(2, 18));
    await add(water, 500, daysAgo(7)); // outside the 7-day window

    final days = await history();
    expect(days.map((d) => d.date), [daysAgo(0, 0), daysAgo(2, 0)]);
    expect(days.first.logs, isEmpty);
    expect(days.last.logs.map((l) => l.id), [later.id, older.id]);
    expect(days.last.hydrationMl, 250 + 264);
    expect(days.last.goalMl, fallbackGoalMl);
  });

  test('alcohol is listed but counts 0 (D-23)', () async {
    await add(water, 250, daysAgo(0, 9));
    await add(beer, 330, daysAgo(0, 10));

    final day = (await history()).first;
    expect(day.logs, hasLength(2));
    expect(day.hydrationMl, 250);
    expect(await today(), 250);
  });

  test('goal: stored daily goal, else profile goal, else 2,200 ml', () async {
    await add(water, 250, daysAgo(1));
    expect(await read(currentGoalProvider.future), fallbackGoalMl);

    await setProfile((p) => p.copyWith(goalOverrideMl: const Value(2500)));
    await db
        .into(db.dailyGoals)
        .insert(
          DailyGoalsCompanion.insert(
            profileId: profile.id,
            day: '2026-10-10',
            finalMl: const Value(1800),
          ),
        );

    final days = await history();
    expect(days.first.goalMl, 2500);
    expect(days.last.goalMl, 1800);
  });

  test('editing volume and drink updates the day total and streak', () async {
    await add(water, 2200, daysAgo(1));
    final log = await add(water, 2000, daysAgo(0, 9));
    expect(await streak(), 1);
    expect(await today(), 2000);

    await logs.edit(
      log.id,
      drink: water,
      volumeMl: 2200,
      loggedAt: log.loggedAt,
    );
    expect(await today(), 2200);
    expect((await history()).first.goalMet, isTrue);
    expect(await streak(), 2);

    await logs.edit(
      log.id,
      drink: juice,
      volumeMl: 2200,
      loggedAt: log.loggedAt,
    );
    expect(await today(), 1936);
    expect((await history()).first.hydrationMl, 1936);
    expect(await streak(), 1);
  });

  test('delete removes the log from totals; restore brings it back', () async {
    await add(water, 2200, daysAgo(1));
    final log = await add(water, 2200, daysAgo(0, 9));
    expect(await streak(), 2);

    await logs.delete(log.id);
    expect(await today(), 0);
    expect((await history()).first.logs, isEmpty);
    expect(await streak(), 1);

    await logs.restore(log.id);
    expect(await today(), 2200);
    expect((await history()).first.logs.single.id, log.id);
    expect(await streak(), 2);
  });

  test('deleting the log that made a day count breaks the streak', () async {
    await add(water, 2200, daysAgo(3));
    final middle = await add(water, 2200, daysAgo(2));
    await add(water, 2200, daysAgo(1));
    expect(await streak(), 3);

    await logs.delete(middle.id);
    expect(await streak(), 1);
  });

  test('fluid restriction: any log counts, goal is the limit (D-31)', () async {
    await add(water, 100, daysAgo(2));
    await add(water, 200, daysAgo(1));
    await add(water, 50, daysAgo(0, 9));
    expect(await streak(), 0);

    await setProfile(
      (p) => p.copyWith(
        fluidRestrictionMl: const Value(1500),
        goalOverrideMl: const Value(2500),
      ),
    );
    expect(await streak(), 3);
    expect(await read(currentGoalProvider.future), 1500);
    expect((await history()).first.goalMl, 1500);
  });

  test('without a profile the history shows an empty today', () async {
    final empty = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(
          AppDatabase(NativeDatabase.memory()),
        ),
        clockProvider.overrideWithValue(() => now),
      ],
    );
    addTearDown(() async {
      final db = empty.read(appDatabaseProvider);
      empty.dispose();
      await db.close();
    });

    empty
      ..listen(historyProvider, (_, _) {})
      ..listen(currentStreakProvider, (_, _) {});
    final days = await empty.read(historyProvider.future);
    expect(days.single.date, daysAgo(0, 0));
    expect(days.single.logs, isEmpty);
    expect((await empty.read(currentStreakProvider.future)).length, 0);
  });
}
