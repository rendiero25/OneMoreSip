import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final manifest = File('android/app/src/main/AndroidManifest.xml')
      .readAsStringSync();
  final permissions = {
    for (final m in RegExp(
      r'<uses-permission\s+android:name="android\.permission\.(\w+)"',
    ).allMatches(manifest))
      m.group(1)!,
  };

  test('declares exactly the approved permissions (T-041, D-37)', () {
    expect(permissions, {
      'POST_NOTIFICATIONS',
      'RECEIVE_BOOT_COMPLETED',
      'SCHEDULE_EXACT_ALARM',
    });
  });

  test('never USE_EXACT_ALARM (SC-22) or battery exemption (SC-28)', () {
    expect(manifest, isNot(contains('USE_EXACT_ALARM')));
    expect(manifest, isNot(contains('REQUEST_IGNORE_BATTERY_OPTIMIZATIONS')));
  });

  test('scheduled and boot receivers are declared, not exported', () {
    for (final receiver in [
      'ScheduledNotificationReceiver',
      'ScheduledNotificationBootReceiver',
    ]) {
      expect(
        manifest,
        contains(
          '<receiver android:exported="false" '
          'android:name="com.dexterous.flutterlocalnotifications.$receiver"',
        ),
      );
    }
    for (final action in [
      'android.intent.action.BOOT_COMPLETED',
      'android.intent.action.MY_PACKAGE_REPLACED',
    ]) {
      expect(manifest, contains('<action android:name="$action"/>'));
    }
  });

  test('keeps the D-33 backup rules', () {
    expect(manifest, contains('android:fullBackupContent="@xml/backup_rules"'));
    expect(
      manifest,
      contains('android:dataExtractionRules="@xml/data_extraction_rules"'),
    );
  });
}
