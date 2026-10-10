import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/app/app.dart';
import 'package:onemoresip/app/router.dart';
import 'package:onemoresip/core/flags/feature_flag.dart';
import 'package:onemoresip/core/flags/feature_flags.dart';

import '../../helpers/flags.dart';

const _chatOff = [FlagRow(key: 'ai_chat', enabled: false)];

void main() {
  testWidgets('fetches at start and switches features off', (tester) async {
    final source = FakeFlagSource()..rows = _chatOff;
    final container = await pumpWithFlags(tester, source: source);

    expect(container.read(featureFlagsProvider), isEmpty);
    await tester.pumpAndSettle();

    expect(container.read(featureFlagsProvider), {FeatureFlag.aiChat});
    expect(
      container.read(isFeatureEnabledProvider(FeatureFlag.aiChat)),
      isFalse,
    );
    expect(
      container.read(isFeatureEnabledProvider(FeatureFlag.aiPhoto)),
      isTrue,
    );
  });

  testWidgets('uses the cache when the fetch fails', (tester) async {
    final cache = MemoryFlagCache()
      ..value = (rows: _chatOff, fetchedAt: DateTime(2026));
    final source = FakeFlagSource()..error = Exception('offline');
    final container = await pumpWithFlags(tester, source: source, cache: cache);

    container.read(featureFlagsProvider);
    await tester.pumpAndSettle();

    expect(source.fetches, 1);
    expect(container.read(featureFlagsProvider), {FeatureFlag.aiChat});
  });

  testWidgets('refreshes every 6 hours and caches the result', (tester) async {
    final source = FakeFlagSource();
    final cache = MemoryFlagCache();
    final container = await pumpWithFlags(tester, source: source, cache: cache);

    container.read(featureFlagsProvider);
    await tester.pumpAndSettle();
    expect(source.fetches, 1);

    source.rows = _chatOff;
    await tester.pump(FeatureFlags.refreshInterval);
    await tester.pumpAndSettle();

    expect(source.fetches, 2);
    expect(container.read(featureFlagsProvider), {FeatureFlag.aiChat});
    expect(cache.value?.rows.single.key, 'ai_chat');
  });

  testWidgets('FeatureGate hides a switched-off feature', (tester) async {
    final source = FakeFlagSource();
    final container = await pumpWithFlags(
      tester,
      source: source,
      child: const MaterialApp(
        home: FeatureGate(flag: FeatureFlag.aiChat, child: Text('chat')),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('chat'), findsOneWidget);

    source.rows = _chatOff;
    await container.read(featureFlagsProvider.notifier).refresh();
    await tester.pumpAndSettle();

    expect(find.text('chat'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a switched-off route redirects to Home, also while open', (
    tester,
  ) async {
    final source = FakeFlagSource();
    final container = await pumpWithFlags(
      tester,
      source: source,
      child: const App(),
    );
    await tester.pumpAndSettle();

    final router = container.read(routerProvider)..go(Routes.aiChat);
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('UI-07')), findsOneWidget);

    source.rows = _chatOff;
    await container.read(featureFlagsProvider.notifier).refresh();
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('UI-03')), findsOneWidget);

    router.go(Routes.aiChat);
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('UI-03')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
