import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/flags/feature_flag.dart';
import 'package:onemoresip/core/flags/feature_flags.dart';

/// Remote flag rows under test control.
class FakeFlagSource implements FlagSource {
  /// Rows returned by the next fetch; `null` = no remote.
  List<FlagRow>? rows;

  /// Thrown by the next fetch when set.
  Exception? error;

  /// Number of fetches so far.
  int fetches = 0;

  @override
  Future<List<FlagRow>?> fetch() async {
    fetches++;
    if (error case final error?) throw error;
    return rows;
  }
}

/// In-memory [FlagCache].
class MemoryFlagCache implements FlagCache {
  /// Cached value.
  CachedFlags? value;

  @override
  Future<CachedFlags?> read() async => value;

  @override
  Future<void> write(CachedFlags flags) async => value = flags;
}

/// Pumps [child] in a [ProviderScope] with [flagOverrides] plus
/// [overrides] and returns its container. The scope belongs to the widget
/// tree, so the 6 h refresh timer is cancelled when the test tears the
/// tree down.
Future<ProviderContainer> pumpWithFlags(
  WidgetTester tester, {
  Widget child = const SizedBox(),
  FlagSource? source,
  FlagCache? cache,
  List<Override> overrides = const [],
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        ...flagOverrides(source: source, cache: cache),
        ...overrides,
      ],
      child: child,
    ),
  );
  return ProviderScope.containerOf(tester.element(find.byWidget(child)));
}

/// Overrides that keep flag providers off platform channels.
List<Override> flagOverrides({FlagSource? source, FlagCache? cache}) => [
  flagSourceProvider.overrideWithValue(source ?? FakeFlagSource()),
  flagCacheProvider.overrideWithValue(cache ?? MemoryFlagCache()),
  buildInfoProvider.overrideWith(
    (ref) async => (platform: 'android', build: 10),
  ),
];
