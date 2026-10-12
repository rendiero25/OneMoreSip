import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/app/widgets/app_bottom_sheet.dart';
import 'package:onemoresip/app/widgets/undo_snackbar.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/core/flags/feature_flags.dart';
import 'package:onemoresip/features/drinks/data/drink_catalog_provider.dart';
import 'package:onemoresip/features/drinks/domain/drink.dart';
import 'package:onemoresip/features/logging/data/drink_log_repository.dart';
import 'package:onemoresip/features/profile/data/profile_repository.dart';
import 'package:onemoresip/features/stats/data/history_providers.dart';
import 'package:onemoresip/features/stats/presentation/edit_log_sheet.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// UI-09 Stats tab. For now only the drink history with edit and delete
/// (F-14, T-033); the statistics part comes with T-034.
class HistoryScreen extends ConsumerWidget {
  /// Creates the screen.
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = AppColors.of(context);
    final days = ref.watch(historyProvider).value ?? const <HistoryDay>[];
    final restricted =
        ref.watch(currentProfileProvider).value?.fluidRestrictionMl != null;
    final today = localDay(ref.watch(clockProvider)());
    final catalog = ref.watch(drinkCatalogProvider).value;
    final drinks = {
      for (final d in catalog?.drinks ?? const <Drink>[]) d.id: d,
    };

    final items = <WidgetBuilder>[
      (_) => Text(
        l10n.historyTitle,
        style: AppTypography.h1.copyWith(color: c.ink),
      ),
      // T-034: the Statistics / History switch and the statistics (charts,
      // averages, premium gate) go here, above the history list (UI-09).
      // T-091 adds the native ad between entries for free users.
      for (final day in days) ...[
        (_) => _DayHeader(day: day, today: today, restricted: restricted),
        if (day.logs.isEmpty)
          (_) => Text(
            l10n.historyNoDrinksToday,
            style: AppTypography.body.copyWith(color: c.inkMuted),
          ),
        for (final log in day.logs)
          (_) => _LogRow(
            key: ValueKey(log.id),
            log: log,
            drink: drinks[log.drinkId],
          ),
      ],
    ];

    return SafeArea(
      bottom: false,
      child: ListView.separated(
        // With the shell's extendBody, the bottom padding includes the
        // floating navbar.
        padding: EdgeInsets.fromLTRB(
          AppSpacing.gutter,
          AppSpacing.s16,
          AppSpacing.gutter,
          MediaQuery.paddingOf(context).bottom + AppSpacing.s24,
        ),
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.s8),
        itemBuilder: (context, i) => items[i](context),
      ),
    );
  }
}

class _DayHeader extends StatelessWidget {
  const new({required this.day, required this.today, required this.restricted});

  final HistoryDay day;
  final DateTime today;
  final bool restricted;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = AppColors.of(context);
    final yesterday = DateTime(today.year, today.month, today.day - 1);
    final title = day.date == today
        ? l10n.historyToday
        : day.date == yesterday
        ? l10n.historyYesterday
        : l10n.historyDate(day.date);
    // Under a doctor's limit the goal is the limit: shown as a limit, never
    // celebrated as a target (F-28).
    final total = restricted
        ? l10n.historyDayTotalLimit(day.hydrationMl, day.goalMl)
        : l10n.historyDayTotal(day.hydrationMl, day.goalMl);
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: AppSpacing.s16,
        start: AppSpacing.s4,
        end: AppSpacing.s4,
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: AppSpacing.s8,
        runSpacing: AppSpacing.s4,
        children: [
          Semantics(
            header: true,
            child: Text(
              title,
              style: AppTypography.bodyStrong.copyWith(color: c.ink),
            ),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: AppSpacing.s8,
            runSpacing: AppSpacing.s4,
            children: [
              Text(
                total,
                style: AppTypography.label.copyWith(
                  color: c.accentInk,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (!restricted && day.goalMet) const _GoalMetBadge(),
            ],
          ),
        ],
      ),
    );
  }
}

