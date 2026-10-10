import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/app/app.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// Smoke screen: a localized label followed by a directional icon.
class _SmokeScreen extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: Row(
        children: [
          Text(l10n.navHome, key: const ValueKey('label')),
          const Icon(Icons.arrow_back, key: ValueKey('icon')),
        ],
      ),
    );
  }
}

Future<void> _pumpSmoke(WidgetTester tester, Locale locale) async {
  await tester.pumpWidget(
    MaterialApp(
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const _SmokeScreen(),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  test('supports the launch languages (D-20)', () {
    expect(
      AppLocalizations.supportedLocales.map((l) => l.languageCode).toSet(),
      {'en', 'id', 'ar', 'es', 'pt'},
    );
  });

  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('${locale.languageCode}: every key has a value', (
      tester,
    ) async {
      await _pumpSmoke(tester, locale);
      final l10n = AppLocalizations.of(
        tester.element(find.byType(_SmokeScreen)),
      );
      for (final value in [
        l10n.navHome,
        l10n.navStats,
        l10n.navFamily,
        l10n.navMe,
      ]) {
        expect(value, isNotEmpty);
      }
    });
  }

  testWidgets('Arabic renders mirrored (RTL)', (tester) async {
    await _pumpSmoke(tester, const Locale('ar'));

    final context = tester.element(find.byType(_SmokeScreen));
    expect(Directionality.of(context), TextDirection.rtl);
    expect(find.text('الرئيسية'), findsOneWidget);

    final label = tester.getCenter(find.byKey(const ValueKey('label')));
    final icon = tester.getCenter(find.byKey(const ValueKey('icon')));
    expect(label.dx, greaterThan(icon.dx), reason: 'first child sits right');
  });

  testWidgets('English renders left-to-right', (tester) async {
    await _pumpSmoke(tester, const Locale('en'));

    final label = tester.getCenter(find.byKey(const ValueKey('label')));
    final icon = tester.getCenter(find.byKey(const ValueKey('icon')));
    expect(label.dx, lessThan(icon.dx));
  });

  testWidgets('App applies the requested locale', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: App(locale: Locale('ar'))),
    );
    await tester.pumpAndSettle();

    final context = tester.element(find.byKey(const ValueKey('UI-03')));
    expect(Directionality.of(context), TextDirection.rtl);
  });
}
