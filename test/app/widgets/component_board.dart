import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/widgets/ad_card.dart';
import 'package:onemoresip/app/widgets/bento_card.dart';
import 'package:onemoresip/app/widgets/floating_nav_bar.dart';
import 'package:onemoresip/app/widgets/hero_number.dart';
import 'package:onemoresip/app/widgets/pill_button.dart';
import 'package:onemoresip/app/widgets/progress_glass.dart';
import 'package:onemoresip/app/widgets/progress_ring.dart';
import 'package:onemoresip/app/widgets/quick_add_chip.dart';
import 'package:onemoresip/app/widgets/quota_meter.dart';
import 'package:onemoresip/app/widgets/sippy_bubble.dart';
import 'package:onemoresip/app/widgets/status_badge.dart';
import 'package:onemoresip/core/sippy/sippy_state.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// Sample copy per board language (test data, not app strings).
typedef BoardCopy = ({
  String value,
  String unit,
  String caption,
  String sippy,
  String card,
  String add,
  String edit,
  String delete,
  String unitMl,
  String quota,
  String ad,
});

/// English sample copy.
const BoardCopy enCopy = (
  value: '1,250',
  unit: '/ 2,300 ml',
  caption: 'Today',
  sippy: 'Nice pace! One more sip before your 11:00 meeting?',
  card: 'Reminders',
  add: 'Add drink',
  edit: 'Edit goal',
  delete: 'Delete account',
  unitMl: 'ml',
  quota: 'AI photos',
  ad: 'Advertiser headline',
);

/// Arabic sample copy.
const BoardCopy arCopy = (
  value: '1,250',
  unit: '/ 2,300 مل',
  caption: 'اليوم',
  sippy: 'وتيرة رائعة! رشفة أخرى قبل اجتماعك؟',
  card: 'التذكيرات',
  add: 'أضف مشروبًا',
  edit: 'عدّل الهدف',
  delete: 'احذف الحساب',
  unitMl: 'مل',
  quota: 'صور الذكاء الاصطناعي',
  ad: 'عنوان المعلن',
);

/// Every DS-5 component that renders inline, for goldens (T-011).
class ComponentBoard extends StatelessWidget {
  /// Creates the board with [copy].
  const new({required this.copy, super.key});

  /// Sample copy.
  final BoardCopy copy;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final l10n = AppLocalizations.of(context);
    void noop() {}
    const gap = SizedBox(height: 16);
    return ColoredBox(
      color: c.bg,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BentoCard(
              color: c.accentTint,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StatusBadge(status: HydrationStatus.hydrated),
                  const SizedBox(height: 12),
                  HeroNumber(
                    value: copy.value,
                    unit: copy.unit,
                    caption: copy.caption,
                    onTint: true,
                  ),
                  const SizedBox(height: 12),
                  SippyBubble(state: SippyState.happy, message: copy.sippy),
                ],
              ),
            ),
            gap,
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                StatusBadge(status: HydrationStatus.thirsty),
                StatusBadge(status: HydrationStatus.behind),
              ],
            ),
            gap,
            BentoCard(
              icon: LucideIcons.bell,
              title: copy.card,
              onTap: noop,
              child: const Wrap(
                spacing: 24,
                runSpacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ProgressGlass(progress: 0.54),
                  ProgressRing(progress: 0.68),
                ],
              ),
            ),
            gap,
            PillButton(label: copy.add, onPressed: noop),
            const SizedBox(height: 8),
            PillButton(
              label: copy.edit,
              variant: PillButtonVariant.secondary,
              onPressed: noop,
            ),
            const SizedBox(height: 8),
            PillButton(
              label: copy.delete,
              variant: PillButtonVariant.destructive,
              size: PillButtonSize.medium,
              onPressed: noop,
            ),
            gap,
            Row(
              children: [
                for (final (i, ml) in [150, 250, 350, 500].indexed) ...[
                  if (i > 0) const SizedBox(width: 8),
                  Expanded(
                    child: QuickAddChip(
                      label: '$ml ${copy.unitMl}',
                      onPressed: noop,
                    ),
                  ),
                ],
              ],
            ),
            gap,
            BentoCard(
              child: Column(
                children: [
                  for (final (state, left) in [
                    (QuotaState.normal, 128),
                    (QuotaState.low, 8),
                    (QuotaState.empty, 0),
                  ]) ...[
                    QuotaMeter(
                      title: copy.quota,
                      remaining: left,
                      limit: 150,
                      state: state,
                      resetsOn: DateTime(2026, 11),
                    ),
                    const SizedBox(height: 16),
                  ],
                ],
              ),
            ),
            gap,
            AdCard(onReport: noop, child: Text(copy.ad)),
            gap,
            FloatingNavBar(
              destinations: [
                FloatingNavDestination(
                  icon: LucideIcons.house,
                  label: l10n.navHome,
                ),
                FloatingNavDestination(
                  icon: LucideIcons.chartColumn,
                  label: l10n.navStats,
                ),
                FloatingNavDestination(
                  icon: LucideIcons.users,
                  label: l10n.navFamily,
                ),
                FloatingNavDestination(
                  icon: LucideIcons.user,
                  label: l10n.navMe,
                ),
              ],
              selectedIndex: 0,
              onSelected: (_) {},
              onLog: noop,
            ),
          ],
        ),
      ),
    );
  }
}
