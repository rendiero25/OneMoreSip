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
}
