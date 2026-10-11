import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/app/app.dart';
import 'package:onemoresip/app/router.dart';
import 'package:onemoresip/core/sippy/sippy.dart';
import 'package:onemoresip/core/sippy/sippy_state.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

import '../../helpers/flags.dart';

void main() {
  test('every state has a static SVG fallback', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    for (final state in SippyState.values) {
      final svg = await rootBundle.loadString(Sippy.assetFor(state));
      expect(svg, startsWith('<svg'), reason: state.name);
    }
  });

  testWidgets('Sippy exposes a localized screen-reader label', (tester) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('id'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Sippy(state: SippyState.happy),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.bySemanticsLabel('Sippy senang'), findsOneWidget);
    handle.dispose();
  });

  testWidgets('debug screen reaches every state', (tester) async {
    final container = await pumpWithFlags(tester, child: const App());
    await tester.pumpAndSettle();
    container.read(routerProvider).go(Routes.debugSippy);
    await tester.pumpAndSettle();

    for (final state in SippyState.values) {
      expect(find.byKey(ValueKey(state)), findsOneWidget, reason: state.name);
    }
    expect(find.byType(SvgPicture), findsNWidgets(SippyState.values.length));
    expect(tester.takeException(), isNull);
  });
}
