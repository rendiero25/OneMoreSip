import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// DS-1 hydration status.
enum HydrationStatus {
  /// At or ahead of pace.
  hydrated,

  /// 10–30% behind pace.
  thirsty,

  /// More than 30% behind pace.
  behind,
}

/// DS-5 status badge: icon + text + color, never color alone. Each status
/// has its own icon shape.
class StatusBadge extends StatelessWidget {
  /// Creates a badge for [status].
  const new({required this.status, super.key});

  /// Shown status.
  final HydrationStatus status;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final l10n = AppLocalizations.of(context);
    final (bg, fg, icon, text) = switch (status) {
      HydrationStatus.hydrated => (
        c.okBg,
        c.okFg,
        LucideIcons.check,
        l10n.statusHydrated,
      ),
      HydrationStatus.thirsty => (
        c.warnBg,
        c.warnFg,
        LucideIcons.clock,
        l10n.statusThirsty,
      ),
      HydrationStatus.behind => (
        c.badBg,
        c.badFg,
        LucideIcons.triangleAlert,
        l10n.statusBehind,
      ),
    };
    return DecoratedBox(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.pill)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: fg),
            const SizedBox(width: AppSpacing.s8),
            Flexible(
              child: Text(
                text,
                style: AppTypography.label.copyWith(
                  color: fg,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
