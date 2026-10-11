import 'dart:convert';

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/features/drinks/domain/drink.dart';
import 'package:onemoresip/features/logging/data/drink_log_repository.dart';

Drink _drink(
  String id, {
  double waterPct = 100,
  bool isAlcoholic = false,
  double sugar = 0,
  double caffeine = 0,
}) => Drink(
  id: id,
  nameEn: id,
  nameId: id,
  localName: '',
  category: isAlcoholic ? DrinkCategory.alcohol : DrinkCategory.water,
  defaultServingMl: 250,
  waterPct: waterPct,
  isAlcoholic: isAlcoholic,
  sugarGPer100Ml: sugar,
  caffeineMgPer100Ml: caffeine,
);

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  const profileId = '0192f0c0-0000-7000-8000-000000000001';
  final water = _drink('water');
  final day = DateTime(2026, 10, 11, 9);

  late AppDatabase db;
  late DrinkLogRepository repo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repo = DrinkLogRepository(db);
  });
  tearDown(() => db.close());

  Future<List<OutboxEntry>> outbox() => db.select(db.outbox).get();

  Future<DrinkLog> add(Drink drink, int volumeMl, {DateTime? at}) => repo.add(
    profileId: profileId,
    drink: drink,
    volumeMl: volumeMl,
    source: 'app',
    loggedAt: at ?? day,
  );

  test('add stores the log and exactly one outbox insert', () async {
    final log = await add(water, 250);

    final rows = await db.select(db.drinkLogs).get();
    expect(rows.single.id, log.id);
    final entry = (await outbox()).single;
    expect(entry.targetTable, 'drink_logs');
    expect(entry.rowId, log.id);
    expect(entry.op, 'insert');
    expect(entry.attempts, 0);
    final payload = jsonDecode(entry.payload) as Map<String, Object?>;
    expect(payload['id'], log.id);
    expect(payload['volume_ml'], 250);
    expect(payload['hydration_ml'], 250);
    expect(payload['logged_at'], day.toUtc().toIso8601String());
  });

  test('stores hydration per BR-03, alcohol counts 0 (D-23)', () async {
    final coffee = await add(
      _drink('coffee', waterPct: 98.5, caffeine: 40, sugar: 0.3),
      333,
    );
    final beer = await add(
      _drink('beer', waterPct: 92, isAlcoholic: true, sugar: 0.1),
      330,
    );

    expect(coffee.hydrationMl, 328); // 333 × 0.985 = 328.0
    expect(coffee.caffeineMg, 133.2);
    expect(coffee.sugarG, 1.0);
    expect(beer.volumeMl, 330);
    expect(beer.hydrationMl, 0);
  });

  test('rejects volumes outside the server range', () async {
    expect(() => add(water, 0), throwsRangeError);
    expect(() => add(water, 3001), throwsRangeError);
    expect(await outbox(), isEmpty);
  });

  test('a failing outbox write rolls back the log too', () async {
    await db.customStatement(
      'CREATE TRIGGER fail_outbox BEFORE INSERT ON outbox '
      "BEGIN SELECT RAISE(ABORT, 'boom'); END",
    );

    await expectLater(add(water, 250), throwsA(isA<SqliteException>()));
    expect(await db.select(db.drinkLogs).get(), isEmpty);
    expect(await outbox(), isEmpty);
  });

  test('edit recomputes hydration and queues one update', () async {
    final log = await add(water, 250);
    final edited = await repo.edit(
      log.id,
      drink: _drink('juice', waterPct: 88),
      volumeMl: 300,
      loggedAt: day,
    );

    expect(edited.drinkId, 'juice');
    expect(edited.hydrationMl, 264);
    expect(edited.updatedAt.isBefore(log.updatedAt), isFalse);
    final stored = await db.select(db.drinkLogs).getSingle();
    expect(stored.hydrationMl, 264);
    final entries = await outbox();
    expect(entries.map((e) => e.op), ['insert', 'update']);
    expect(entries.last.rowId, log.id);
  });

  test('delete is soft, hides the log and queues a delete', () async {
    final kept = await add(water, 200);
    final removed = await add(water, 300);

    await repo.delete(removed.id);

    final stored = await (db.select(
      db.drinkLogs,
    )..where((l) => l.id.equals(removed.id))).getSingle();
    expect(stored.deletedAt, isNotNull);
    expect(stored.updatedAt, stored.deletedAt);
    expect((await repo.watchDay(profileId, day).first).map((l) => l.id), [
      kept.id,
    ]);
    final entry = (await outbox()).last;
    expect(entry.op, 'delete');
    expect(entry.rowId, removed.id);
    expect(jsonDecode(entry.payload), containsPair('deleted_at', isNotNull));
    expect(() => repo.delete(removed.id), throwsStateError);
  });

  test('day queries only include that local day and profile', () async {
    final first = await add(water, 100, at: DateTime(2026, 10, 11));
    final last = await add(water, 200, at: DateTime(2026, 10, 11, 23, 59));
    await add(water, 400, at: DateTime(2026, 10, 10, 23, 59));
    await add(water, 800, at: DateTime(2026, 10, 12));
    await repo.add(
      profileId: 'other',
      drink: water,
      volumeMl: 1600,
      source: 'app',
      loggedAt: day,
    );

    final logs = await repo.watchDay(profileId, day).first;
    expect(logs.map((l) => l.id), [first.id, last.id]);
    expect(await repo.hydrationMlOn(profileId, day), 300);
  });

  test("today's sum excludes deleted logs and is 0 when empty", () async {
    expect(await repo.hydrationMlOn(profileId, day), 0);
    await add(water, 250);
    final removed = await add(water, 500);
    await add(_drink('wine', isAlcoholic: true), 150);

    await repo.delete(removed.id);

    expect(await repo.hydrationMlOn(profileId, day), 250);
  });
}
