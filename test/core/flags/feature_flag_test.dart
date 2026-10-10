import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/flags/feature_flag.dart';

Set<FeatureFlag> _disabled(List<FlagRow> rows) =>
    disabledFlags(rows, platform: 'android', build: 10);

void main() {
  test('every feature is on without remote rows', () {
    expect(_disabled([]), isEmpty);
  });

  test('a disabled row switches its feature off', () {
    expect(_disabled([const FlagRow(key: 'ai_chat', enabled: false)]), {
      FeatureFlag.aiChat,
    });
  });

  test('remote data can never switch a feature on (D-14, SC-01)', () {
    final rows = [
      for (final flag in FeatureFlag.values)
        FlagRow(key: flag.key, enabled: true),
      const FlagRow(key: 'unreleased_feature', enabled: true),
    ];
    expect(_disabled(rows), isEmpty);
  });

  test('unknown keys are ignored', () {
    expect(
      _disabled([const FlagRow(key: 'unreleased_feature', enabled: false)]),
      isEmpty,
    );
  });

  test('platforms limit where a row applies', () {
    const iosOnly = FlagRow(key: 'ads', enabled: false, platforms: ['ios']);
    expect(_disabled([iosOnly]), isEmpty);
    expect(disabledFlags([iosOnly], platform: 'ios', build: 10), {
      FeatureFlag.ads,
    });
  });

  test('min_build: a row applies to builds at or above it', () {
    expect(
      _disabled([const FlagRow(key: 'fasting', enabled: false, minBuild: 11)]),
      isEmpty,
    );
    expect(
      _disabled([const FlagRow(key: 'fasting', enabled: false, minBuild: 10)]),
      {FeatureFlag.fasting},
    );
  });

  test('parses table rows and rejects malformed ones', () {
    final row = FlagRow.fromJson({
      'key': 'ads',
      'enabled': false,
      'min_build': 3,
      'platforms': ['android'],
    });
    expect(row.toJson(), {
      'key': 'ads',
      'enabled': false,
      'min_build': 3,
      'platforms': ['android'],
    });
    expect(
      () => FlagRow.fromJson({'key': 'ads', 'enabled': 'no'}),
      throwsFormatException,
    );
  });
}
