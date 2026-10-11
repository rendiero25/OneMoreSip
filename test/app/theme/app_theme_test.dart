import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_theme.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/app/theme/font_licenses.dart';

void main() {
  for (final (name, theme, colors) in [
    ('light', AppTheme.light, AppColors.light),
    ('dark', AppTheme.dark, AppColors.dark),
  ]) {
    group('AppTheme.$name', () {
      test('exposes the DS-1 tokens as an extension', () {
        expect(theme.extension<AppColors>(), same(colors));
        expect(theme.scaffoldBackgroundColor, colors.bg);
        expect(theme.colorScheme.onSurface, colors.ink);
      });

      test('no text style below 14 and all use the bundled fonts', () {
        final t = theme.textTheme;
        for (final style in [
          t.displayLarge, t.displayMedium, t.displaySmall, //
          t.headlineLarge, t.headlineMedium, t.headlineSmall,
          t.titleLarge, t.titleMedium, t.titleSmall,
          t.bodyLarge, t.bodyMedium, t.bodySmall,
          t.labelLarge, t.labelMedium, t.labelSmall,
        ]) {
          expect(style!.fontSize, greaterThanOrEqualTo(14));
          expect(style.fontFamily, AppTypography.latin);
          expect(style.fontFamilyFallback, [AppTypography.arabic]);
          expect(style.fontFeatures, [const FontFeature.tabularFigures()]);
        }
      });
    });
  }

  testWidgets('font OFL licenses are registered', (tester) async {
    registerFontLicenses();
    final packages = await tester.runAsync(
      () => LicenseRegistry.licenses.expand((l) => l.packages).toList(),
    );
    expect(
      packages,
      containsAll(['Plus Jakarta Sans', 'IBM Plex Sans Arabic']),
    );
  });
}
