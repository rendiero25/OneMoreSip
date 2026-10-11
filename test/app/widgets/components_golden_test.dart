// Goldens render differently on Windows and the Linux CI runner, so they
// are verified locally on Windows only: `flutter test --tags golden`.
@Tags(['golden'])
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/app/theme/app_theme.dart';
import 'package:onemoresip/app/widgets/undo_snackbar.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

import '../../helpers/fonts.dart';
import 'component_board.dart';

void main() {
  setUpAll(loadAppFonts);

  for (final (name, locale, scale, theme, height) in [
    ('en_100_light', 'en', 1.0, AppTheme.light, 1500.0),
    ('en_200_light', 'en', 2.0, AppTheme.light, 2500.0),
    ('ar_100_light', 'ar', 1.0, AppTheme.light, 1500.0),
    ('ar_200_light', 'ar', 2.0, AppTheme.light, 2500.0),
    ('en_100_dark', 'en', 1.0, AppTheme.dark, 1500.0),
  ]) {
    testWidgets('component board ($name)', (tester) async {
      tester.view
        ..physicalSize = Size(390, height)
        ..devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          locale: Locale(locale),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) => MediaQuery(
            // Static motion keeps the wave and Sippy deterministic.
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(scale),
              disableAnimations: true,
            ),
            child: child!,
          ),
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ComponentBoard(copy: locale == 'ar' ? arCopy : enCopy),
                  // Room for the snackbar below the board.
                  SizedBox(height: 120 * scale),
                ],
              ),
            ),
          ),
        ),
      );
      // Sippy's SVG loads asynchronously.
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 200)),
      );
      await tester.pump();

      final context = tester.element(find.byType(ComponentBoard));
      showUndoSnackbar(
        context,
        message: locale == 'ar' ? 'أُضيف 250 مل ماء' : 'Added 250 ml water',
        onUndo: () {},
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/components_$name.png'),
      );
    });
  }
}
