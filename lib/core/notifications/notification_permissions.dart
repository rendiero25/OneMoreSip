import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/core/notifications/local_notifications.dart';

/// Notification permissions, asked only from a primer screen the user
/// opened (onboarding T-030, reminder settings T-046), never on app start
/// (D-37). Re-plan reminders after a grant so the new mode applies.
class NotificationPermissions {
  /// Creates the permissions helper over [_notifications].
  const new(this._notifications);

  final LocalNotifications _notifications;

  /// Shows the system prompt for `POST_NOTIFICATIONS` (Android 13+);
  /// true when notifications may be shown.
  Future<bool> requestNotifications() =>
      _notifications.requestNotificationsPermission();

  /// Opens the system "Alarms & reminders" screen after the in-app
  /// rationale (SC-22); true when exact alarms are allowed.
  Future<bool> requestExactAlarms() =>
      _notifications.requestExactAlarmsPermission();
}

/// The app's [NotificationPermissions].
final notificationPermissionsProvider = Provider<NotificationPermissions>(
  (ref) => NotificationPermissions(ref.watch(localNotificationsProvider)),
);
