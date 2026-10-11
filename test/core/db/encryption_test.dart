import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/core/db/encryption.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  final keyA = 'a1' * 32;
  final keyB = 'b2' * 32;
  const marker = 'SippyMarker7f3c';

  late Directory dir;
  late File file;

  setUp(() {
    dir = Directory.systemTemp.createTempSync('onemoresip_db_');
    file = File('${dir.path}/test.sqlite');
  });
  tearDown(() => dir.deleteSync(recursive: true));

  AppDatabase open({String? key}) => AppDatabase(
    NativeDatabase(
      file,
      setup: key == null ? null : (db) => unlockDatabase(db, key),
    ),
  );

  Future<void> insertMarker() async {
    final db = open(key: keyA);
    await db
        .into(db.profiles)
        .insert(
          ProfilesCompanion.insert(
            id: '0192f0c0-0000-7000-8000-000000000001',
            accountId: 'guest',
            kind: 'main',
            displayName: marker,
            timezone: 'Asia/Jakarta',
            updatedAt: DateTime.utc(2026, 10, 11),
          ),
        );
    await db.close();
  }

  test('row is readable again with the same key', () async {
    await insertMarker();
    final db = open(key: keyA);
    addTearDown(db.close);
    final rows = await db.select(db.profiles).get();
    expect(rows.single.displayName, marker);
  });

  test('a different key cannot open the file', () async {
    await insertMarker();
    final db = open(key: keyB);
    addTearDown(db.close);
    await expectLater(db.select(db.profiles).get(), throwsA(_notADatabase));
  });

  test('no key cannot open the file', () async {
    await insertMarker();
    final db = open();
    addTearDown(db.close);
    await expectLater(db.select(db.profiles).get(), throwsA(_notADatabase));
  });

  test('file has no plaintext header or content', () async {
    await insertMarker();
    final bytes = file.readAsBytesSync();
    expect(bytes, isNotEmpty);
    final text = latin1.decode(bytes);
    expect(text.startsWith('SQLite format 3'), isFalse);
    expect(text.contains(marker), isFalse);
  });

  test('rejects keys that are not 64 hex characters', () async {
    final db = open(key: "x'; --");
    addTearDown(db.close);
    await expectLater(db.select(db.profiles).get(), throwsArgumentError);
  });
}

// SQLITE_NOTADB: the file cannot be decrypted.
final TypeMatcher<SqliteException> _notADatabase = isA<SqliteException>()
    .having((e) => e.resultCode, 'resultCode', 26);
