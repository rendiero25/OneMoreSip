import 'package:onemoresip/features/reminders/domain/catch_up.dart';
import 'package:timezone/timezone.dart';

/// How reminder times are chosen (F-04).
enum ReminderMode {
  /// Every `intervalMin` minutes from wake to sleep.
  interval,

  /// At the user's fixed times.
  fixed,
}

/// Reminder settings (SD-4.1 `reminder_settings` + the profile's waking
/// window). Times of day are minutes after local midnight.
class ReminderSettings {
  /// Creates settings.
  const new({
    required this.mode,
    required this.wakeMin,
    required this.sleepMin,
    this.intervalMin = 90,
    this.fixedTimesMin = const [],
    this.weekdays = const {1, 2, 3, 4, 5, 6, 7},
    this.quietStartMin,
    this.quietEndMin,
    this.skipIfLoggedMin = 30,
    this.maxPerDay = 12,
  });

  /// Interval or fixed times.
  final ReminderMode mode;

  /// Wake time; reminders start after it.
  final int wakeMin;

  /// Sleep time; at or before [wakeMin] it is on the next day.
  final int sleepMin;

  /// Minutes between reminders in [ReminderMode.interval].
  final int intervalMin;

  /// Times of day in [ReminderMode.fixed].
  final List<int> fixedTimesMin;

  /// Active days, `DateTime.monday` (1) … `DateTime.sunday` (7), by the
  /// day the waking window starts.
  final Set<int> weekdays;

  /// Quiet hours start; may span midnight. `null` = no quiet hours.
  final int? quietStartMin;

  /// Quiet hours end (exclusive).
  final int? quietEndMin;

  /// Skip a reminder this soon after a log (BR-09).
  final int skipIfLoggedMin;

  /// Most reminders per day (F-04 default cap 8–12).
  final int maxPerDay;
}

/// Today's intake, as far as the planner needs it.
class DayIntake {
  /// Creates the intake.
  const new({
    required this.goalMl,
    required this.loggedMl,
    this.lastLogAt,
    this.loggedLast60MinMl = 0,
    this.fluidRestricted = false,
  });

  /// Today's goal.
  final int goalMl;

  /// Logged so far today (hydration ml).
  final int loggedMl;

  /// Time of the latest log, if any.
  final DateTime? lastLogAt;

  /// Logged within the last 60 minutes (BR-06).
  final int loggedLast60MinMl;

  /// Doctor's fluid restriction (BR-01a): no suggested amounts.
  final bool fluidRestricted;
}

/// A planned reminder and the amount it suggests (`null` = no amount).
typedef PlannedReminder = ({TZDateTime at, int? suggestedMl});

/// A time range in which no reminders fire (e.g. fasting hours, F-10).
typedef BlockedWindow = ({DateTime start, DateTime end});

/// Plans reminders from [now] for the next [horizon] (F-04, F-05, BR-02,
/// BR-09, SD-8).
///
/// Times are wall-clock times in [location]: a time skipped by a DST jump
/// moves to just after it, and a repeated time is used once. A day is
/// capped at [ReminderSettings.maxPerDay] evenly spread reminders, so the
/// remainder is never stacked into the last hour. Skipped: before [now],
/// within `skipIfLoggedMin` of the last log, in quiet hours, in
/// [blocked] windows, and the rest of today once the goal is reached.
/// Suggested amounts follow BR-02 and are omitted under a fluid
/// restriction; future days assume nothing logged yet.
List<PlannedReminder> planReminders({
  required ReminderSettings settings,
  required Location location,
  required TZDateTime now,
  required DayIntake today,
  List<BlockedWindow> blocked = const [],
  Duration horizon = const Duration(hours: 36),
}) {
  final end = now.add(horizon);
  final todayDate = DateTime.utc(now.year, now.month, now.day);
  final planned = <PlannedReminder>[];
  final seen = <int>{};

  // Start a day early: a window that began yesterday may still be open.
  for (var offset = -1; ; offset++) {
    final date = todayDate.add(Duration(days: offset));
    final dayStart = TZDateTime(location, date.year, date.month, date.day);
    if (dayStart.isAfter(end)) break;
    if (!settings.weekdays.contains(date.weekday)) continue;

    final isToday = offset == 0 || (offset == -1 && _spansMidnight(settings));
    if (isToday && today.loggedMl >= today.goalMl) continue;

    final slots = _capEvenly(_slotsOf(settings), settings.maxPerDay)
        .where((m) => !_inQuiet(settings, m % 1440))
        .map((m) => TZDateTime(location, date.year, date.month, date.day, 0, m))
        .where((t) => t.isAfter(now) && !t.isAfter(end))
        .where((t) => !_blocked(blocked, t))
        .where((t) => !isToday || !_tooSoonAfterLog(settings, today, t))
        .where((t) => seen.add(t.millisecondsSinceEpoch))
        .toList();

    for (final at in slots) {
      final last60 = isToday && at.difference(now).inMinutes < 60
          ? today.loggedLast60MinMl
          : 0;
      planned.add((
        at: at,
        suggestedMl: catchUpPerReminderMl(
          goalMl: today.goalMl,
          loggedMl: isToday ? today.loggedMl : 0,
          remindersLeft: slots.length,
          loggedLast60MinMl: last60,
          fluidRestricted: today.fluidRestricted,
        ),
      ));
    }
  }
  return planned..sort((a, b) => a.at.compareTo(b.at));
}

bool _spansMidnight(ReminderSettings s) => s.sleepMin <= s.wakeMin;

/// Candidate minutes after the day's midnight (may exceed 1440 when the
/// waking window crosses midnight).
List<int> _slotsOf(ReminderSettings s) {
  final sleep = _spansMidnight(s) ? s.sleepMin + 1440 : s.sleepMin;
  return switch (s.mode) {
    ReminderMode.interval => [
      for (var m = s.wakeMin + s.intervalMin; m < sleep; m += s.intervalMin) m,
    ],
    ReminderMode.fixed => [...s.fixedTimesMin]..sort(),
  };
}

/// Keeps at most [max] of [slots], spread evenly from first to last.
List<int> _capEvenly(List<int> slots, int max) {
  if (slots.length <= max) return slots;
  if (max <= 1) return slots.take(max).toList();
  final step = (slots.length - 1) / (max - 1);
  return [for (var i = 0; i < max; i++) slots[(i * step).round()]];
}

bool _inQuiet(ReminderSettings s, int minute) {
  final start = s.quietStartMin;
  final end = s.quietEndMin;
  if (start == null || end == null || start == end) return false;
  return start < end
      ? minute >= start && minute < end
      : minute >= start || minute < end;
}

bool _blocked(List<BlockedWindow> windows, DateTime t) =>
    windows.any((w) => !t.isBefore(w.start) && t.isBefore(w.end));

bool _tooSoonAfterLog(ReminderSettings s, DayIntake today, DateTime t) {
  final last = today.lastLogAt;
  return last != null &&
      t.difference(last) < Duration(minutes: s.skipIfLoggedMin);
}
