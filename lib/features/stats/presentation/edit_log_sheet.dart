import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/app/widgets/pill_button.dart';
import 'package:onemoresip/app/widgets/quick_add_chip.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/features/drinks/data/drink_catalog_provider.dart';
import 'package:onemoresip/features/drinks/domain/drink.dart';
import 'package:onemoresip/features/logging/data/drink_log_repository.dart';
import 'package:onemoresip/features/stats/presentation/history_screen.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// Bottom sheet that edits one logged drink: drink, volume and time within
/// its day (F-14).
class EditLogSheet extends ConsumerStatefulWidget {
  /// Edits [log]; [drink] is its catalog drink, `null` if unknown.
  const new({required this.log, required this.drink, super.key});

  /// The log being edited.
  final DrinkLog log;

  /// The log's drink, `null` when it is not in the catalog.
  final Drink? drink;

  @override
  ConsumerState<EditLogSheet> createState() => _EditLogSheetState();
}

class _EditLogSheetState extends ConsumerState<EditLogSheet> {
  static const _presets = [150, 250, 330, 500];
  static const _step = 50;
  static const _maxMl = 3000;

  late Drink? _drink = widget.drink;
  late int _volume = widget.log.volumeMl;
  late DateTime _loggedAt = widget.log.loggedAt.toLocal();
  bool _picking = false;
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = AppColors.of(context);
    final language = Localizations.localeOf(context).languageCode;
    final label = AppTypography.label.copyWith(
      color: c.inkMuted,
      fontWeight: FontWeight.w700,
    );
    final results = _picking
        ? ref.watch(drinkCatalogProvider).value?.search(_query) ?? const []
        : const <Drink>[];

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.gutter,
        0,
        AppSpacing.gutter,
        AppSpacing.gutter + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.historyEditTitle,
            style: AppTypography.h2.copyWith(color: c.ink),
          ),
          const SizedBox(height: AppSpacing.s24),
          Text(l10n.historyEditDrinkLabel, style: label),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: AppSpacing.s8,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(drinkIcon(_drink), color: c.ink),
                  const SizedBox(width: AppSpacing.s8),
                  Flexible(
                    child: Text(
                      _drink?.nameFor(language) ?? l10n.historyUnknownDrink,
                      style: AppTypography.bodyStrong.copyWith(color: c.ink),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => setState(() => _picking = !_picking),
                child: Text(l10n.historyEditChangeDrink),
              ),
            ],
          ),
          if (_picking) ...[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: l10n.historyEditSearch,
                prefixIcon: const Icon(LucideIcons.search),
              ),
              onChanged: (q) => setState(() => _query = q),
            ),
            SizedBox(
              height: 280,
              child: ListView(
                children: [
                  for (final drink in results)
                    ListTile(
                      leading: Icon(drinkIcon(drink)),
                      title: Text(drink.nameFor(language)),
                      onTap: () => setState(() {
                        _drink = drink;
                        _picking = false;
                        _query = '';
                      }),
                    ),
                ],
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.s24),
          Text(l10n.historyEditAmount, style: label),
          const SizedBox(height: AppSpacing.s8),
          // Inset so the surface-colored chips stand out on the sheet.
          DecoratedBox(
            decoration: BoxDecoration(
              color: c.surfaceAlt,
              borderRadius: const BorderRadius.all(
                Radius.circular(AppRadius.md),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.s8),
              child: Row(
                children: [
                  for (final (i, ml) in _presets.indexed) ...[
                    if (i > 0) const SizedBox(width: AppSpacing.s8),
                    Expanded(
                      child: QuickAddChip(
                        label: l10n.historyVolume(ml),
                        onPressed: () => setState(() => _volume = ml),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.s8),
          Row(
            children: [
              IconButton.outlined(
                tooltip: l10n.historyEditDecrease(_step),
                icon: const Icon(LucideIcons.minus),
                onPressed: _volume > _step
                    ? () => setState(() => _volume = _stepped(up: false))
                    : null,
              ),
              Expanded(
                child: Text(
                  l10n.historyVolume(_volume),
                  textAlign: TextAlign.center,
                  style: AppTypography.title.copyWith(color: c.ink),
                ),
              ),
              IconButton.outlined(
                tooltip: l10n.historyEditIncrease(_step),
                icon: const Icon(LucideIcons.plus),
                onPressed: _volume < _maxMl
                    ? () => setState(() => _volume = _stepped(up: true))
                    : null,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s24),
          Text(l10n.historyEditTime, style: label),
          const SizedBox(height: AppSpacing.s8),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(minimumSize: const Size(48, 48)),
              icon: const Icon(LucideIcons.clock),
              label: Text(formatLogTime(context, _loggedAt)),
              onPressed: _pickTime,
            ),
          ),
          const SizedBox(height: AppSpacing.s32),
          PillButton(label: l10n.historyEditSave, onPressed: _save),
        ],
      ),
    );
  }

  // One 50 ml step, snapped to the 50 ml grid, kept in 50–3,000 ml.
  int _stepped({required bool up}) {
    final snapped = _volume - _volume % _step;
    final next = up
        ? snapped + _step
        : (snapped == _volume ? snapped - _step : snapped);
    return next.clamp(_step, _maxMl);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_loggedAt),
    );
    if (picked == null) return;
    setState(
      () => _loggedAt = DateTime(
        _loggedAt.year,
        _loggedAt.month,
        _loggedAt.day,
        picked.hour,
        picked.minute,
      ),
    );
  }

  Future<void> _save() async {
    await ref
        .read(drinkLogRepositoryProvider)
        .edit(
          widget.log.id,
          drink: _drink ?? _keepDrink(widget.log),
          volumeMl: _volume,
          loggedAt: _loggedAt,
        );
    if (mounted) Navigator.of(context).pop();
  }
}

// A drink missing from the catalog (e.g. a custom drink) keeps its id and
// the counted, caffeine and sugar ratios of the logged row.
Drink _keepDrink(DrinkLog log) => Drink(
  id: log.drinkId,
  nameEn: '',
  nameId: '',
  localName: '',
  category: DrinkCategory.water,
  defaultServingMl: log.volumeMl,
  waterPct: log.hydrationMl * 100 / log.volumeMl,
  isAlcoholic: false,
  sugarGPer100Ml: (log.sugarG ?? 0) * 100 / log.volumeMl,
  caffeineMgPer100Ml: (log.caffeineMg ?? 0) * 100 / log.volumeMl,
);
