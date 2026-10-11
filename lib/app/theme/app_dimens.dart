import 'package:flutter/painting.dart';

/// DS-4 spacing on a 4 pt grid.
abstract final class AppSpacing {
  /// 4
  static const double s4 = 4;

  /// 8
  static const double s8 = 8;

  /// 12
  static const double s12 = 12;

  /// 16
  static const double s16 = 16;

  /// 20
  static const double s20 = 20;

  /// 24
  static const double s24 = 24;

  /// 32
  static const double s32 = 32;

  /// 40
  static const double s40 = 40;

  /// 56
  static const double s56 = 56;

  /// Screen side gutter.
  static const double gutter = 20;
}

/// DS-4 corner radii.
abstract final class AppRadius {
  /// Chips.
  static const double sm = 12;

  /// Inputs.
  static const double md = 20;

  /// Bento cards, bottom sheet top.
  static const double lg = 28;

  /// Buttons, navbar.
  static const double pill = 999;
}

/// DS-4 elevation: flat; only navbar, FAB and bottom sheets get a shadow.
abstract final class AppElevation {
  /// Soft shadow for navbar and bottom sheets: y 8, blur 24, 12% ink
  /// (light `ink`, as in the design export for both themes).
  static const soft = BoxShadow(
    color: Color.fromRGBO(17, 19, 18, .12),
    offset: Offset(0, 8),
    blurRadius: 24,
  );

  /// Card border width in high contrast mode (DS-1).
  static const double highContrastBorder = 3;
}
