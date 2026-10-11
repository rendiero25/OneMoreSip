import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/db/database_providers.dart';

const _res = 'android/app/src/main/res/xml';

/// `<exclude>` paths in the [domain] inside the [section] element of
/// [file] (or in the whole file when [section] is null).
Set<String> _excluded(String file, String domain, [String? section]) {
  var xml = File('$_res/$file').readAsStringSync();
  if (section != null) {
    xml = RegExp(
      '<$section>(.*?)</$section>',
      dotAll: true,
    ).firstMatch(xml)!.group(1)!;
  }
  return {
    for (final m in RegExp(
      '<exclude\\s+domain="$domain"\\s+path="([^"]+)"\\s*/>',
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

  // flutter_secure_storage keeps the DB key in these prefs, encrypted with a
  // Keystore key that is never restored.
  const keyPrefs = {'FlutterSecureStorage.xml', 'FlutterSecureKeyStorage.xml'};

  test('Android 11 and lower: DB files and key prefs excluded', () {
    expect(_excluded('backup_rules.xml', 'root'), dbFiles);
    expect(_excluded('backup_rules.xml', 'sharedpref'), keyPrefs);
  });

  test('Android 12+: DB files and key prefs excluded everywhere', () {
    for (final section in ['cloud-backup', 'device-transfer']) {
      expect(
        _excluded('data_extraction_rules.xml', 'root', section),
        dbFiles,
        reason: section,
      );
      expect(
        _excluded('data_extraction_rules.xml', 'sharedpref', section),
        keyPrefs,
        reason: section,
      );
    }
  });
}
