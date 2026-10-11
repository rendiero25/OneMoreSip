import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Holds the local database encryption key (SD-7).
abstract interface class DbKeyStore {
  /// Returns the stored key, creating and storing one on first use.
  Future<String> readOrCreateKey();
}

/// [DbKeyStore] in the Keychain (iOS) or Keystore-backed storage (Android).
class SecureStorageDbKeyStore implements DbKeyStore {
  /// Creates the store on the given secure storage.
  const new([
    this._storage = const FlutterSecureStorage(
      // Not synced to iCloud and not restored onto another device.
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    ),
  ]);

  static const _name = 'local_db_key_v1';

  final FlutterSecureStorage _storage;

  @override
  Future<String> readOrCreateKey() async {
    final existing = await _storage.read(key: _name);
    if (existing != null) return existing;
    final random = Random.secure();
    final key = [
      for (var i = 0; i < 32; i++)
        random.nextInt(256).toRadixString(16).padLeft(2, '0'),
    ].join();
    await _storage.write(key: _name, value: key);
    return key;
  }
}
