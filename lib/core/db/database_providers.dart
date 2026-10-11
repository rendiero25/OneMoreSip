import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/core/db/db_key_store.dart';
import 'package:onemoresip/core/db/encryption.dart';

/// Source of the database key; overridden in tests.
final dbKeyStoreProvider = Provider<DbKeyStore>(
  (ref) => const SecureStorageDbKeyStore(),
);

/// The app's encrypted database in the documents directory, closed on
/// dispose.
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final keyStore = ref.watch(dbKeyStoreProvider);
  final db = AppDatabase(
    DatabaseConnection.delayed(keyStore.readOrCreateKey().then(_open)),
  );
  ref.onDispose(db.close);
  return db;
});

// Top-level so the setup closure, which runs on drift's background isolate,
// captures nothing but the key.
DatabaseConnection _open(String key) => driftDatabase(
  name: 'onemoresip',
  native: DriftNativeOptions(setup: (rawDb) => unlockDatabase(rawDb, key)),
);
