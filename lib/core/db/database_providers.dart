import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/core/db/db_key_store.dart';
import 'package:onemoresip/core/db/encryption.dart';

/// File name (without `.sqlite`) of the local DB. The Android backup rules in
/// `android/app/src/main/res/xml/` exclude it by this name (D-33).
const databaseName = 'onemoresip';

/// Source of the database key; overridden in tests.
final dbKeyStoreProvider = Provider<DbKeyStore>(
  (ref) => const SecureStorageDbKeyStore(),
);

/// The app's encrypted database, closed on dispose. It is excluded from
/// device backups (D-33): on Android by the backup rules, on iOS by living
/// in a directory marked excluded (Library/Application Support/db).
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final keyStore = ref.watch(dbKeyStoreProvider);
  final db = AppDatabase(
    DatabaseConnection.delayed(keyStore.readOrCreateKey().then(_open)),
  );
  ref.onDispose(db.close);
  return db;
});

// Top-level so the setup closure, which runs on drift's background isolate,
// captures nothing but the key. Android keeps drift_flutter's default
// directory (app_flutter/), which the backup rules name.
DatabaseConnection _open(String key) => driftDatabase(
  name: databaseName,
  native: DriftNativeOptions(
    databaseDirectory: Platform.isIOS ? _iosDatabaseDirectory : null,
    setup: (rawDb) => unlockDatabase(rawDb, key),
  ),
);

const _dbChannel = MethodChannel('app.onemoresip/db');

// Created and marked excluded from backup by ios/Runner/AppDelegate.swift.
Future<Object> _iosDatabaseDirectory() async =>
    (await _dbChannel.invokeMethod<String>('databaseDirectory'))!;
