import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';

/// DS-5 quick-add chip: 64 dp tall, glass icon + volume. Wraps with large
/// text.
class QuickAddChip extends StatelessWidget {
  /// Creates a chip; the caller formats [label] (e.g. `250 ml`).
  const new({required this.label, required this.onPressed, super.key});

  /// Volume text.
  final String label;

  /// Tap callback.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return Semantics(
      button: true,
      child: Material(
        color: c.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.sm)),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 64),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.s8,
                vertical: AppSpacing.s8,
              ),
              child: Center(
                heightFactor: 1,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: AppSpacing.s4,
                  children: [
                    Icon(LucideIcons.glassWater, size: 20, color: c.accent),
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: AppTypography.label.copyWith(
                        color: c.ink,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
