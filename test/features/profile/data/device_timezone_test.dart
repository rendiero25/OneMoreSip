import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/features/profile/data/device_timezone.dart';

void main() {
  test('whole-hour offsets map to Etc/GMT with the IANA sign', () {
    expect(timezoneForOffset(const Duration(hours: 7)), 'Etc/GMT-7');
    expect(timezoneForOffset(const Duration(hours: -3)), 'Etc/GMT+3');
    expect(timezoneForOffset(const Duration(hours: 14)), 'Etc/GMT-14');
  });

  test('zero and non-whole-hour offsets fall back to UTC', () {
    expect(timezoneForOffset(Duration.zero), 'UTC');
    expect(timezoneForOffset(const Duration(hours: 5, minutes: 30)), 'UTC');
    expect(timezoneForOffset(const Duration(hours: -9, minutes: -30)), 'UTC');
  });

  test('deviceTimezone returns a name', () {
    expect(deviceTimezone(), anyOf('UTC', startsWith('Etc/GMT')));
  });

  group('deviceIanaTimezone', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    const channel = MethodChannel('flutter_timezone');
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    tearDown(() => messenger.setMockMethodCallHandler(channel, null));

    test('is the IANA zone the device reports', () async {
      messenger.setMockMethodCallHandler(
        channel,
        (call) async => 'Asia/Jakarta',
      );
      expect(await deviceIanaTimezone(), 'Asia/Jakarta');
    });

    test('falls back to the offset zone without the plugin', () async {
      expect(await deviceIanaTimezone(), deviceTimezone());
    });
  });

  test('isOffsetTimezone spots the fallback names only', () {
    expect(isOffsetTimezone('Etc/GMT-7'), isTrue);
    expect(isOffsetTimezone('UTC'), isTrue);
    expect(isOffsetTimezone('Asia/Jakarta'), isFalse);
  });
}
