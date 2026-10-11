import 'dart:math' as math;

import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/app/theme/app_colors.dart';

/// WCAG 2.2 relative luminance of an opaque color.
double _luminance(Color c) {
  double channel(double v) =>
      v <= 0.04045 ? v / 12.92 : math.pow((v + 0.055) / 1.055, 2.4).toDouble();
  return 0.2126 * channel(c.r) + 0.7152 * channel(c.g) + 0.0722 * channel(c.b);
}

/// Contrast of [fg] over [bg]; translucent colors are composited first
/// (bg over [base], then fg over the result), as DS-1 does.
double contrast(Color fg, Color bg, {Color? base}) {
  final under = base == null ? bg : Color.alphaBlend(bg, base);
  final over = Color.alphaBlend(fg, under);
  final a = _luminance(over);
  final b = _luminance(under);
  return (math.max(a, b) + 0.05) / (math.min(a, b) + 0.05);
}

/// Every text/background pair DS-1 lists as text, per theme.
List<(String, Color, Color, Color?)> _textPairs(AppColors c) => [
  for (final (name, bg) in [
    ('bg', c.bg),
    ('surface', c.surface),
    ('surfaceAlt', c.surfaceAlt),
  ]) ...[
    ('ink on $name', c.ink, bg, null),
    ('inkMuted on $name', c.inkMuted, bg, null),
  ],
  ('onInk on ink', c.onInk, c.ink, null),
  ('onAccent on accent', c.onAccent, c.accent, null),
  ('accentInk on bg', c.accentInk, c.bg, null),
  ('accentInk on surface', c.accentInk, c.surface, null),
  for (final (name, tint) in [
    ('accentTint', c.accentTint),
    ('mint', c.mint),
    ('sunTint', c.sunTint),
    ('coralTint', c.coralTint),
    ('nightTint', c.nightTint),
  ]) ...[
    ('ink on $name', c.ink, tint, null),
    ('mutedOnTint on $name', c.mutedOnTint, tint, null),
  ],
  // Status bg is translucent in dark: check on both surface and bg.
  for (final (name, base) in [('surface', c.surface), ('bg', c.bg)]) ...[
    ('okFg on okBg over $name', c.okFg, c.okBg, base),
    ('warnFg on warnBg over $name', c.warnFg, c.warnBg, base),
    ('badFg on badBg over $name', c.badFg, c.badBg, base),
  ],
  ('navOn on nav', c.navOn, c.nav, null),
  ('navOff on nav', c.navOff, c.nav, null),
  ('snackAction on ink', c.snackAction, c.ink, null),
  ('hcInk on hcBg', c.hcInk, c.hcBg, null),
  ('hcOnButton on hcButton', c.hcOnButton, c.hcButton, null),
];

void main() {
  for (final (theme, colors) in [
    ('light', AppColors.light),
    ('dark', AppColors.dark),
  ]) {
    group('DS-1 text contrast ($theme) >= 4.5:1', () {
      for (final (name, fg, bg, base) in _textPairs(colors)) {
        test(name, () {
          expect(contrast(fg, bg, base: base), greaterThanOrEqualTo(4.5));
        });
      }
    });
  }

  test('white text on dark nightTint (Ramadan banner) >= 4.5:1', () {
    expect(
      contrast(const Color(0xFFFFFFFF), AppColors.dark.nightTint),
      greaterThanOrEqualTo(4.5),
    );
  });

  test('contrast() matches a DS-1 reference value', () {
    // DS-1: ink on bg = 16.99 (light).
    expect(
      contrast(AppColors.light.ink, AppColors.light.bg),
      closeTo(16.99, .01),
    );
  });
}
