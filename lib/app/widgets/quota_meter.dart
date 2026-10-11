import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// DS-5 quota meter states. The quota service (server, SD-6) decides the
/// state; the meter only shows it.
enum QuotaState {
  /// Plenty left: `accent` bar.
  normal,

  /// Running low: `warnFg` bar on `warnBg`, clock icon.
  low,

  /// Nothing left: `badBg` track, ban icon.
  empty,
}

/// DS-5 quota meter: title + remaining / limit, an 8 px bar of what is
/// left, and the reset date. Low and Empty add an icon + "N left".
class QuotaMeter extends StatelessWidget {
  /// Creates a meter.
  const new({
    required this.title,
    required this.remaining,
    required this.limit,
    required this.state,
    required this.resetsOn,
    super.key,
  });

  /// What is counted, e.g. "AI chats".
  final String title;

  /// Uses left this period.
  final int remaining;

  /// Uses per period.
  final int limit;

  /// Shown state.
  final QuotaState state;

  /// Date the quota resets.
  final DateTime resetsOn;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final l10n = AppLocalizations.of(context);
    final strong = AppTypography.label.copyWith(fontWeight: FontWeight.w600);
    final (track, bar) = switch (state) {
      QuotaState.normal => (c.track, c.accent),
      QuotaState.low => (c.warnBg, c.warnFg),
      QuotaState.empty => (c.badBg, c.badFg),
    };
    final value = switch (state) {
      // Numbers stay LTR in RTL layouts (DS-6).
      QuotaState.normal => Text(
        '$remaining / $limit',
        textDirection: TextDirection.ltr,
        style: strong.copyWith(color: c.ink),
      ),
      QuotaState.low => _Left(LucideIcons.clock, c.warnFg, l10n, remaining),
      QuotaState.empty => _Left(LucideIcons.ban, c.badFg, l10n, remaining),
    };
    return MergeSemantics(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: AppSpacing.s8,
            children: [
              Text(title, style: strong.copyWith(color: c.ink)),
              value,
            ],
          ),
          const SizedBox(height: AppSpacing.s8),
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(AppRadius.pill),
            ),
            child: Container(
              height: 8,
              color: track,
              alignment: AlignmentDirectional.centerStart,
              child: FractionallySizedBox(
                widthFactor: limit == 0 ? 0 : (remaining / limit).clamp(0, 1),
                heightFactor: 1,
                child: ColoredBox(color: bar),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.s8),
          Text(
            l10n.quotaResets(resetsOn),
            style: AppTypography.caption.copyWith(color: c.inkMuted),
          ),
        ],
      ),
    );
  }
}

/// Icon + "N left" in a status color.
class _Left extends StatelessWidget {
  const new(this.icon, this.color, this.l10n, this.count);

  final IconData icon;
  final Color color;
  final AppLocalizations l10n;
  final int count;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 16, color: color),
      const SizedBox(width: AppSpacing.s4),
      Flexible(
        child: Text(
          l10n.quotaLeft(count),
          style: AppTypography.label.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}
