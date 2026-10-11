import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/db/db_key_store.dart';

void main() {
  setUp(() => FlutterSecureStorage.setMockInitialValues({}));

  test('creates a 64-hex-char key once and returns it afterwards', () async {
    const store = SecureStorageDbKeyStore();
    final first = await store.readOrCreateKey();
    expect(first, matches(RegExp(r'^[0-9a-f]{64}$')));

    final second = await const SecureStorageDbKeyStore().readOrCreateKey();
    expect(second, first);
    expect(await const FlutterSecureStorage().readAll(), hasLength(1));
  });

  test('keys differ between installs', () async {
    final first = await const SecureStorageDbKeyStore().readOrCreateKey();
    FlutterSecureStorage.setMockInitialValues({});
    final second = await const SecureStorageDbKeyStore().readOrCreateKey();
    expect(second, isNot(first));
  });
}
