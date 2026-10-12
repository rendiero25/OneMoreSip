import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/core/db/database_providers.dart';
import 'package:onemoresip/core/notifications/local_notifications.dart';
import 'package:onemoresip/core/notifications/reminder_replan.dart';
import 'package:onemoresip/features/profile/data/device_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:workmanager/workmanager.dart';

/// Unique name of the daily WorkManager re-plan (SD-8).
const dailyReplanTask = 'reminders_daily_replan';

/// Re-plans reminders on this device. Android only for now; iOS
/// scheduling (64 pending limit, BGAppRefresh) is T-042.
Future<void> replanOnDevice(
  AppDatabase db,
  LocalNotifications notifications,
) async {
  if (defaultTargetPlatform != TargetPlatform.android) return;
  _loadTimeZones();
  await replanReminders(
    db: db,
    notifications: notifications,
    deviceTimeZone: await deviceIanaTimezone(),
  );
}

var _timeZonesLoaded = false;

void _loadTimeZones() {
  if (_timeZonesLoaded) return;
  // All zones incl. old aliases (e.g. Asia/Calcutta) that devices report.
  tzdata.initializeTimeZones();
  _timeZonesLoaded = true;
}

/// WorkManager entry point: re-plans once a day in a background isolate,
/// which also restores reminders after a reboot or app update (SD-8).
@pragma('vm:entry-point')
void reminderCallbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // Same providers as the app, so the DB opens with the same key logic.
    final container = ProviderContainer();
    try {
      await replanOnDevice(
        container.read(appDatabaseProvider),
        container.read(localNotificationsProvider),
      );
      return true;
    } finally {
      container.dispose();
    }
  });
}

/// Keeps reminders planned while the app runs: re-plans on start and on
/// every resume (which also picks up a changed device time zone, logs
/// and settings), and registers the daily background re-plan.
class ReminderReplanner extends ConsumerStatefulWidget {
  /// Wraps [child].
  const new({required this.child, super.key});

  /// The app.
  final Widget child;

  @override
  ConsumerState<ReminderReplanner> createState() => _ReminderReplannerState();
}

class _ReminderReplannerState extends ConsumerState<ReminderReplanner> {
  late final AppLifecycleListener _lifecycle;
  Future<void> _queue = Future.value();

  @override
  void initState() {
    super.initState();
    _lifecycle = AppLifecycleListener(onResume: _replan);
    if (defaultTargetPlatform != TargetPlatform.android) return;
    _replan();
    unawaited(_registerDailyReplan());
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  // One re-plan at a time; failures are reported, never thrown at the UI.
  void _replan() {
    _queue = _queue
        .then(
          (_) => replanOnDevice(
            ref.read(appDatabaseProvider),
            ref.read(localNotificationsProvider),
          ),
        )
        .catchError(_report);
  }

  Future<void> _registerDailyReplan() async {
    try {
      await Workmanager().initialize(reminderCallbackDispatcher);
      await Workmanager().registerPeriodicTask(
        dailyReplanTask,
        dailyReplanTask,
        frequency: const Duration(days: 1),
        existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
      );
    } on Object catch (error, stack) {
      _report(error, stack);
    }
  }

  void _report(Object error, StackTrace stack) => FlutterError.reportError(
    FlutterErrorDetails(exception: error, stack: stack, library: 'reminders'),
  );

  @override
  Widget build(BuildContext context) => widget.child;
}
