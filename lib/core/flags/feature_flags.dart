import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:onemoresip/core/flags/feature_flag.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Reads the `feature_flags` table. `null` means no remote is configured.
abstract interface class FlagSource {
  /// Fetches all rows.
  Future<List<FlagRow>?> fetch();
}

/// Used until the Supabase table exists (T-004, T-060): no remote data,
/// every feature stays ON.
class NoRemoteFlagSource implements FlagSource {
  /// Creates the source.
  const new();

  @override
  Future<List<FlagRow>?> fetch() async => null;
}

/// Last fetched rows, kept so kill switches survive offline cold starts.
typedef CachedFlags = ({List<FlagRow> rows, DateTime fetchedAt});

/// Persists the last fetched rows.
abstract interface class FlagCache {
  /// Reads the cache; `null` when empty or unreadable.
  Future<CachedFlags?> read();

  /// Replaces the cache.
  Future<void> write(CachedFlags flags);
}

/// [FlagCache] on shared_preferences.
class SharedPreferencesFlagCache implements FlagCache {
  static const _key = 'feature_flags_v1';
  final _prefs = SharedPreferencesAsync();

  @override
  Future<CachedFlags?> read() async {
    final raw = await _prefs.getString(_key);
    if (raw == null) return null;
    try {
      if (jsonDecode(raw) case {
        'rows': final List<Object?> rows,
        'fetched_at': final String fetchedAt,
      }) {
        return (
          rows: [
            for (final row in rows)
              if (row is Map<String, Object?>)
                FlagRow.fromJson(row)
              else
                throw const FormatException('Invalid cached row'),
          ],
          fetchedAt: DateTime.parse(fetchedAt),
        );
      }
      return null;
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> write(CachedFlags flags) => _prefs.setString(
    _key,
    jsonEncode({
      'rows': [for (final row in flags.rows) row.toJson()],
      'fetched_at': flags.fetchedAt.toIso8601String(),
    }),
  );
}

/// Platform and build number the flag rows are matched against.
typedef BuildInfo = ({String platform, int build});

/// Source of `feature_flags` rows; replaced with Supabase in T-060.
final flagSourceProvider = Provider<FlagSource>(
  (ref) => const NoRemoteFlagSource(),
);

/// Cache for the last fetched rows.
final flagCacheProvider = Provider<FlagCache>(
  (ref) => SharedPreferencesFlagCache(),
);

/// Current platform and build number.
final buildInfoProvider = FutureProvider<BuildInfo>((ref) async {
  final info = await PackageInfo.fromPlatform();
  return (
    platform: defaultTargetPlatform.name,
    build: int.tryParse(info.buildNumber) ?? 0,
  );
});

/// Clock, overridable in tests.
final clockProvider = Provider<DateTime Function()>((ref) => DateTime.now);

/// Disabled features. Starts empty (all ON); loads the cache, then fetches
/// at start, every 6 h and on resume when stale (SD-11). Failures keep the
/// last known state.
class FeatureFlags extends Notifier<Set<FeatureFlag>> {
  /// How often flags are re-fetched.
  static const refreshInterval = Duration(hours: 6);

  DateTime? _fetchedAt;

  @override
  Set<FeatureFlag> build() {
    final timer = Timer.periodic(refreshInterval, (_) => unawaited(refresh()));
    final lifecycle = AppLifecycleListener(onResume: _refreshIfStale);
    ref.onDispose(() {
      timer.cancel();
      lifecycle.dispose();
    });
    unawaited(_start());
    return const {};
  }

  /// Fetches the rows now.
  Future<void> refresh() async {
    try {
      final rows = await ref.read(flagSourceProvider).fetch();
      if (rows == null || !ref.mounted) return;
      final now = ref.read(clockProvider)();
      _fetchedAt = now;
      await _apply(rows);
      await ref.read(flagCacheProvider).write((rows: rows, fetchedAt: now));
    } on Exception catch (error) {
      debugPrint('Feature flags fetch failed, keeping last state: $error');
    }
  }

  Future<void> _start() async {
    try {
      final cached = await ref.read(flagCacheProvider).read();
      if (cached != null && ref.mounted) {
        _fetchedAt = cached.fetchedAt;
        await _apply(cached.rows);
      }
    } on Exception catch (error) {
      debugPrint('Feature flags cache unreadable: $error');
    }
    await refresh();
  }

  void _refreshIfStale() {
    final fetchedAt = _fetchedAt;
    final now = ref.read(clockProvider)();
    if (fetchedAt == null || now.difference(fetchedAt) >= refreshInterval) {
      unawaited(refresh());
    }
  }

  Future<void> _apply(List<FlagRow> rows) async {
    final info = await ref.read(buildInfoProvider.future);
    if (!ref.mounted) return;
    state = disabledFlags(rows, platform: info.platform, build: info.build);
  }
}

/// Disabled features (F-33).
final featureFlagsProvider = NotifierProvider<FeatureFlags, Set<FeatureFlag>>(
  FeatureFlags.new,
);

/// Whether [FeatureFlag]'s feature is available.
final ProviderFamily<bool, FeatureFlag> isFeatureEnabledProvider =
    Provider.family<bool, FeatureFlag>(
      (ref, flag) => !ref.watch(featureFlagsProvider).contains(flag),
    );

/// Shows [child] only while [flag] is on; otherwise [fallback].
class FeatureGate extends ConsumerWidget {
  /// Creates a gate.
  const new({
    required this.flag,
    required this.child,
    this.fallback = const SizedBox.shrink(),
    super.key,
  });

  /// Feature that must be on.
  final FeatureFlag flag;

  /// Shown while the feature is on.
  final Widget child;

  /// Shown while the feature is off.
  final Widget fallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(isFeatureEnabledProvider(flag)) ? child : fallback;
}
