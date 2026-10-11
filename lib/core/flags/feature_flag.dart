/// Kill switches for reviewed features (F-33, D-14, SC-01).
///
/// Every flag is ON unless the server turns it off. There is no flag that
/// starts OFF and no way for remote data to switch anything ON, so a flag
/// can never reveal functionality App Review has not seen.
library;

/// A reviewed feature that can be switched off remotely.
enum FeatureFlag {
  /// AI photo logging (F-18).
  aiPhoto('ai_photo'),

  /// Ask Sippy chat (F-20).
  aiChat('ai_chat'),

  /// AI weekly insight (F-19).
  aiInsight('ai_insight'),

  /// Family & caregiver (F-13).
  family('family'),

  /// Challenges (F-17).
  challenges('challenges'),

  /// Fasting Mode (F-10).
  fasting('fasting'),

  /// Weather-adaptive goal (F-09).
  weather('weather'),

  /// Apple Health / Health Connect sync (F-08).
  healthSync('health_sync'),

  /// Ads (F-24).
  ads('ads');

  new(this.key);

  /// Key in the `feature_flags` table (SD-4.1).
  final String key;
}

/// One row of the `feature_flags` table (SD-4.1).
class FlagRow {
  /// Creates a row.
  const new({
    required this.key,
    required this.enabled,
    this.minBuild,
    this.platforms,
  });

  /// Parses a row; throws [FormatException] on malformed data.
  factory fromJson(Map<String, Object?> json) {
    final key = json['key'];
    final enabled = json['enabled'];
    final minBuild = json['min_build'];
    final platforms = json['platforms'];
    if (key is! String ||
        enabled is! bool ||
        (minBuild != null && minBuild is! int) ||
        (platforms != null && platforms is! List)) {
      throw FormatException('Invalid feature_flags row', json);
    }
    return FlagRow(
      key: key,
      enabled: enabled,
      minBuild: minBuild as int?,
      platforms: (platforms as List?)?.cast<String>(),
    );
  }

  /// Flag key.
  final String key;

  /// `false` switches the feature off where this row applies.
  final bool enabled;

  /// Row applies to builds >= this number; `null` = all builds.
  final int? minBuild;

  /// Row applies to these platforms (`ios`, `android`); `null` = all.
  final List<String>? platforms;

  /// JSON form, as stored in the cache.
  Map<String, Object?> toJson() => {
    'key': key,
    'enabled': enabled,
    'min_build': minBuild,
    'platforms': platforms,
  };
}

/// Flags switched off by [rows] for this [platform] and [build].
///
/// Remote data can only remove features: `enabled: true` rows and unknown
/// keys change nothing.
Set<FeatureFlag> disabledFlags(
  Iterable<FlagRow> rows, {
  required String platform,
  required int build,
}) {
  final byKey = {for (final flag in FeatureFlag.values) flag.key: flag};
  return {
    for (final row in rows)
      if (!row.enabled &&
          byKey.containsKey(row.key) &&
          (row.platforms == null || row.platforms!.contains(platform)) &&
          (row.minBuild == null || build >= row.minBuild!))
        byKey[row.key]!,
  };
}
