import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/app/app.dart';
import 'package:onemoresip/app/widgets/fab_log.dart';
import 'package:onemoresip/app/widgets/floating_nav_bar.dart';
import 'package:onemoresip/core/flags/feature_flag.dart';
import 'package:onemoresip/features/logging/presentation/log_sheet.dart';

import '../helpers/database.dart';
import '../helpers/flags.dart';
import '../helpers/logging.dart';

void main() {
  testWidgets('navbar shows Home, Stats, Family, Me; tabs switch', (
    tester,
  ) async {
    await pumpWithFlags(
      tester,
      child: const App(),
      overrides: loggingOverrides(memoryDatabase()),
    );
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
    await unmountApp(tester);
  });

  testWidgets('FAB opens the log sheet over the current tab', (tester) async {
    await pumpWithFlags(
      tester,
      child: const App(),
      overrides: loggingOverrides(memoryDatabase()),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(FabLog));
    await tester.pumpAndSettle();
    expect(find.byType(LogSheet), findsOneWidget);
    expect(find.text('Add a drink'), findsOneWidget);
    expect(find.byKey(const ValueKey('UI-03')), findsOneWidget);
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
