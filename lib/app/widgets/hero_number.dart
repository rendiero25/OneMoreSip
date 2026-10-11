import 'package:flutter/material.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';

/// DS-5 hero number: value (`hero`) + unit (`title`, muted) + caption.
///
/// Wraps the unit below the value when text is large.
class HeroNumber extends StatelessWidget {
  /// Creates a hero number; the caller formats [value] and [unit].
  const new({
    required this.value,
    required this.unit,
    this.caption,
    this.onTint = false,
    super.key,
  });

  /// Formatted number, e.g. `1,250`.
  final String value;

  /// Unit text, e.g. `/ 2,300 ml`.
  final String unit;

  /// Optional line below.
  final String? caption;

  /// Whether the number sits on a DS-1 tint: secondary text then uses
  /// `mutedOnTint` instead of `inkMuted` (DS-1).
  final bool onTint;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final muted = onTint ? c.mutedOnTint : c.inkMuted;
    final caption = this.caption;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: AppSpacing.s8,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            // A number never breaks across lines; at large text sizes it
            // shrinks to the available width instead.
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                maxLines: 1,
                style: AppTypography.hero.copyWith(color: c.ink),
              ),
            ),
            Padding(
              // Sits the unit near the hero baseline (68 vs 26 line height).
              padding: const EdgeInsets.only(bottom: AppSpacing.s8),
              child: Text(
                unit,
                style: AppTypography.title.copyWith(color: muted),
              ),
            ),
          ],
        ),
        if (caption != null)
          Text(caption, style: AppTypography.label.copyWith(color: muted)),
      ],
    );
  }
}
