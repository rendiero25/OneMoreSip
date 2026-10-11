import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/features/safety/domain/over_drinking.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// BR-06 warning: the gentle hourly note or the daily card. Warn colors
/// plus icon plus text, never color alone. Renders nothing for
/// [OverDrinkingWarning.none]. Informational only; never blocks logging.
class OverDrinkingNotice extends StatelessWidget {
  /// Creates the notice for [warning].
  const new({required this.warning, super.key});

  /// Which warning to show.
  final OverDrinkingWarning warning;

  @override
  Widget build(BuildContext context) {
    if (warning == OverDrinkingWarning.none) return const SizedBox.shrink();
    final c = AppColors.of(context);
    final l10n = AppLocalizations.of(context);
    final daily = warning == OverDrinkingWarning.daily;
    final titleStyle = daily ? AppTypography.title : AppTypography.label;
    final bodyStyle = daily ? AppTypography.body : AppTypography.label;
    return Semantics(
      container: true,
      liveRegion: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: c.warnBg,
          borderRadius: BorderRadius.all(
            Radius.circular(daily ? AppRadius.lg : AppRadius.md),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(daily ? AppSpacing.s20 : AppSpacing.s12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                daily ? LucideIcons.triangleAlert : LucideIcons.hourglass,
                size: daily ? 24 : 20,
                color: c.warnFg,
              ),
              const SizedBox(width: AppSpacing.s12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      daily
                          ? l10n.overDrinkingDailyTitle
                          : l10n.overDrinkingHourlyTitle,
                      style: titleStyle.copyWith(
                        color: c.warnFg,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s4),
                    Text(
                      daily
                          ? l10n.overDrinkingDailyBody
                          : l10n.overDrinkingHourlyBody,
                      style: bodyStyle.copyWith(
                        color: c.warnFg,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