/// Icon + text + color, never color alone (DS-6).
class _GoalMetBadge extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: c.okBg,
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.pill)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s12,
          vertical: AppSpacing.s4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LucideIcons.circleCheck, size: 16, color: c.okFg),
            const SizedBox(width: AppSpacing.s4),
            Flexible(
              child: Text(
                AppLocalizations.of(context).historyGoalMet,
                style: AppTypography.label.copyWith(
                  color: c.okFg,
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

class _LogRow extends ConsumerWidget {
  const new({required this.log, required this.drink, super.key});

  final DrinkLog log;

  /// `null` when the drink is not in the catalog (e.g. a custom drink).
  final Drink? drink;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final c = AppColors.of(context);
    final name =
        drink?.nameFor(Localizations.localeOf(context).languageCode) ??
        l10n.historyUnknownDrink;
    final time = formatLogTime(context, log.loggedAt);
    final counted = drink?.isAlcoholic ?? false
        ? l10n.historyNotCounted
        : log.hydrationMl == log.volumeMl
        ? null
        : l10n.historyCounts(log.hydrationMl);

    return Material(
      color: c.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(
          AppSpacing.s12,
          AppSpacing.s8,
          AppSpacing.s4,
          AppSpacing.s8,
        ),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: c.accentTint,
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppRadius.sm),
                ),
              ),
              child: SizedBox.square(
                dimension: 44,
                child: Icon(drinkIcon(drink), size: 24, color: c.ink),
              ),
            ),
            const SizedBox(width: AppSpacing.s12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTypography.bodyStrong.copyWith(color: c.ink),
                  ),
                  Wrap(
                    spacing: AppSpacing.s8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        l10n.historyVolume(log.volumeMl),
                        style: AppTypography.label.copyWith(
                          color: c.ink,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        time,
                        style: AppTypography.caption.copyWith(
                          color: c.inkMuted,
                        ),
                      ),
                      if (counted != null)
                        Text(
                          counted,
                          style: AppTypography.label.copyWith(
                            color: c.inkMuted,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: l10n.historyEditLog(name, time),
              icon: Icon(LucideIcons.pencil, color: c.ink),
              onPressed: () => showAppBottomSheet<void>(
                context,
                builder: (_) => EditLogSheet(log: log, drink: drink),
              ),
            ),
            IconButton(
              tooltip: l10n.historyDeleteLog(name, time),
              icon: Icon(LucideIcons.trash2, color: c.badFg),
              onPressed: () => _delete(context, ref),
            ),
          ],
        ),
      ),
    );
  }

  // The snackbar is shown right away: once the delete lands, this row is
  // gone and its context with it. Database writes run in order, so the
  // undo always follows the delete.
  void _delete(BuildContext context, WidgetRef ref) {
    final repo = ref.read(drinkLogRepositoryProvider);
    final deleted = repo.delete(log.id);
    unawaited(deleted);
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    showUndoSnackbar(
      context,
      message: AppLocalizations.of(context).historyDeleted,
      onUndo: () => unawaited(deleted.then((_) => repo.restore(log.id))),
    );
  }
}

/// [time] as a local time of day in the device's 12/24 h format.
String formatLogTime(BuildContext context, DateTime time) =>
    MaterialLocalizations.of(context).formatTimeOfDay(
      TimeOfDay.fromDateTime(time.toLocal()),
      alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
    );

/// Icon for [drink]'s category; a glass for unknown drinks.
IconData drinkIcon(Drink? drink) => switch (drink?.category) {
  DrinkCategory.water => LucideIcons.droplet,
  DrinkCategory.coffee => LucideIcons.coffee,
  DrinkCategory.tea => LucideIcons.leaf,
  DrinkCategory.dairy || DrinkCategory.plantMilk => LucideIcons.milk,
  DrinkCategory.juice || DrinkCategory.smoothie => LucideIcons.citrus,
  DrinkCategory.soda ||
  DrinkCategory.sports ||
  DrinkCategory.energy => LucideIcons.cupSoda,
  DrinkCategory.alcohol => LucideIcons.wine,
  DrinkCategory.coconut ||
  DrinkCategory.traditional ||
  null => LucideIcons.glassWater,
};
