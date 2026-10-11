import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';

/// DS-5 bento card: flat, radius `lg`, padding 20, optional header row
/// (icon 24 + title + chevron when tappable).
class BentoCard extends StatelessWidget {
  /// Creates a card around [child].
  const new({
    required this.child,
    this.icon,
    this.title,
    this.onTap,
    this.color,
    super.key,
  });

  /// Card content.
  final Widget child;

  /// Header icon, shown only with [title].
  final IconData? icon;

  /// Header title; no header when `null`.
  final String? title;

  /// Makes the whole card a button and shows a chevron in the header.
  final VoidCallback? onTap;

  /// Fill; defaults to `surface`. Use a DS-1 tint for tinted cards.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final title = this.title;
    final content = Padding(
      padding: const EdgeInsets.all(AppSpacing.s20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null) ...[
            Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 24, color: c.ink),
                  const SizedBox(width: AppSpacing.s12),
                ],
                Expanded(
                  child: Text(
                    title,
                    style: AppTypography.h2.copyWith(color: c.ink),
                  ),
                ),
                if (onTap != null)
                  // `Dir` variant mirrors in RTL.
                  Icon(LucideIcons.chevronRightDir, size: 24, color: c.ink),
              ],
            ),
            const SizedBox(height: AppSpacing.s12),
          ],
          child,
        ],
      ),
    );
    return Material(
      color: color ?? c.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
      ),
      clipBehavior: Clip.antiAlias,
      child: onTap == null
          ? content
          : Semantics(
              button: true,
              child: InkWell(onTap: onTap, child: content),
            ),
    );
  }
}
