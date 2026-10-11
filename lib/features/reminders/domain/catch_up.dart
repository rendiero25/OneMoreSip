/// BR-02 smart catch-up. Never applies under a doctor's fluid restriction
/// (BR-01a, F-28).
library;

/// Most a single reminder may suggest (BR-02).
const maxCatchUpPerReminderMl = 500;

/// Most that may be logged within 60 minutes before warning (BR-06).
const hourlyLimitMl = 1000;

/// Expected intake by [now]: the goal spread linearly over the waking
/// window from [wake] to [sleep].
int paceMl({
  required int goalMl,
  required DateTime wake,
  required DateTime sleep,
  required DateTime now,
}) => (goalMl * _elapsed(wake, sleep, now)).round();

/// Suggested amount for the next reminder, or `null` when there is
/// nothing to suggest (goal reached, no reminders left, hourly limit
/// reached, or fluid restriction).
///
/// `remaining / remindersLeft`, rounded down to 50 ml (at least 50 ml),
/// capped at 500 ml and at what keeps the last 60 minutes under 1,000 ml.
int? catchUpPerReminderMl({
  required int goalMl,
  required int loggedMl,
  required int remindersLeft,
  required int loggedLast60MinMl,
  required bool fluidRestricted,
}) {
  final remaining = goalMl - loggedMl;
  if (fluidRestricted || remaining <= 0 || remindersLeft <= 0) return null;
  final even = _max(50, _floor50(remaining ~/ remindersLeft));
  final room = _floor50(hourlyLimitMl - loggedLast60MinMl);
  final suggestion = [even, maxCatchUpPerReminderMl, room].reduce(_min);
  return suggestion >= 50 ? suggestion : null;
}

/// Whether to show the one gentle "a little behind" message: at or after
/// 3/4 of the waking window, more than 40 percentage points behind pace.
/// The caller makes sure it is shown at most once a day.
bool shouldShowBehindMessage({
  required int goalMl,
  required int loggedMl,
  required DateTime wake,
  required DateTime sleep,
  required DateTime now,
  required bool fluidRestricted,
}) {
  if (fluidRestricted || goalMl <= 0) return false;
  final elapsed = _elapsed(wake, sleep, now);
  if (elapsed < 0.75) return false;
  return (elapsed - loggedMl / goalMl) * 100 > 40;
}

double _elapsed(DateTime wake, DateTime sleep, DateTime now) {
  final window = sleep.difference(wake).inSeconds;
  if (window <= 0) return 1;
  return (now.difference(wake).inSeconds / window).clamp(0.0, 1.0);
}

int _floor50(int ml) => ml <= 0 ? 0 : ml - ml % 50;

int _min(int a, int b) => a < b ? a : b;

int _max(int a, int b) => a > b ? a : b;
