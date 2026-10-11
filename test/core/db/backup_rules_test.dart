import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/db/database_providers.dart';

const _res = 'android/app/src/main/res/xml';

/// `<exclude>` paths in the `root` domain inside the [section] element of
/// [file] (or in the whole file when [section] is null).
Set<String> _excludedRootPaths(String file, [String? section]) {
  var xml = File('$_res/$file').readAsStringSync();
  if (section != null) {
    xml = RegExp(
      '<$section>(.*?)</$section>',
      dotAll: true,
    ).firstMatch(xml)!.group(1)!;
  }
  return {
    for (final m in RegExp(
      r'<exclude\s+domain="root"\s+path="([^"]+)"\s*/>',
    ).allMatches(xml))
      m.group(1)!,
  };
}

void main() {
  // drift_flutter's default: getApplicationDocumentsDirectory() is
  // <dataDir>/app_flutter on Android.
  final dbFiles = {
    for (final suffix in ['', '-journal', '-wal', '-shm'])
      'app_flutter/$databaseName.sqlite$suffix',
  };

  test('manifest points at both rule files', () {
    final manifest = File('android/app/src/main/AndroidManifest.xml')
        .readAsStringSync();
    expect(manifest, contains('android:fullBackupContent="@xml/backup_rules"'));
    expect(
      manifest,
      contains('android:dataExtractionRules="@xml/data_extraction_rules"'),
    );
    expect(manifest, isNot(contains('android:allowBackup')));
  });

  test('Android 11 and lower: DB files excluded from backup', () {
    expect(_excludedRootPaths('backup_rules.xml'), dbFiles);
  });

  test('Android 12+: DB files excluded from cloud backup and transfer', () {
    expect(
      _excludedRootPaths('data_extraction_rules.xml', 'cloud-backup'),
      dbFiles,
    );
    expect(
      _excludedRootPaths('data_extraction_rules.xml', 'device-transfer'),
      dbFiles,
    );
  });
}
