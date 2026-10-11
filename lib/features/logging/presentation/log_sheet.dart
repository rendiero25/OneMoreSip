import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/router.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/app/widgets/app_bottom_sheet.dart';
import 'package:onemoresip/app/widgets/pill_button.dart';
import 'package:onemoresip/app/widgets/undo_snackbar.dart';
import 'package:onemoresip/core/analytics/analytics_event.dart';
import 'package:onemoresip/core/analytics/telemetry.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/features/drinks/data/drink_catalog_provider.dart';
import 'package:onemoresip/features/drinks/domain/drink.dart';
import 'package:onemoresip/features/drinks/presentation/drink_visuals.dart';
import 'package:onemoresip/features/logging/data/drink_log_repository.dart';
import 'package:onemoresip/features/profile/data/device_timezone.dart';
import 'package:onemoresip/features/profile/data/profile_repository.dart';
import 'package:onemoresip/features/safety/domain/over_drinking.dart';
import 'package:onemoresip/features/safety/presentation/over_drinking_notice.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// Preset volumes of the log sheet (F-02).
const presetVolumesMl = [150, 250, 350, 500];

/// Custom volume range and step (D-35).
const minCustomMl = 50;

/// Upper end of the custom volume (D-35).
const maxCustomMl = 1500;

/// Step of the custom volume stepper and slider (D-35).
const customStepMl = 10;

/// Number of drink tiles in the sheet.
const _tileCount = 4;

/// Shown when there are fewer recent drinks than tiles (never alcohol).
const _defaultDrinkIds = [
  'water_plain', // i18n-ignore
  'tea_black', // i18n-ignore
  'coffee_black', // i18n-ignore
  'juice_orange', // i18n-ignore
];

/// What the log sheet reads when it opens; all local, so it works offline.
typedef LogSheetData = ({
  Profile profile,
  List<Drink> tiles,
  int todayMl,
  int lastHourMl,
});

/// Loads [LogSheetData], creating the guest profile on first use.
final FutureProvider<LogSheetData> logSheetDataProvider =
    FutureProvider.autoDispose<LogSheetData>((ref) async {
      final catalog = await ref.watch(drinkCatalogProvider.future);
      final profile = await ref
          .read(profileRepositoryProvider)
          .getOrCreateGuest(timezone: deviceTimezone());
      final logs = ref.read(drinkLogRepositoryProvider);
      final now = DateTime.now();
      final byId = {for (final drink in catalog.drinks) drink.id: drink};
      final recent = await logs.recentDrinkIds(profile.id);
      final tiles = <Drink>[];
      for (final id in [...recent, ..._defaultDrinkIds]) {
        final drink = byId[id];
        // Alcohol is never offered as a shortcut (D-23); the picker has it.
        if (drink == null || drink.isAlcoholic || tiles.contains(drink)) {
          continue;
        }
        tiles.add(drink);
        if (tiles.length == _tileCount) break;
      }
      return (
        profile: profile,
        tiles: tiles,
        todayMl: await logs.hydrationMlOn(profile.id, now),
        lastHourMl: await logs.hydrationMlSince(
          profile.id,
          now.subtract(const Duration(hours: 1)),
        ),
      );
    });

/// A saved log and its drink, returned by the sheet.
typedef LoggedDrink = ({DrinkLog log, Drink drink});

/// Opens the UI-04 log sheet over the current screen. After a drink is
/// added it shows the 5 s undo snackbar; Undo soft-deletes the log (F-02).
Future<void> showLogSheet(BuildContext context) async {
  final added = await showAppBottomSheet<LoggedDrink>(
    context,
    builder: (_) => const LogSheet(),
  );
  if (added == null || !context.mounted) return;
  final repository = ProviderScope.containerOf(
    context,
    listen: false,
  ).read(drinkLogRepositoryProvider);
  final language = Localizations.localeOf(context).languageCode;
  showUndoSnackbar(
    context,
    message: AppLocalizations.of(context)
        .logAdded(added.log.volumeMl, added.drink.nameFor(language)),
    onUndo: () => unawaited(repository.delete(added.log.id)),
  );
}

/// UI-04 sheet: drink tiles, preset / custom volume, BR-03 note, BR-06
/// notice and "Add drink". Pops a [LoggedDrink] once saved.
class LogSheet extends ConsumerStatefulWidget {
  /// Creates the sheet.
  const new({super.key});

  @override
  ConsumerState<LogSheet> createState() => _LogSheetState();
}

