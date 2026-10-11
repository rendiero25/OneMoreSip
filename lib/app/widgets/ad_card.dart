import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/app/widgets/bento_card.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// DS-5 ad card: a [BentoCard] with an "Ad" label at the top start and an
/// overflow menu with "Report ad".
///
/// Only where F-24 allows ads (History, Stats/Settings banners); never on
/// Home, onboarding, paywall, Simple Mode, kids profiles or near the log
/// button.
class AdCard extends StatelessWidget {
  /// Creates a card around the native ad [child].
  const new({required this.child, required this.onReport, super.key});

  /// Native ad content.
  final Widget child;

  /// Called by "Report ad".
  final VoidCallback onReport;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final l10n = AppLocalizations.of(context);
    return BentoCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: c.inkMuted, width: 1.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AppRadius.sm),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s8,
                    vertical: AppSpacing.s4,
                  ),
                  child: Text(
                    l10n.adLabel,
                    style: AppTypography.label.copyWith(
                      color: c.inkMuted,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              PopupMenuButton<void>(
                tooltip: l10n.adOptions,
                icon: Icon(LucideIcons.ellipsis, color: c.ink),
                itemBuilder: (context) => [
                  PopupMenuItem(onTap: onReport, child: Text(l10n.adReport)),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s12),
          child,
        ],
      ),
    );
  }
}
