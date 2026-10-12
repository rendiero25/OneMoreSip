import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/timezone.dart';

/// The parts of `flutter_local_notifications` the app uses, behind an
/// interface so tests run without platform channels (SD-8).
abstract interface class LocalNotifications {
  /// Initializes the plugin; never asks for any permission.
  Future<void> initialize();

  /// Creates or updates an Android notification channel.
  Future<void> createChannel(AndroidNotificationChannel channel);

  /// Ids of all scheduled notifications that have not fired yet.
  Future<List<int>> pendingIds();

  /// Cancels the notification [id].
  Future<void> cancel(int id);

  /// Schedules a notification at [at].
  Future<void> schedule({
    required int id,
    required TZDateTime at,
    required String title,
    required String body,
    required NotificationDetails details,
    required AndroidScheduleMode mode,
  });

  /// Whether exact alarms may be used (`SCHEDULE_EXACT_ALARM` granted).
  Future<bool> canScheduleExact();

  /// Shows the Android 13+ notification permission prompt.
  Future<bool> requestNotificationsPermission();

  /// Opens the system screen to grant `SCHEDULE_EXACT_ALARM`.
  Future<bool> requestExactAlarmsPermission();
}

/// [LocalNotifications] on Android via `flutter_local_notifications`.
class PluginLocalNotifications implements LocalNotifications {
  /// Creates the wrapper around [_plugin].
  new([FlutterLocalNotificationsPlugin? plugin])
    : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;

  AndroidFlutterLocalNotificationsPlugin? get _android => _plugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();

  @override
  Future<void> initialize() => _plugin.initialize(
    // The launcher icon until a monochrome notification icon exists.
    settings: const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    ),
  );

  @override
  Future<void> createChannel(AndroidNotificationChannel channel) async =>
      await _android?.createNotificationChannel(channel);

  @override
  Future<List<int>> pendingIds() async => [
    for (final request in await _plugin.pendingNotificationRequests())
      request.id,
  ];

  @override
  Future<void> cancel(int id) => _plugin.cancel(id: id);

  @override
  Future<void> schedule({
    required int id,
    required TZDateTime at,
    required String title,
    required String body,
    required NotificationDetails details,
    required AndroidScheduleMode mode,
  }) => _plugin.zonedSchedule(
    id: id,
    scheduledDate: at,
    title: title,
    body: body,
    notificationDetails: details,
    androidScheduleMode: mode,
  );

  @override
  Future<bool> canScheduleExact() async =>
      await _android?.canScheduleExactNotifications() ?? false;

  @override
  Future<bool> requestNotificationsPermission() async =>
      await _android?.requestNotificationsPermission() ?? false;

  @override
  Future<bool> requestExactAlarmsPermission() async =>
      await _android?.requestExactAlarmsPermission() ?? false;
}

/// The app's [LocalNotifications]; overridden in tests.
final localNotificationsProvider = Provider<LocalNotifications>(
  (ref) => PluginLocalNotifications(),
);
