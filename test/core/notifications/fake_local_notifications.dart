import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:onemoresip/core/notifications/local_notifications.dart';
import 'package:timezone/timezone.dart';

/// A scheduled notification as the fake saw it.
typedef Scheduled = ({
  int id,
  TZDateTime at,
  String title,
  String body,
  NotificationDetails details,
  AndroidScheduleMode mode,
});

/// In-memory [LocalNotifications] that records every call.
class FakeLocalNotifications implements LocalNotifications {
  /// Creates the fake; [exactAllowed] is the `SCHEDULE_EXACT_ALARM` state.
  new({this.exactAllowed = false});

  /// Whether exact alarms are granted.
  bool exactAllowed;

  /// Pending notifications by id.
  final pending = <int, Scheduled>{};

  /// Created channels by id.
  final channels = <String, AndroidNotificationChannel>{};

  /// Every call in order, e.g. `cancel 1000` or `schedule 1000`.
  final calls = <String>[];

  /// Pending notifications sorted by id.
  List<Scheduled> get scheduled =>
      [...pending.values]..sort((a, b) => a.id.compareTo(b.id));

  @override
  Future<void> initialize() async => calls.add('initialize');

  @override
  Future<void> createChannel(AndroidNotificationChannel channel) async =>
      channels[channel.id] = channel;

  @override
  Future<List<int>> pendingIds() async => [...pending.keys];

  @override
  Future<void> cancel(int id) async {
    calls.add('cancel $id');
    pending.remove(id);
  }

  @override
  Future<void> schedule({
    required int id,
    required TZDateTime at,
    required String title,
    required String body,
    required NotificationDetails details,
    required AndroidScheduleMode mode,
  }) async {
    calls.add('schedule $id');
    pending[id] = (
      id: id,
      at: at,
      title: title,
      body: body,
      details: details,
      mode: mode,
    );
  }

  @override
  Future<bool> canScheduleExact() async => exactAllowed;

  @override
  Future<bool> requestNotificationsPermission() async {
    calls.add('requestNotifications');
    return true;
  }

  @override
  Future<bool> requestExactAlarmsPermission() async {
    calls.add('requestExactAlarms');
    return exactAllowed = true;
  }
}