class _LogSheetState extends ConsumerState<LogSheet> {
  Drink? _picked;
  int _volumeMl = 250;
  bool _custom = false;
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = AppColors.of(context);
    return ref
        .watch(logSheetDataProvider)
        .when(
          data: _content,
          loading: () => const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (_, _) => Padding(
            padding: const EdgeInsets.all(AppSpacing.gutter),
            child: Text(
              l10n.logLoadError,
              style: AppTypography.body.copyWith(color: c.ink),
            ),
          ),
        );
  }

  Widget _content(LogSheetData data) {
    final l10n = AppLocalizations.of(context);
    final c = AppColors.of(context);
    final large = MediaQuery.textScalerOf(context).scale(1) > 1.3;
    final drink = _picked ?? data.tiles.first;
    final tiles = data.tiles.contains(drink)
        ? data.tiles
        : [drink, ...data.tiles.take(_tileCount - 1)];
    final counted = drink.hydrationFor(_volumeMl);
    final warning = overDrinkingWarning(
      last60MinMl: data.lastHourMl + counted,
      todayMl: data.todayMl + counted,
      goalMl: data.profile.goalOverrideMl ?? 0,
      restrictionMl: data.profile.fluidRestrictionMl,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Semantics(
                        header: true,
                        child: Text(
                          l10n.logSheetTitle,
                          style: AppTypography.h2.copyWith(
                            color: c.ink,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s12),
                    IconButton(
                      icon: const Icon(LucideIcons.x),
                      tooltip: MaterialLocalizations.of(context)
                          .closeButtonTooltip,
                      color: c.ink,
                      style: IconButton.styleFrom(
                        backgroundColor: c.surfaceAlt,
                        minimumSize: const Size.square(48),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.s16),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _SectionLabel(l10n.logRecentDrinks),
                    TextButton.icon(
                      onPressed: _openPicker,
                      icon: const Icon(LucideIcons.search, size: 20),
                      label: Text(l10n.logAllDrinks),
                      style: TextButton.styleFrom(
                        foregroundColor: c.accentInk,
                        minimumSize: const Size(48, 48),
                        textStyle: AppTypography.label.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.s8),
                _EvenGrid(
                  columns: large ? 2 : _tileCount,
                  children: [
                    for (final tile in tiles)
                      _DrinkTile(
                        drink: tile,
                        selected: tile == drink,
                        onTap: () => setState(() => _picked = tile),
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.s16),
                _SectionLabel(l10n.logAmount),
                const SizedBox(height: AppSpacing.s8),
                _EvenGrid(
                  columns: large ? 2 : presetVolumesMl.length + 1,
                  children: [
                    for (final ml in presetVolumesMl)
                      _VolumeChip(
                        label: l10n.logVolumeMl(ml),
                        selected: !_custom && _volumeMl == ml,
                        onTap: () => setState(() {
                          _custom = false;
                          _volumeMl = ml;
                        }),
                      ),
                    _VolumeChip(
                      label: l10n.logCustom,
                      icon: LucideIcons.slidersHorizontal,
                      selected: _custom,
                      onTap: () => setState(() => _custom = true),
                    ),
                  ],
                ),
                if (_custom) ...[
                  const SizedBox(height: AppSpacing.s12),
                  _CustomVolume(
                    volumeMl: _volumeMl,
                    onChanged: (ml) => setState(() => _volumeMl = ml),
                  ),
                ],
                ..._note(drink, counted),
                if (warning != OverDrinkingWarning.none) ...[
                  const SizedBox(height: AppSpacing.s12),
                  OverDrinkingNotice(warning: warning),
                ],
                const SizedBox(height: AppSpacing.s16),
              ],
            ),
          ),
        ),
        SafeArea(
          top: false,
          minimum: const EdgeInsets.fromLTRB(
            AppSpacing.gutter,
            AppSpacing.s8,
            AppSpacing.gutter,
            AppSpacing.s20,
          ),
          child: SizedBox(
            width: double.infinity,
            child: PillButton(
              label: l10n.logAddButton,
              onPressed: () => unawaited(_add(data.profile, drink)),
            ),
          ),
        ),
      ],
    );
  }

  /// BR-03 note for anything that is not counted 1:1 or has sugar.
  List<Widget> _note(Drink drink, int counted) {
    final l10n = AppLocalizations.of(context);
    final sugar = (drink.sugarGPer100Ml * _volumeMl / 100).round();
    final String text;
    final IconData icon;
    if (drink.isAlcoholic) {
      text = l10n.drinkNotCounted;
      icon = LucideIcons.ban;
    } else if (counted == _volumeMl && sugar == 0) {
      return const [];
    } else {
      text = sugar > 0
          ? l10n.logCountsAsWithSugar(counted, sugar)
          : l10n.logCountsAs(counted);
      icon = LucideIcons.info;
    }
    final c = AppColors.of(context);
    return [
      const SizedBox(height: AppSpacing.s12),
      Semantics(
        container: true,
        liveRegion: true,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: drink.isAlcoholic ? c.surfaceAlt : c.sunTint,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: AppSpacing.s12,
            ),
            child: Row(
              children: [
                Icon(icon, size: 20, color: c.ink),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    text,
                    style: AppTypography.label.copyWith(
                      color: c.ink,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }

  Future<void> _openPicker() async {
    final drink = await context.push<Drink>(Routes.drinks);
    if (drink != null && mounted) setState(() => _picked = drink);
  }

  Future<void> _add(Profile profile, Drink drink) async {
    if (_saving) return;
    _saving = true;
    final log = await ref
        .read(drinkLogRepositoryProvider)
        .add(
          profileId: profile.id,
          drink: drink,
          volumeMl: _volumeMl,
          source: 'app', // i18n-ignore
          loggedAt: DateTime.now(),
        );
    // Only the source enum; never volume or drink (SD-9).
    unawaited(
      ref
          .read(telemetryProvider)
          .track(const DrinkLogged(DrinkLogSource.inApp)),
    );
    if (mounted) {
      Navigator.of(context).pop<LoggedDrink>((log: log, drink: drink));
    }
  }
}

class _SectionLabel extends StatelessWidget {
  const new(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.label.copyWith(
        color: AppColors.of(context).inkMuted,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

/// Rows of [columns] equal-width cells, each row as tall as its tallest
/// cell, so large text grows the cells instead of clipping (DS-6).
class _EvenGrid extends StatelessWidget {
  const new({required this.columns, required this.children});

  final int columns;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var start = 0; start < children.length; start += columns)
          Padding(
            padding: EdgeInsets.only(top: start == 0 ? 0 : AppSpacing.s8),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = start; i < start + columns; i++) ...[
                    if (i > start) const SizedBox(width: AppSpacing.s8),
                    Expanded(
                      child: i < children.length
                          ? children[i]
                          : const SizedBox.shrink(),
                    ),
                  ],
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// Drink tile; selected = accent border, tint and a check mark.
class _DrinkTile extends StatelessWidget {
  const new({required this.drink, required this.selected, required this.onTap});

  final Drink drink;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final name = drink.nameFor(Localizations.localeOf(context).languageCode);
    return Semantics(
      button: true,
      selected: selected,
      inMutuallyExclusiveGroup: true,
      child: Material(
        color: selected ? c.accentTint : c.surfaceAlt,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(AppRadius.md)),
          side: BorderSide(
            color: selected ? c.accent : Colors.transparent,
            width: 2,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 104),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.s4,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      DrinkIconWell(category: drink.category),
                      if (selected)
                        PositionedDirectional(
                          top: -6,
                          end: -6,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: c.accent,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Icon(
                                LucideIcons.check,
                                size: 14,
                                color: c.onAccent,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.s8),
                  Text(
                    name,
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
    );
  }
}

/// Volume chip (64 dp); selected = `ink` fill plus a check mark.
class _VolumeChip extends StatelessWidget {
  const new({
    required this.label,
    required this.selected,
    required this.onTap,
    this.icon,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final fg = selected ? c.onInk : c.ink;
    final leading = selected ? LucideIcons.check : icon;
    return Semantics(
      button: true,
      selected: selected,
      inMutuallyExclusiveGroup: true,
      child: Material(
        color: selected ? c.ink : c.surfaceAlt,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.sm)),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 64),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.s4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leading != null) Icon(leading, size: 18, color: fg),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: AppTypography.label.copyWith(
                      color: fg,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Large − / + stepper and slider, [minCustomMl]–[maxCustomMl] in
/// [customStepMl] steps (D-35).
class _CustomVolume extends StatelessWidget {
  const new({required this.volumeMl, required this.onChanged});

  final int volumeMl;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final l10n = AppLocalizations.of(context);
    void set(num ml) => onChanged(
      ((ml / customStepMl).round() * customStepMl).clamp(
        minCustomMl,
        maxCustomMl,
      ),
    );
    Widget step(IconData icon, String tooltip, int delta) => IconButton(
      icon: Icon(icon),
      tooltip: tooltip,
      color: c.ink,
      style: IconButton.styleFrom(
        backgroundColor: c.surface,
        minimumSize: const Size.square(48),
      ),
      onPressed: () => set(volumeMl + delta),
    );
    return DecoratedBox(
      decoration: BoxDecoration(
        color: c.accentTint,
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.md)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: 14,
        ),
        child: Column(
          children: [
            Row(
              children: [
                step(
                  LucideIcons.minus,
                  l10n.logDecrease(customStepMl),
                  -customStepMl,
                ),
                Expanded(
                  child: Semantics(
                    liveRegion: true,
                    child: Text(
                      l10n.logVolumeMl(volumeMl),
                      textAlign: TextAlign.center,
                      style: AppTypography.display.copyWith(
                        color: c.ink,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                step(
                  LucideIcons.plus,
                  l10n.logIncrease(customStepMl),
                  customStepMl,
                ),
              ],
            ),
            Semantics(
              label: l10n.logCustomAmount,
              child: Slider(
                value: volumeMl.toDouble(),
                min: minCustomMl.toDouble(),
                max: maxCustomMl.toDouble(),
                divisions: (maxCustomMl - minCustomMl) ~/ customStepMl,
                semanticFormatterCallback: (v) => l10n.logVolumeMl(v.round()),
                onChanged: set,
              ),
            ),
            ExcludeSemantics(
              child: Row(
                children: [
                  for (final (ml, align) in [
                    (minCustomMl, TextAlign.start),
                    (maxCustomMl, TextAlign.end),
                  ])
                    Expanded(
                      child: Text(
                        l10n.logVolumeMl(ml),
                        textAlign: align,
                        style: AppTypography.label.copyWith(
                          color: c.mutedOnTint,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
