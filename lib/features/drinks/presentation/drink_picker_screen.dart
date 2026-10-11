import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/features/drinks/data/drink_catalog_provider.dart';
import 'package:onemoresip/features/drinks/domain/drink.dart';
import 'package:onemoresip/features/drinks/presentation/drink_visuals.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// Glass size the sugar and caffeine badges refer to (UI-05).
const badgeGlassMl = 250;

/// UI-05 drink picker: search, category chips and the catalog list. Pops
/// the chosen [Drink]. Custom drinks and "Data sources" come with T-021.
class DrinkPickerScreen extends ConsumerStatefulWidget {
  /// Creates the picker.
  const new({super.key});

  @override
  ConsumerState<DrinkPickerScreen> createState() => _DrinkPickerScreenState();
}

class _DrinkPickerScreenState extends ConsumerState<DrinkPickerScreen> {
  String _query = '';
  DrinkCategory? _category;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final l10n = AppLocalizations.of(context);
    final catalog = ref.watch(drinkCatalogProvider).value;
    final drinks = [
      for (final drink in catalog?.search(_query) ?? const <Drink>[])
        if (_category == null || drink.category == _category) drink,
    ];
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.gutter,
                AppSpacing.s8,
                AppSpacing.gutter,
                0,
              ),
              sliver: SliverList.list(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const BackButtonIcon(),
                        tooltip: MaterialLocalizations.of(context)
                            .backButtonTooltip,
                        onPressed: () => context.pop(),
                        style: IconButton.styleFrom(
                          backgroundColor: c.surface,
                          minimumSize: const Size.square(48),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.s12),
                      Expanded(
                        child: Semantics(
                          header: true,
                          child: Text(
                            l10n.pickerTitle,
                            style: AppTypography.h2.copyWith(color: c.ink),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.s16),
                  TextField(
                    onChanged: (value) => setState(() => _query = value),
                    textInputAction: TextInputAction.search,
                    style: AppTypography.body.copyWith(color: c.ink),
                    decoration: InputDecoration(
                      hintText: l10n.pickerSearch,
                      hintStyle: AppTypography.body.copyWith(color: c.inkMuted),
                      prefixIcon: Icon(LucideIcons.search, color: c.inkMuted),
                      filled: true,
                      fillColor: c.surface,
                      enabledBorder: _border(c.line, 1.5),
                      focusedBorder: _border(c.ink, 2),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: _categoryChips(context)),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.gutter,
                AppSpacing.s4,
                AppSpacing.gutter,
                AppSpacing.s32,
              ),
              sliver: SliverList.list(
                children: [
                  if (_category == DrinkCategory.alcohol) ...[
                    _Note(text: l10n.pickerAlcoholNote),
                    const SizedBox(height: AppSpacing.s12),
                  ],
                  Text(
                    l10n.pickerPerGlass(badgeGlassMl),
                    style: AppTypography.label.copyWith(color: c.inkMuted),
                  ),
                  const SizedBox(height: AppSpacing.s8),
                  if (catalog != null && drinks.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.s20),
                      child: Text(
                        l10n.pickerNoResults(_query.trim()),
                        textAlign: TextAlign.center,
                        style: AppTypography.bodyStrong.copyWith(color: c.ink),
                      ),
                    ),
                  if (drinks.isNotEmpty)
                    Material(
                      color: c.surface,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppRadius.lg),
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          children: [
                            for (final drink in drinks)
                              _DrinkRow(
                                drink: drink,
                                onTap: () => context.pop(drink),
                              ),
                          ],
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

  Widget _categoryChips(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final options = <(DrinkCategory?, String)>[
      (null, l10n.pickerCategoryAll),
      for (final category in DrinkCategory.values)
        (category, drinkCategoryLabel(l10n, category)),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.gutter,
        vertical: AppSpacing.s12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final (category, label) in options)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: AppSpacing.s8),
              child: _CategoryChip(
                label: label,
                selected: _category == category,
                onTap: () => setState(() => _category = category),
              ),
            ),
        ],
      ),
    );
  }

  static OutlineInputBorder _border(Color color, double width) =>
      OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.md)),
        borderSide: BorderSide(color: color, width: width),
      );
}

/// Category filter chip; selected = `ink` fill plus a check mark, never
/// color alone.
class _CategoryChip extends StatelessWidget {
  const new({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final fg = selected ? c.onInk : c.ink;
    return Semantics(
      button: true,
      selected: selected,
      inMutuallyExclusiveGroup: true,
      child: Material(
        color: selected ? c.ink : c.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.sm)),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 48),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.s16,
                vertical: AppSpacing.s8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (selected) ...[
                    Icon(LucideIcons.check, size: 18, color: fg),
                    const SizedBox(width: AppSpacing.s4),
                  ],
                  Text(
                    label,
                    style: AppTypography.label.copyWith(
                      color: fg,
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

/// One catalog row: icon, name in the app language, local name, sugar /
/// caffeine badges per [badgeGlassMl] and "Logged, not counted" for
/// alcohol (D-23).
class _DrinkRow extends StatelessWidget {
  const new({required this.drink, required this.onTap});

  final Drink drink;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final l10n = AppLocalizations.of(context);
    final name = drink.nameFor(Localizations.localeOf(context).languageCode);
    final local = drink.localName;
    final sugar = (drink.sugarGPer100Ml * badgeGlassMl / 100).round();
    final caffeine = (drink.caffeineMgPer100Ml * badgeGlassMl / 100).round();
    return Semantics(
      button: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(22)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 72),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s12,
              vertical: 10,
            ),
            child: Row(
              children: [
                DrinkIconWell(category: drink.category),
                const SizedBox(width: AppSpacing.s12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppTypography.bodyStrong.copyWith(
                          color: c.ink,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      if (local.isNotEmpty && local != name)
                        Text(
                          local,
                          style: AppTypography.label.copyWith(
                            color: c.inkMuted,
                          ),
                        ),
                      if (drink.isAlcoholic || sugar > 0 || caffeine > 0)
                        Padding(
                          padding: const EdgeInsets.only(top: AppSpacing.s4),
                          child: Wrap(
                            spacing: 6,
                            runSpacing: AppSpacing.s4,
                            children: [
                              if (drink.isAlcoholic)
                                DrinkBadge(
                                  icon: LucideIcons.ban,
                                  text: l10n.drinkNotCounted,
                                  color: c.surfaceAlt,
                                )
                              else ...[
                                if (sugar > 0)
                                  DrinkBadge(
                                    icon: LucideIcons.candy,
                                    text: l10n.drinkSugarBadge(sugar),
                                    color: c.sunTint,
                                  ),
                                if (caffeine > 0)
                                  DrinkBadge(
                                    icon: LucideIcons.zap,
                                    text: l10n.drinkCaffeineBadge(caffeine),
                                    color: c.coralTint,
                                  ),
                              ],
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.s12),
                ExcludeSemantics(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: drink.isAlcoholic ? c.surfaceAlt : c.accent,
                    ),
                    child: SizedBox.square(
                      dimension: 36,
                      child: Icon(
                        LucideIcons.plus,
                        size: 18,
                        color: drink.isAlcoholic ? c.ink : c.onAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Info icon + text on `surfaceAlt`.
class _Note extends StatelessWidget {
  const new({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: c.surfaceAlt,
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.md)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: AppSpacing.s12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(LucideIcons.info, size: 20, color: c.ink),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: AppTypography.label.copyWith(
                  color: c.ink,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
