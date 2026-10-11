import 'package:sqlite3/common.dart';

/// Unlocks [db] with [key]; must run before any other statement (D-32).
///
/// Throws when the linked SQLite has no encryption support (so data is never
/// written in plaintext) or when [key] does not decrypt an existing file.
/// Error messages never contain the key.
void unlockDatabase(CommonDatabase db, String key) {
  // PRAGMA arguments cannot be bound, so only hex keys are interpolated.
  if (!RegExp(r'^[0-9a-f]{64}$').hasMatch(key)) {
    throw ArgumentError('Database key must be 64 lowercase hex characters');
  }
  try {
    db.execute("PRAGMA key = '$key'");
  } on SqliteException catch (error) {
    // The exception's statement would include the key.
    throw StateError('Setting the database key failed (${error.resultCode})');
  }
  if (db.select('PRAGMA cipher').isEmpty) {
    throw StateError('SQLite3MultipleCiphers is not linked, see D-32');
  }
  // Fails with SQLITE_NOTADB when the key is wrong.
  db.select('SELECT count(*) FROM sqlite_master');
}
