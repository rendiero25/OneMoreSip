import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';

/// Material 3 themes built from the DS tokens (T-010).
///
/// Component themes cover only DS basics; the DS-5 components (T-011) read
/// [AppColors], [AppTypography] and the DS-4 dimensions directly.
abstract final class AppTheme {
  /// Light theme.
  static final ThemeData light = _build(AppColors.light, Brightness.light);

  /// Dark theme.
  static final ThemeData dark = _build(AppColors.dark, Brightness.dark);

  static ThemeData _build(AppColors c, Brightness brightness) {
    final scheme = ColorScheme(
      brightness: brightness,
      // accentInk, not accent: Material uses primary for text (links, text
      // buttons), and light accent is below 4.5:1 as text.
      primary: c.accentInk,
      onPrimary: c.onAccent,
      primaryContainer: c.accentTint,
      onPrimaryContainer: c.ink,
      secondary: c.ink,
      onSecondary: c.onInk,
      error: c.badFg,
      onError: c.onInk,
      errorContainer: c.badBg,
      onErrorContainer: c.badFg,
      surface: c.bg,
      onSurface: c.ink,
      onSurfaceVariant: c.inkMuted,
      surfaceContainerLowest: c.surface,
      surfaceContainerLow: c.surface,
      surfaceContainer: c.surface,
      surfaceContainerHigh: c.surface,
      surfaceContainerHighest: c.surfaceAlt,
      outline: c.line,
      outlineVariant: c.divider,
      inverseSurface: c.ink,
      onInverseSurface: c.onInk,
      inversePrimary: c.snackAction,
      scrim: c.scrim,
      shadow: AppElevation.soft.color,
      // Flat design (DS-4): no M3 elevation tint.
      surfaceTint: Colors.transparent,
    );

    const textTheme = TextTheme(
      displayLarge: AppTypography.hero,
      displayMedium: AppTypography.display,
      displaySmall: AppTypography.display,
      headlineLarge: AppTypography.h1,
      headlineMedium: AppTypography.h2,
      headlineSmall: AppTypography.h2,
      titleLarge: AppTypography.title,
      titleMedium: AppTypography.bodyStrong,
      titleSmall: AppTypography.label,
      bodyLarge: AppTypography.body,
      bodyMedium: AppTypography.body,
      // M3 defaults below 14 are replaced: no text below 14 (DS-6).
      bodySmall: AppTypography.caption,
      labelLarge: AppTypography.label,
      labelMedium: AppTypography.label,
      labelSmall: AppTypography.caption,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.bg,
      fontFamily: AppTypography.latin,
      fontFamilyFallback: const [AppTypography.arabic],
      textTheme: textTheme.apply(bodyColor: c.ink, displayColor: c.ink),
      iconTheme: IconThemeData(color: c.ink, size: 24),
      dividerTheme: DividerThemeData(color: c.divider, thickness: 1),
      appBarTheme: AppBarTheme(
        backgroundColor: c.bg,
        foregroundColor: c.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
      ),
      cardTheme: CardThemeData(
        color: c.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: c.surface,
        modalBarrierColor: c.scrim,
        dragHandleColor: c.line,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.lg),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: c.ink,
        contentTextStyle: AppTypography.body.copyWith(color: c.onInk),
        actionTextColor: c.snackAction,
        behavior: SnackBarBehavior.floating,
      ),
      // Hit areas >= 48dp on every platform (DS-6).
      materialTapTargetSize: MaterialTapTargetSize.padded,
      extensions: [c],
    );
  }
}
