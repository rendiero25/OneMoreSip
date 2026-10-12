import 'dart:convert';
import 'dart:ui';

import 'package:drift/drift.dart';
import 'package:flutter/widgets.dart';
import 'package:onemoresip/core/db/app_database.dart' hide ReminderSettings;
import 'package:onemoresip/core/notifications/local_notifications.dart';
import 'package:onemoresip/core/notifications/notification_channels.dart';
import 'package:onemoresip/core/notifications/reminder_scheduler.dart';
import 'package:onemoresip/features/logging/data/drink_log_repository.dart';
import 'package:onemoresip/features/profile/data/device_timezone.dart';
import 'package:onemoresip/features/profile/data/profile_repository.dart';
import 'package:onemoresip/features/reminders/data/reminder_settings_repository.dart';
import 'package:onemoresip/features/reminders/domain/reminder_planner.dart';
import 'package:onemoresip/features/safety/domain/safety_policy.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';
import 'package:timezone/timezone.dart';

/// Goal used until there is a daily goal or a profile goal (BR-01, no
/// weight or sex given).
const fallbackGoalMl = 2200;

/// Re-plans the guest profile's drink reminders from the local database
/// (SD-8). Runs on app start, on resume and in the daily background task.
///
/// The time zone is the profile's; a missing, non-IANA or fixed-offset
/// stand-in profile zone (see `isOffsetTimezone`) is replaced by a real
/// [deviceTimeZone]. The time zone database must be loaded.
Future<void> replanReminders({
  required AppDatabase db,
  required LocalNotifications notifications,
  required String deviceTimeZone,
  AppLocalizations? l10n,
  DateTime? now,
}) async {
  final profiles = ProfileRepository(db);
  var profile = await profiles.getOrCreateGuest(timezone: deviceTimeZone);
  final replaceable =
      _location(profile.timezone) == null || isOffsetTimezone(profile.timezone);
  if (replaceable &&
      profile.timezone != deviceTimeZone &&
      !isOffsetTimezone(deviceTimeZone) &&
      _location(deviceTimeZone) != null) {
    profile = await profiles.update(profile.copyWith(timezone: deviceTimeZone));
  }
  final location = _location(profile.timezone) ?? UTC;
  // Logs and daily goals use the device's local calendar day (SD-4.2).
  final local = (now ?? DateTime.now()).toLocal();
  final at = TZDateTime.from(local, location);
  final strings = l10n ?? deviceLocalizations();

  await notifications.initialize();
  for (final channel in AppChannel.values) {
    await notifications.createChannel(channel.channel(strings));
  }

  final safety = SafetyPolicy(restrictionMl: profile.fluidRestrictionMl);
  final logs = await DrinkLogRepository(db).watchDay(profile.id, local).first;
  final hourAgo = at.subtract(const Duration(hours: 1));
  final today = DayIntake(
    goalMl: safety.effectiveGoal(await _todayGoalMl(db, profile, local)),
    loggedMl: logs.fold(0, (sum, log) => sum + log.hydrationMl),
    lastLogAt: logs.isEmpty ? null : logs.last.loggedAt,
    loggedLast60MinMl: logs
        .where((log) => log.loggedAt.isAfter(hourAgo))
        // Counted ml, as BR-06 sums them (D-35).
        .fold(0, (sum, log) => sum + log.hydrationMl),
    fluidRestricted: safety.isRestricted,
  );

  await ReminderScheduler(notifications).reschedule(
    settings: reminderSettingsOf(
      await ReminderSettingsRepository(db).get(profile.id),
      profile,
    ),
    today: today,
    safety: safety,
    location: location,
    now: at,
    l10n: strings,
  );
}

/// Strings in the device language, as the app shows them (no context in
/// the background isolate).
AppLocalizations deviceLocalizations() => lookupAppLocalizations(
  basicLocaleListResolution(
    PlatformDispatcher.instance.locales,
    AppLocalizations.supportedLocales,
  ),
);

/// Planner settings from the stored row and the profile's waking window.
/// Without a row (reminder settings UI is T-046): every 90 min, 07:00 to
/// 22:00 unless the profile has wake and sleep times.
ReminderSettings reminderSettingsOf(ReminderSetting? row, Profile profile) {
  const defaults = ReminderSettings(
    mode: ReminderMode.interval,
    wakeMin: 7 * 60,
    sleepMin: 22 * 60,
  );
  final fixed = _times(row?.fixedTimes);
  return ReminderSettings(
    mode: row?.mode == 'fixed' && fixed.isNotEmpty
        ? ReminderMode.fixed
        : ReminderMode.interval,
    wakeMin: _minutes(profile.wakeTime) ?? defaults.wakeMin,
    sleepMin: _minutes(profile.sleepTime) ?? defaults.sleepMin,
    intervalMin: row?.intervalMin ?? defaults.intervalMin,
    fixedTimesMin: fixed,
    weekdays: _weekdays(row?.weekdays) ?? defaults.weekdays,
    quietStartMin: _minutes(row?.quietStart),
    quietEndMin: _minutes(row?.quietEnd),
    skipIfLoggedMin: row?.skipIfLoggedMin ?? defaults.skipIfLoggedMin,
  );
}

// TODO(T-023): replace with the goal calculator (BR-01). Until then:
// today's stored daily goal, else the profile's own goal, else 2,200 ml.
Future<int> _todayGoalMl(AppDatabase db, Profile profile, DateTime day) async {
  final key =
      '${day.year.toString().padLeft(4, '0')}-'
      '${day.month.toString().padLeft(2, '0')}-'
      '${day.day.toString().padLeft(2, '0')}';
  final goal =
      await (db.select(db.dailyGoals)
            ..where((g) => g.profileId.equals(profile.id) & g.day.equals(key)))
          .getSingleOrNull();
  return goal?.finalMl ?? profile.goalOverrideMl ?? fallbackGoalMl;
}

Location? _location(String name) {
  if (name.isEmpty) return null;
  try {
    return getLocation(name);
  } on LocationNotFoundException {
    return null;
  }
}

/// 'HH:MM' (seconds ignored) to minutes after midnight.
int? _minutes(String? time) {
  final parts = time?.split(':');
  if (parts == null || parts.length < 2) return null;
  final h = int.tryParse(parts[0]);
  final m = int.tryParse(parts[1]);
  if (h == null || m == null || h > 23 || m > 59) return null;
  return h * 60 + m;
}

/// JSON list of 'HH:MM' to minutes; invalid entries are dropped.
List<int> _times(String? json) {
  if (json == null) return const [];
  final list = _decodeList(json);
  return [for (final t in list) ?_minutes(t is String ? t : null)];
}

/// JSON list of ISO weekdays (1 = Monday … 7 = Sunday); `null` = not set.
Set<int>? _weekdays(String? json) => json == null
    ? null
    : {
        for (final d in _decodeList(json))
          if (d is int && d >= 1 && d <= 7) d,
      };

List<Object?> _decodeList(String json) {
  try {
    final value = jsonDecode(json);
    return value is List ? value : const [];
  } on FormatException {
    return const [];
  }
}
