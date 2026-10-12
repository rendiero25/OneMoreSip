import 'package:drift/drift.dart' show Value;
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/db/app_database.dart' hide ReminderSettings;
import 'package:onemoresip/core/notifications/notification_channels.dart';
import 'package:onemoresip/core/notifications/reminder_replan.dart';
import 'package:onemoresip/features/logging/data/drink_log_repository.dart';
import 'package:onemoresip/features/profile/data/profile_repository.dart';
import 'package:onemoresip/features/reminders/domain/reminder_planner.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart';

import '../../helpers/logging.dart';
import 'fake_local_notifications.dart';

void main() {
  tzdata.initializeTimeZones();
  final l10n = lookupAppLocalizations(const Locale('en'));

  late AppDatabase db;
  late FakeLocalNotifications notifications;

  setUp(() {
    db = memoryDatabase();
    notifications = FakeLocalNotifications();
  });

  Future<void> replan({String device = 'UTC', DateTime? now}) =>
      replanReminders(
        db: db,
        notifications: notifications,
        deviceTimeZone: device,
        l10n: l10n,
        now: now,
      );

  Future<Profile> guest() =>
      ProfileRepository(db).getOrCreateGuest(timezone: 'unused');

  test('initializes and creates all six channels', () async {
    await replan();
    expect(notifications.calls.first, 'initialize');
    expect(notifications.channels.keys, [
      for (final c in AppChannel.values) c.id,
    ]);
  });

  test('without reminder settings: every 90 min, 07:00 to 22:00', () async {
    await replan(device: 'Asia/Jakarta');
    expect(notifications.scheduled, isNotEmpty);
    for (final s in notifications.scheduled) {
      final local = TZDateTime.from(s.at, getLocation('Asia/Jakarta'));
      final minute = local.hour * 60 + local.minute;
      expect((minute - 7 * 60) % 90, 0);
      expect(minute, inInclusiveRange(8 * 60 + 30, 20 * 60 + 30));
    }
  });

  test('stored settings and profile waking window are used', () {
    final profile = Profile(
      id: 'p',
      accountId: guestAccountId,
      kind: 'main',
      displayName: '',
      wakeTime: '06:30',
      sleepTime: '23:00',
      timezone: 'UTC',
      units: 'ml',
      locale: 'en',
      experience: 'normal',
      adaptiveWeather: true,
      adaptiveActivity: true,
      updatedAt: DateTime.utc(2026),
    );
    const row = ReminderSetting(
      profileId: 'p',
      mode: 'fixed',
      fixedTimes: '["09:00","13:30"]',
      weekdays: '[1,2,3]',
      quietStart: '12:00',
      quietEnd: '13:00',
      skipIfLoggedMin: 45,
    );
    final settings = reminderSettingsOf(row, profile);
    expect(settings.mode, ReminderMode.fixed);
    expect(settings.fixedTimesMin, [540, 810]);
    expect(settings.weekdays, {1, 2, 3});
    expect((settings.wakeMin, settings.sleepMin), (390, 1380));
    expect((settings.quietStartMin, settings.quietEndMin), (720, 780));
    expect(settings.skipIfLoggedMin, 45);
  });

  group('profile time zone', () {
    Future<String> zoneAfter(String stored, String device) async {
      final profile = await guest();
      await ProfileRepository(db).update(profile.copyWith(timezone: stored));
      await replan(device: device);
      return (await guest()).timezone;
    }

    test('offset stand-in is replaced by the device zone', () async {
      expect(await zoneAfter('Etc/GMT-7', 'Asia/Jakarta'), 'Asia/Jakarta');
    });

    test('non-IANA name is replaced by the device zone', () async {
      expect(await zoneAfter('GMT+07:00', 'Asia/Jakarta'), 'Asia/Jakarta');
    });

    test('a real profile zone is kept', () async {
      expect(await zoneAfter('Europe/London', 'Asia/Jakarta'), 'Europe/London');
    });
  });

  test('fluid restriction: no amounts in any reminder (F-28)', () async {
    final profile = await guest();
    await ProfileRepository(db)
        .update(profile.copyWith(fluidRestrictionMl: const Value(1500)));
    await replan();
    expect(notifications.scheduled, isNotEmpty);
    for (final s in notifications.scheduled) {
      expect(s.body, l10n.reminderNotificationBody);
    }
  });

  test("today's daily goal reached: nothing more today (BR-09)", () async {
    final now = DateTime.now();
    final profile = await guest();
    final local = now.toLocal();
    final day =
        '${local.year.toString().padLeft(4, '0')}-'
        '${local.month.toString().padLeft(2, '0')}-'
        '${local.day.toString().padLeft(2, '0')}';
    await db
        .into(db.dailyGoals)
        .insert(
          DailyGoalsCompanion.insert(
            profileId: profile.id,
            day: day,
            finalMl: const Value(200),
          ),
        );
    await DrinkLogRepository(db).add(
      profileId: profile.id,
      drink: testCatalog.drinks.firstWhere((d) => d.id == 'water_plain'),
      volumeMl: 250,
      source: 'app',
      loggedAt: now.subtract(const Duration(minutes: 1)),
    );

    await replan(now: now);

    final utcToday = TZDateTime.from(now, UTC);
    final tomorrow = TZDateTime(
      UTC,
      utcToday.year,
      utcToday.month,
      utcToday.day + 1,
    );
    expect(
      notifications.scheduled.every((s) => !s.at.isBefore(tomorrow)),
      isTrue,
    );
  });
}
