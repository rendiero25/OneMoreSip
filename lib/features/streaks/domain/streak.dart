/// BR-07 streak with automatic freezes (F-15, D-31).
library;

/// One day of history. `date` is the local calendar day (time ignored).
typedef StreakDay = ({
  DateTime date,
  int hydrationMl,
  int goalMl,
  int logCount,
});

/// Current streak `length` and the past days a freeze was spent on.
typedef StreakResult = ({int length, List<DateTime> frozenDays});

/// Whether [day] counts toward the streak.
///
/// Normally hydration ≥ 100% of that day's goal (on fasting days the goal
/// passed in is the window goal). Under a doctor's fluid restriction a day
/// counts when anything was logged, so the streak never pushes the user to
/// drink up to their limit (F-28, D-31).
bool dayCounts(StreakDay day, {required bool fluidRestricted}) =>
    fluidRestricted
    ? day.logCount > 0
    : day.goalMl > 0 && day.hydrationMl >= day.goalMl;

/// Computes the streak ending at [today].
///
/// Today only adds when it already counts; an unfinished today never breaks
/// the streak. Walking back from yesterday, a gap of missed days is frozen
/// only if enough freezes are left to cover all of it and an earlier
/// counting day exists; frozen days keep the streak alive but do not add to
/// its length. Days without a record count as missed.
StreakResult computeStreak({
  required List<StreakDay> days,
  required DateTime today,
  required int freezesAvailable,
  required bool fluidRestricted,
}) {
  final counted = {
    for (final day in days)
      if (dayCounts(day, fluidRestricted: fluidRestricted)) _key(day.date),
  };
  final todayKey = _key(today);
  final earliestCounted = counted.isEmpty
      ? null
      : counted.reduce((a, b) => a.isBefore(b) ? a : b);

  var length = counted.contains(todayKey) ? 1 : 0;
  var freezes = freezesAvailable;
  final frozen = <DateTime>[];
  var day = todayKey.subtract(const Duration(days: 1));

  while (earliestCounted != null && !day.isBefore(earliestCounted)) {
    if (counted.contains(day)) {
      length++;
      day = day.subtract(const Duration(days: 1));
      continue;
    }
    // A gap: freeze it only if the whole gap can be covered.
    final gap = <DateTime>[];
    while (!counted.contains(day)) {
      gap.add(day);
      day = day.subtract(const Duration(days: 1));
    }
    if (gap.length > freezes) break;
    freezes -= gap.length;
    frozen.addAll(gap);
  }
  return (length: length, frozenDays: frozen);
}

DateTime _key(DateTime date) => DateTime.utc(date.year, date.month, date.day);
