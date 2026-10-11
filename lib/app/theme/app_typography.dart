import 'package:flutter/painting.dart';

/// DS-2 type scale.
///
/// Sizes are logical px and scale with the system text size (no clamping).
/// Every style uses tabular figures and falls back to IBM Plex Sans Arabic
/// for glyphs Plus Jakarta Sans lacks, so Arabic renders in the bundled
/// font (D-28). Colors come from the theme, not from these styles.
abstract final class AppTypography {
  /// Latin family (bundled, DS-2).
  static const latin = 'PlusJakartaSans';

  /// Arabic family (bundled, D-28).
  static const arabic = 'IBMPlexSansArabic';

  /// Today's ml on Home: 64 / 68, 700.
  static const hero = TextStyle(
    fontFamily: latin,
    fontFamilyFallback: [arabic],
    fontFeatures: [FontFeature.tabularFigures()],
    fontSize: 64,
    height: 68 / 64,
    fontWeight: FontWeight.w700,
  );

  /// Stat numbers: 40 / 44, 700.
  static const display = TextStyle(
    fontFamily: latin,
    fontFamilyFallback: [arabic],
    fontFeatures: [FontFeature.tabularFigures()],
    fontSize: 40,
    height: 44 / 40,
    fontWeight: FontWeight.w700,
  );

  /// Screen titles: 30 / 36, 700.
  static const h1 = TextStyle(
    fontFamily: latin,
    fontFamilyFallback: [arabic],
    fontFeatures: [FontFeature.tabularFigures()],
    fontSize: 30,
    height: 36 / 30,
    fontWeight: FontWeight.w700,
  );

  /// Card titles: 24 / 30, 700.
  static const h2 = TextStyle(
    fontFamily: latin,
    fontFamilyFallback: [arabic],
    fontFeatures: [FontFeature.tabularFigures()],
    fontSize: 24,
    height: 30 / 24,
    fontWeight: FontWeight.w700,
  );

  /// List titles, large buttons: 20 / 26, 600.
  static const title = TextStyle(
    fontFamily: latin,
    fontFamilyFallback: [arabic],
    fontFeatures: [FontFeature.tabularFigures()],
    fontSize: 20,
    height: 26 / 20,
    fontWeight: FontWeight.w600,
  );

  /// Default text: 17 / 24, 400.
  static const body = TextStyle(
    fontFamily: latin,
    fontFamilyFallback: [arabic],
    fontFeatures: [FontFeature.tabularFigures()],
    fontSize: 17,
    height: 24 / 17,
    fontWeight: FontWeight.w400,
  );

  /// Emphasized body: 17 / 24, 600.
  static const bodyStrong = TextStyle(
    fontFamily: latin,
    fontFamilyFallback: [arabic],
    fontFeatures: [FontFeature.tabularFigures()],
    fontSize: 17,
    height: 24 / 17,
    fontWeight: FontWeight.w600,
  );

  /// Chips, secondary labels: 15 / 20, 500.
  static const label = TextStyle(
    fontFamily: latin,
    fontFamilyFallback: [arabic],
    fontFeatures: [FontFeature.tabularFigures()],
    fontSize: 15,
    height: 20 / 15,
    fontWeight: FontWeight.w500,
  );

  /// Timestamps only, never essential info: 14 / 18, 500.
  static const caption = TextStyle(
    fontFamily: latin,
    fontFamilyFallback: [arabic],
    fontFeatures: [FontFeature.tabularFigures()],
    fontSize: 14,
    height: 18 / 14,
    fontWeight: FontWeight.w500,
  );
}
