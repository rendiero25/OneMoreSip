import 'package:flutter/material.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';

/// DS-5 pill button variants.
enum PillButtonVariant {
  /// `ink` fill, `onInk` text.
  primary,

  /// `surface` fill, 1.5 px `ink` border.
  secondary,

  /// `badFg` text (and border, to keep a visible boundary).
  destructive,
}

/// DS-5 pill button heights.
enum PillButtonSize {
  /// 56 dp, `title` text.
  large,

  /// 48 dp, `bodyStrong` text.
  medium,
}

/// DS-5 pill button. Grows taller and wraps its label with large text.
class PillButton extends StatelessWidget {
  /// Creates a button.
  const new({
    required this.label,
    required this.onPressed,
    this.variant = PillButtonVariant.primary,
    this.size = PillButtonSize.large,
    super.key,
  });

  /// Button text.
  final String label;

  /// Tap callback.
  final VoidCallback onPressed;

  /// Look.
  final PillButtonVariant variant;

  /// Height.
  final PillButtonSize size;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final (fill, text, border) = switch (variant) {
      PillButtonVariant.primary => (c.ink, c.onInk, null),
      PillButtonVariant.secondary => (c.surface, c.ink, c.ink),
      PillButtonVariant.destructive => (c.surface, c.badFg, c.badFg),
    };
    final large = size == PillButtonSize.large;
    return Semantics(
      button: true,
      child: Material(
        color: fill,
        shape: StadiumBorder(
          side: border == null
              ? BorderSide.none
              : BorderSide(color: border, width: 1.5),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: large ? 56 : 48),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.s24,
                vertical: AppSpacing.s8,
              ),
              child: Center(
                widthFactor: 1,
                heightFactor: 1,
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style:
                      (large ? AppTypography.title : AppTypography.bodyStrong)
                          .copyWith(color: text),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
