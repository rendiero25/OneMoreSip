import 'package:flutter/material.dart';

/// DS-1 color tokens (D-28), one instance per brightness.
///
/// Read in widgets with `AppColors.of(context)`. Names match DS-1 exactly;
/// values come from DS-1, never from the design export.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  /// Creates a token set. Use [light] or [dark].
  const new({
    required this.bg,
    required this.surface,
    required this.surfaceAlt,
    required this.ink,
    required this.inkMuted,
    required this.onInk,
    required this.accent,
    required this.onAccent,
    required this.accentInk,
    required this.line,
    required this.track,
    required this.divider,
    required this.scrim,
    required this.fabShadow,
    required this.accentTint,
    required this.mint,
    required this.sunTint,
    required this.coralTint,
    required this.nightTint,
    required this.mutedOnTint,
    required this.okBg,
    required this.okFg,
    required this.warnBg,
    required this.warnFg,
    required this.badBg,
    required this.badFg,
    required this.nav,
    required this.navOn,
    required this.navOff,
    required this.snackAction,
    required this.sun,
    required this.coral,
    required this.water,
    required this.waterBack,
    required this.hcBg,
    required this.hcInk,
    required this.hcButton,
    required this.hcOnButton,
  });

  /// Light theme tokens.
  static const light = AppColors(
    bg: Color(0xFFF7F4EE),
    surface: Color(0xFFFFFFFF),
    surfaceAlt: Color(0xFFEFEBE3),
    ink: Color(0xFF111312),
    inkMuted: Color(0xFF5B6160),
    onInk: Color(0xFFFFFFFF),
    accent: Color(0xFF0B7F75),
    onAccent: Color(0xFFFFFFFF),
    accentInk: Color(0xFF0A6E66),
    line: Color(0xFF89867F),
    track: Color(0xFFE2DDD3),
    divider: Color.fromRGBO(17, 19, 18, .08),
    scrim: Color.fromRGBO(17, 19, 18, .45),
    fabShadow: Color.fromRGBO(11, 127, 117, .35),
    accentTint: Color(0xFFE3F5F1),
    mint: Color(0xFFBFEAE3),
    sunTint: Color(0xFFFFEFC7),
    coralTint: Color(0xFFFFE1D8),
    nightTint: Color(0xFFDCE3F2),
    mutedOnTint: Color(0xFF4A504F),
    okBg: Color(0xFFD7F2EE),
    okFg: Color(0xFF075E56),
    warnBg: Color(0xFFFFE9C2),
    warnFg: Color(0xFF8A4F00),
    badBg: Color(0xFFFFE0D9),
    badFg: Color(0xFFA8321F),
    nav: Color(0xFF111312),
    navOn: Color(0xFFFFFFFF),
    navOff: Color.fromRGBO(255, 255, 255, .68),
    snackAction: Color(0xFF4FD1C1),
    sun: Color(0xFFFFD27A),
    coral: Color(0xFFFF9E87),
    water: Color(0xFF4FD1C1),
    waterBack: Color(0xFF9BE8DE),
    hcBg: Color(0xFFFFFFFF),
    hcInk: Color(0xFF000000),
    hcButton: Color(0xFF00524B),
    hcOnButton: Color(0xFFFFFFFF),
  );

  /// Dark theme tokens.
  static const dark = AppColors(
    bg: Color(0xFF121413),
    surface: Color(0xFF1C1F1E),
    surfaceAlt: Color(0xFF262A29),
    ink: Color(0xFFECEEEC),
    inkMuted: Color(0xFF9BA3A1),
    onInk: Color(0xFF121413),
    accent: Color(0xFF4FD1C1),
    onAccent: Color(0xFF0A1F1D),
    accentInk: Color(0xFF4FD1C1),
    line: Color(0xFF6E7371),
    track: Color(0xFF3A3F3D),
    divider: Color.fromRGBO(236, 238, 236, .10),
    scrim: Color.fromRGBO(0, 0, 0, .6),
    fabShadow: Color.fromRGBO(0, 0, 0, .5),
    accentTint: Color(0xFF163330),
    mint: Color(0xFF1F4A45),
    sunTint: Color(0xFF3A3019),
    coralTint: Color(0xFF3D251F),
    nightTint: Color(0xFF1F2A44),
    mutedOnTint: Color(0xFFC3CAC8),
    okBg: Color.fromRGBO(79, 209, 193, .16),
    okFg: Color(0xFF4FD1C1),
    warnBg: Color.fromRGBO(242, 184, 92, .18),
    warnFg: Color(0xFFF2B85C),
    badBg: Color.fromRGBO(255, 143, 122, .16),
    badFg: Color(0xFFFF8F7A),
    nav: Color(0xFF2B302E),
    navOn: Color(0xFFECEEEC),
    navOff: Color.fromRGBO(236, 238, 236, .66),
    snackAction: Color(0xFF0A6E66),
    sun: Color.fromRGBO(242, 184, 92, .5),
    coral: Color.fromRGBO(255, 143, 122, .5),
    water: Color(0xFF4FD1C1),
    waterBack: Color(0xFF9BE8DE),
    hcBg: Color(0xFF000000),
    hcInk: Color(0xFFFFFFFF),
    hcButton: Color(0xFF7FF0E2),
    hcOnButton: Color(0xFF000000),
  );

  /// The tokens of the current theme.
  static AppColors of(BuildContext context) =>
      Theme.of(context).extension<AppColors>()!;

  /// App background.
  final Color bg;

  /// Cards.
  final Color surface;

  /// Inset areas, chips.
  final Color surfaceAlt;

  /// Primary text, hero numbers, primary CTA fill, snackbar.
  final Color ink;

  /// Secondary text on bg/surface/surfaceAlt, never on tints.
  final Color inkMuted;

  /// Text on [ink].
  final Color onInk;

  /// Progress fill, FAB, switch on, selected nav pill. Never text (light).
  final Color accent;

  /// Text/icons on [accent].
  final Color onAccent;

  /// Accent-colored text and links.
  final Color accentInk;

  /// Control boundaries (inputs, radio rings, switch off-track, handle).
  final Color line;

  /// Progress track, skeletons.
  final Color track;

  /// List separators, chart grid (decorative only).
  final Color divider;

  /// Behind sheets and dialogs.
  final Color scrim;

  /// FAB glow.
  final Color fabShadow;

  /// Soft accent background, selected rows, Sippy chat bubble.
  final Color accentTint;

  /// Hero/illustration cards, Sippy avatar.
  final Color mint;

  /// Streak, weather, warm cards.
  final Color sunTint;

  /// Family alert, attention cards.
  final Color coralTint;

  /// Night, quiet hours, fasting night, Ramadan banner.
  final Color nightTint;

  /// Secondary text on any tint.
  final Color mutedOnTint;

  /// Status "Hydrated" background (always with icon + text).
  final Color okBg;

  /// Status "Hydrated" foreground.
  final Color okFg;

  /// Status "Getting thirsty" background.
  final Color warnBg;

  /// Status "Getting thirsty" foreground, warning bar color.
  final Color warnFg;

  /// Status "Behind" background.
  final Color badBg;

  /// Status "Behind" foreground, destructive text, empty bar color.
  final Color badFg;

  /// Floating navbar fill.
  final Color nav;

  /// Selected tab icon and label.
  final Color navOn;

  /// Unselected tabs.
  final Color navOff;

  /// "Undo" on the snackbar.
  final Color snackAction;

  /// Decorative only (blobs, medals); text on it is [ink] (D-30).
  final Color sun;

  /// Decorative only (blobs, medals) (D-30).
  final Color coral;

  /// Decorative only: primary water in the glass, both themes (D-30).
  final Color water;

  /// Decorative only: back wave in the glass, both themes (D-30).
  final Color waterBack;

  /// High contrast (Simple Mode option): background.
  final Color hcBg;

  /// High contrast: text and card border.
  final Color hcInk;

  /// High contrast: button fill.
  final Color hcButton;

  /// High contrast: text on [hcButton].
  final Color hcOnButton;

  // Token sets are fixed; nothing overrides single tokens.
  @override
  AppColors copyWith() => this;

  // Swaps sets halfway through a theme animation instead of blending 38
  // colors; the light/dark switch is rare and brief.
  @override
  AppColors lerp(AppColors? other, double t) => t < .5 ? this : other ?? this;
}
