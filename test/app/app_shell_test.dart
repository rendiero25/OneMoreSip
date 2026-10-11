import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/app/app.dart';
import 'package:onemoresip/app/widgets/fab_log.dart';
import 'package:onemoresip/app/widgets/floating_nav_bar.dart';
import 'package:onemoresip/core/flags/feature_flag.dart';

import '../helpers/flags.dart';

void main() {
  testWidgets('navbar shows Home, Stats, Family, Me; tabs switch', (
    tester,
  ) async {
    await pumpWithFlags(tester, child: const App());
    await tester.pumpAndSettle();

    expect(find.byType(FloatingNavBar), findsOneWidget);
    for (final label in ['Home', 'Stats', 'Family', 'Me']) {
      expect(find.text(label), findsOneWidget, reason: label);
    }

    await tester.tap(find.text('Stats'));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('UI-09')), findsOneWidget);

    await tester.tap(find.text('Me'));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('UI-15')), findsOneWidget);
  });

  testWidgets('FAB opens the log sheet route', (tester) async {
    await pumpWithFlags(tester, child: const App());
    await tester.pumpAndSettle();

    await tester.tap(find.byType(FabLog));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('UI-04')), findsOneWidget);
  });

  testWidgets('Family tab is hidden when the family flag is off', (
    tester,
  ) async {
    final source = FakeFlagSource()
      ..rows = [FlagRow(key: FeatureFlag.family.key, enabled: false)];
    await pumpWithFlags(tester, child: const App(), source: source);
    await tester.pumpAndSettle();

    expect(find.text('Family'), findsNothing);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Me'), findsOneWidget);
  });
}
