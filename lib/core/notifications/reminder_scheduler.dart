import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:onemoresip/core/notifications/local_notifications.dart';
import 'package:onemoresip/core/notifications/notification_channels.dart';
import 'package:onemoresip/features/reminders/domain/reminder_planner.dart';
import 'package:onemoresip/features/safety/domain/safety_policy.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';
import 'package:timezone/timezone.dart';

/// First notification id of drink reminders. Ids [reminderIdBase] to
/// `reminderIdBase + reminderIdCount - 1` belong to drink reminders only.
const reminderIdBase = 1000;

/// Size of the drink reminder id range (the planner's 36 h stay far below).
const reminderIdCount = 100;

/// Whether [id] is a drink reminder's notification id.
bool isReminderId(int id) =>
    id >= reminderIdBase && id < reminderIdBase + reminderIdCount;

/// Replaces the scheduled drink reminders with a fresh plan (SD-8, T-041).
///
/// Content is built on the device and never leaves it; nothing here is
/// sent to analytics (SD-9).
class ReminderScheduler {
  /// Creates a scheduler posting through [_notifications].
  const new(this._notifications);

  final LocalNotifications _notifications;

  /// Cancels the previous reminders and schedules [planReminders] for
  /// [settings] and [today] on the drink reminders channel. Uses exact
  /// alarms only when the user granted `SCHEDULE_EXACT_ALARM`, otherwise
  /// inexact ones (SC-22, D-37). Under a fluid restriction ([safety]) the
  /// text never names an amount (F-28, D-34).
  Future<void> reschedule({
    required ReminderSettings settings,
    required DayIntake today,
    required SafetyPolicy safety,
    required Location location,
    required TZDateTime now,
    required AppLocalizations l10n,
  }) async {
    final planned = planReminders(
      settings: settings,
      location: location,
      now: now,
      today: today,
    ).take(reminderIdCount).toList();

    for (final id in await _notifications.pendingIds()) {
      if (isReminderId(id)) await _notifications.cancel(id);
    }

    final mode = await _notifications.canScheduleExact()
        ? AndroidScheduleMode.exactAllowWhileIdle
        : AndroidScheduleMode.inexactAllowWhileIdle;
    final channel = AppChannel.reminders.channel(l10n);
    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        category: AndroidNotificationCategory.reminder,
      ),
    );

    for (final (i, reminder) in planned.indexed) {
      final ml = reminder.suggestedMl;
      final body = ml == null
          ? null
          : safety.drinkMoreCopy(() => l10n.nudgeReminderNotificationBody(ml));
      await _notifications.schedule(
        id: reminderIdBase + i,
        at: reminder.at,
        title: l10n.reminderNotificationTitle,
        body: body ?? l10n.reminderNotificationBody,
        details: details,
        mode: mode,
      );
    }
  }
}
