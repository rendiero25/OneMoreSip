import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/notifications/notification_channels.dart';
import 'package:onemoresip/core/notifications/notification_permissions.dart';
import 'package:onemoresip/core/notifications/reminder_scheduler.dart';
import 'package:onemoresip/features/reminders/domain/reminder_planner.dart';
import 'package:onemoresip/features/safety/domain/safety_policy.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart';

import 'fake_local_notifications.dart';

const _settings = ReminderSettings(
  mode: ReminderMode.interval,
  wakeMin: 7 * 60,
  sleepMin: 22 * 60,
);

void main() {
  tzdata.initializeTimeZones();
  final jakarta = getLocation('Asia/Jakarta');
  final now = TZDateTime(jakarta, 2026, 10, 12, 9);
  final l10n = lookupAppLocalizations(const Locale('en'));

  late FakeLocalNotifications notifications;

  setUp(() => notifications = FakeLocalNotifications());

  Future<void> reschedule({
    DayIntake today = const DayIntake(goalMl: 2000, loggedMl: 0),
    SafetyPolicy safety = const SafetyPolicy(),
  }) => ReminderScheduler(notifications).reschedule(
    settings: _settings,
    today: today,
    safety: safety,
    location: jakarta,
    now: now,
    l10n: l10n,
  );

  test('schedules exactly the planned reminders with stable ids', () async {
    await reschedule();

    final planned = planReminders(
      settings: _settings,
      location: jakarta,
      now: now,
      today: const DayIntake(goalMl: 2000, loggedMl: 0),
    );
    expect(planned, isNotEmpty);
    expect(notifications.scheduled.map((s) => (s.id, s.at)), [
      for (final (i, p) in planned.indexed) (reminderIdBase + i, p.at),
    ]);
    for (final s in notifications.scheduled) {
      final android = s.details.android!;
      expect(android.channelId, AppChannel.reminders.id);
      expect(android.channelName, l10n.notificationChannelReminders);
      expect(s.title, l10n.reminderNotificationTitle);
    }
  });

  test('cancels the previous reminders first, leaves other ids', () async {
    await reschedule();
    final first = notifications.pending.length;
    await notifications.schedule(
      id: 5,
      at: now,
      title: 't',
      body: 'b',
      details: const NotificationDetails(),
      mode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
    notifications.calls.clear();

    await reschedule(
      today: DayIntake(
        goalMl: 2000,
        loggedMl: 500,
        lastLogAt: now.subtract(const Duration(minutes: 5)),
      ),
    );

    final cancels = notifications.calls.where((c) => c.startsWith('cancel'));
    expect(cancels, hasLength(first));
    expect(cancels, isNot(contains('cancel 5')));
    final lastCancel = notifications.calls.lastIndexWhere(
      (c) => c.startsWith('cancel'),
    );
    final firstSchedule = notifications.calls.indexWhere(
      (c) => c.startsWith('schedule'),
    );
    expect(lastCancel, lessThan(firstSchedule));
    expect(notifications.pending.keys, contains(5));
    expect(
      notifications.pending.keys.where(isReminderId),
      hasLength(
        notifications.calls.where((c) => c.startsWith('schedule')).length,
      ),
    );
  });

  test('inexact by default, exact only when granted', () async {
    await reschedule();
    expect(notifications.scheduled.map((s) => s.mode).toSet(), {
      AndroidScheduleMode.inexactAllowWhileIdle,
    });

    notifications.exactAllowed = true;
    await reschedule();
    expect(notifications.scheduled.map((s) => s.mode).toSet(), {
      AndroidScheduleMode.exactAllowWhileIdle,
    });
  });

  test('suggests an amount without a fluid restriction', () async {
    await reschedule();
    expect(
      notifications.scheduled.first.body,
      l10n.nudgeReminderNotificationBody(250),
    );
  });

  test('fluid restriction: never an amount (F-28)', () async {
    await reschedule(
      today: const DayIntake(goalMl: 1500, loggedMl: 0, fluidRestricted: true),
      safety: const SafetyPolicy(restrictionMl: 1500),
    );
    expect(notifications.scheduled, isNotEmpty);
    for (final s in notifications.scheduled) {
      expect(s.body, l10n.reminderNotificationBody);
      expect(s.body, isNot(contains('ml')));
    }
  });

  test('goal reached: nothing more today (BR-09)', () async {
    await reschedule(today: const DayIntake(goalMl: 2000, loggedMl: 2000));
    final tomorrow = TZDateTime(jakarta, 2026, 10, 13);
    expect(notifications.scheduled, isNotEmpty);
    expect(
      notifications.scheduled.every((s) => !s.at.isBefore(tomorrow)),
      isTrue,
    );
  });

  test('channels: all six F-06 categories with localized names', () {
    final ar = lookupAppLocalizations(const Locale('ar'));
    expect(AppChannel.values.map((c) => c.id).toSet(), hasLength(6));
    for (final channel in AppChannel.values) {
      final android = channel.channel(ar);
      expect(android.name, isNotEmpty);
      expect(android.description, isNotEmpty);
    }
    expect(
      AppChannel.promotions.channel(l10n).name,
      l10n.notificationChannelPromotions,
    );
  });

  test('permissions are only requested when asked', () async {
    final permissions = NotificationPermissions(notifications);
    expect(notifications.calls, isEmpty);
    expect(await permissions.requestNotifications(), isTrue);
    expect(await permissions.requestExactAlarms(), isTrue);
    expect(notifications.calls, ['requestNotifications', 'requestExactAlarms']);
  });
}
