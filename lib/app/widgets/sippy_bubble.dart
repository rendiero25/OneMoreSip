import 'package:flutter/material.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/core/sippy/sippy.dart';
import 'package:onemoresip/core/sippy/sippy_state.dart';

/// DS-5 Sippy bubble: Sippy (48–96 dp) + a `surface` speech bubble.
class SippyBubble extends StatelessWidget {
  /// Creates a bubble with Sippy in [state] saying [message].
  const new({
    required this.state,
    required this.message,
    this.size = 56,
    super.key,
  }) : assert(size >= 48 && size <= 96, 'DS-5: Sippy is 48–96 dp here');

  /// Sippy's state.
  final SippyState state;

  /// What Sippy says.
  final String message;

  /// Sippy size, 48–96.
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Sippy(state: state, size: size),
        const SizedBox(width: AppSpacing.s8),
        Flexible(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: c.surface,
              borderRadius: const BorderRadius.all(
                Radius.circular(AppRadius.lg),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.s16,
                vertical: AppSpacing.s12,
              ),
              child: Text(
                message,
                style: AppTypography.body.copyWith(color: c.ink),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
