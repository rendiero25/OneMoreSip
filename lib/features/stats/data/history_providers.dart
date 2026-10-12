import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/core/db/database_providers.dart';
import 'package:onemoresip/core/flags/feature_flags.dart';
import 'package:onemoresip/features/logging/data/drink_log_repository.dart';
import 'package:onemoresip/features/profile/data/profile_repository.dart';
import 'package:onemoresip/features/safety/domain/safety_policy.dart';

/// BR-01 base goal without weight, sex "unspecified".
///
/// Temporary: T-023 (goal calculator) replaces [currentGoalProvider] and
/// this constant.
const fallbackGoalMl = 2200;

/// Days the history list shows, today included (F-14 free tier). The
/// Premium full history comes with the gate in T-034.
const historyDays = 7;

/// Today's goal of the current profile: the doctor's limit under a fluid
/// restriction (BR-01a), else the profile's own goal, else
/// [fallbackGoalMl].
///
/// Temporary fallback until T-023 computes the BR-01 goal.
final currentGoalProvider = FutureProvider<int>((ref) async {
  final profile = await ref.watch(currentProfileProvider.future);
  return SafetyPolicy(restrictionMl: profile?.fluidRestrictionMl)
      .effectiveGoal(profile?.goalOverrideMl ?? fallbackGoalMl);
});

/// Stored `daily_goals.final_ml` of the current profile by local day.
final dailyGoalsProvider = StreamProvider<Map<DateTime, int>>((ref) async* {
  final profile = await ref.watch(currentProfileProvider.future);
  if (profile == null) {
    yield const {};
    return;
  }
  final db = ref.watch(appDatabaseProvider);
  final query = db.select(db.dailyGoals)
    ..where((g) => g.profileId.equals(profile.id) & g.finalMl.isNotNull());
  yield* query.watch().map(
    (rows) => {for (final row in rows) DateTime.parse(row.day): row.finalMl!},
  );
});

/// All non-deleted logs of the current profile, newest first.
final profileLogsProvider = StreamProvider<List<DrinkLog>>((ref) async* {
  final profile = await ref.watch(currentProfileProvider.future);
  if (profile == null) {
    yield const [];
    return;
  }
  yield* ref.watch(drinkLogRepositoryProvider).watchAll(profile.id);
});

/// Millilitres counted toward the goal (BR-03) on the local day of the
/// key; updates on every add, edit, delete and undo.
final StreamProviderFamily<int, DateTime> dayHydrationProvider =
    StreamProvider.family<int, DateTime>((ref, day) async* {
      final profile = await ref.watch(currentProfileProvider.future);
      if (profile == null) {
        yield 0;
        return;
      }
      yield* ref
          .watch(drinkLogRepositoryProvider)
          .watchDay(profile.id, day)
          .map((logs) => logs.fold(0, (sum, log) => sum + log.hydrationMl));
    });

/// One local calendar day with its logs.
class HistoryDay {
  /// Creates a day.
  const new({required this.date, required this.logs, required this.goalMl});

  /// Local calendar day (midnight).
  final DateTime date;

  /// Logs of the day, newest first.
  final List<DrinkLog> logs;

  /// That day's goal (BR-01, BR-01a).
  final int goalMl;

  /// Millilitres counted toward the goal (BR-03).
  int get hydrationMl => logs.fold(0, (sum, log) => sum + log.hydrationMl);

  /// Whether the counted total reached the goal.
  bool get goalMet => goalMl > 0 && hydrationMl >= goalMl;
}

/// The goal of a local day: its stored `daily_goals` value, else
/// [currentGoalProvider]; under a fluid restriction always the doctor's
/// limit (BR-01a).
final goalForDayProvider = FutureProvider<int Function(DateTime day)>((
  ref,
) async {
  final stored = await ref.watch(dailyGoalsProvider.future);
  final fallback = await ref.watch(currentGoalProvider.future);
  final profile = await ref.watch(currentProfileProvider.future);
  final policy = SafetyPolicy(restrictionMl: profile?.fluidRestrictionMl);
  return (DateTime day) {
    final goal = stored[localDay(day)];
    return goal == null ? fallback : policy.effectiveGoal(goal);
  };
});

/// Every day with logs of the current profile, newest first.
final loggedDaysProvider = FutureProvider<List<HistoryDay>>((ref) async {
  final logs = await ref.watch(profileLogsProvider.future);
  final goalFor = await ref.watch(goalForDayProvider.future);

  final byDay = <DateTime, List<DrinkLog>>{};
  for (final log in logs) {
    (byDay[localDay(log.loggedAt)] ??= []).add(log);
  }
  return [
    for (final MapEntry(key: date, value: dayLogs) in byDay.entries)
      HistoryDay(date: date, logs: dayLogs, goalMl: goalFor(date)),
  ];
});

/// The history list: today (even without logs) and the earlier days with
/// logs within the last [historyDays] days, newest first.
final historyProvider = FutureProvider<List<HistoryDay>>((ref) async {
  final days = await ref.watch(loggedDaysProvider.future);
  final goalFor = await ref.watch(goalForDayProvider.future);
  final today = localDay(ref.watch(clockProvider)());
  final first = DateTime(today.year, today.month, today.day - historyDays + 1);
  final shown = days.where((d) => !d.date.isBefore(first)).toList();
  if (shown.isEmpty || shown.first.date != today) {
    shown.insert(
      0,
      HistoryDay(date: today, logs: const [], goalMl: goalFor(today)),
    );
  }
  return shown;
});

/// Local calendar day (midnight) of [time].
DateTime localDay(DateTime time) {
  final local = time.toLocal();
  return DateTime(local.year, local.month, local.day);
}
