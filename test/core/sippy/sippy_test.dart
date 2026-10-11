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

/// Sippy in [state] inside a localized app, optionally with Reduce Motion.
Widget _app(SippyState state, {bool reduceMotion = false}) => MaterialApp(
  locale: const Locale('id'),
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: Builder(
    builder: (context) => MediaQuery(
      data: MediaQuery.of(context).copyWith(disableAnimations: reduceMotion),
      child: Center(child: Sippy(state: state)),
    ),
  ),
);

String _shownAsset(WidgetTester tester) {
  final picture = tester.widget<SvgPicture>(find.byType(SvgPicture));
  return (picture.bytesLoader as SvgAssetLoader).assetName;
}

double _lift(WidgetTester tester) {
  final transform = tester.widget<Transform>(
    find
        .descendant(of: find.byType(Sippy), matching: find.byType(Transform))
        .first,
  );
  return transform.transform.getTranslation().y;
}

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
    await tester.pumpWidget(_app(SippyState.happy));
    await tester.pump(const Duration(seconds: 1));

    expect(find.bySemanticsLabel('Sippy senang'), findsOneWidget);
    handle.dispose();
  });

  testWidgets('idle bob runs when motion is allowed', (tester) async {
    await tester.pumpWidget(_app(SippyState.fresh));
    final start = _lift(tester);
    await tester.pump(const Duration(milliseconds: 800));

    expect(tester.hasRunningAnimations, isTrue);
    expect(_lift(tester), isNot(start));
  });

  testWidgets('state change swaps the art', (tester) async {
    await tester.pumpWidget(_app(SippyState.fresh));
    await tester.pumpWidget(_app(SippyState.happy));
    await tester.pump(const Duration(milliseconds: 300));

    expect(_shownAsset(tester), Sippy.assetFor(SippyState.happy));
  });

  testWidgets('Reduce Motion shows only the static art', (tester) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(_app(SippyState.fresh, reduceMotion: true));
    await tester.pump();

    expect(tester.hasRunningAnimations, isFalse);
    expect(find.byType(AnimatedSwitcher), findsNothing);
    expect(_shownAsset(tester), Sippy.assetFor(SippyState.fresh));
    expect(find.bySemanticsLabel('Sippy terlihat segar'), findsOneWidget);

    await tester.pumpWidget(_app(SippyState.happy, reduceMotion: true));
    await tester.pump();

    expect(tester.hasRunningAnimations, isFalse);
    expect(_shownAsset(tester), Sippy.assetFor(SippyState.happy));
    handle.dispose();
  });

  testWidgets('debug screen reaches every state', (tester) async {
    final container = await pumpWithFlags(tester, child: const App());
    await tester.pump(const Duration(seconds: 1));
    container.read(routerProvider).go(Routes.debugSippy);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    for (final state in SippyState.values) {
      expect(find.byKey(ValueKey(state)), findsOneWidget, reason: state.name);
    }
    expect(find.byType(SvgPicture), findsNWidgets(SippyState.values.length));
    expect(tester.takeException(), isNull);
  });
}
