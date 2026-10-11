import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/features/drinks/domain/drink.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// Lucide icon for a drink category (DS-7).
IconData drinkCategoryIcon(DrinkCategory category) => switch (category) {
  DrinkCategory.water => LucideIcons.droplet,
  DrinkCategory.coconut => LucideIcons.treePalm,
  DrinkCategory.coffee => LucideIcons.coffee,
  DrinkCategory.tea => LucideIcons.leaf,
  DrinkCategory.dairy => LucideIcons.milk,
  DrinkCategory.plantMilk => LucideIcons.sprout,
  DrinkCategory.juice => LucideIcons.citrus,
  DrinkCategory.smoothie => LucideIcons.blend,
  DrinkCategory.soda => LucideIcons.cupSoda,
  DrinkCategory.sports => LucideIcons.activity,
  DrinkCategory.energy => LucideIcons.zap,
  DrinkCategory.traditional => LucideIcons.soup,
  DrinkCategory.alcohol => LucideIcons.wine,
};

/// Translated category name.
String drinkCategoryLabel(AppLocalizations l10n, DrinkCategory category) =>
    switch (category) {
      DrinkCategory.water => l10n.drinkCategoryWater,
      DrinkCategory.coconut => l10n.drinkCategoryCoconut,
      DrinkCategory.coffee => l10n.drinkCategoryCoffee,
      DrinkCategory.tea => l10n.drinkCategoryTea,
      DrinkCategory.dairy => l10n.drinkCategoryDairy,
      DrinkCategory.plantMilk => l10n.drinkCategoryPlantMilk,
      DrinkCategory.juice => l10n.drinkCategoryJuice,
      DrinkCategory.smoothie => l10n.drinkCategorySmoothie,
      DrinkCategory.soda => l10n.drinkCategorySoda,
      DrinkCategory.sports => l10n.drinkCategorySports,
      DrinkCategory.energy => l10n.drinkCategoryEnergy,
      DrinkCategory.traditional => l10n.drinkCategoryTraditional,
      DrinkCategory.alcohol => l10n.drinkCategoryAlcohol,
    };

/// 48 dp rounded icon well of a drink, tinted by category (text-free, so
/// any DS-1 tint works; the icon is `ink`).
class DrinkIconWell extends StatelessWidget {
  /// Creates the well for [category].
  const new({required this.category, super.key});

  /// Drink category.
  final DrinkCategory category;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final tint = switch (category) {
      DrinkCategory.water => c.accentTint,
      DrinkCategory.tea ||
      DrinkCategory.juice ||
      DrinkCategory.traditional => c.sunTint,
      DrinkCategory.coffee ||
      DrinkCategory.soda ||
      DrinkCategory.energy => c.coralTint,
      DrinkCategory.coconut ||
      DrinkCategory.sports ||
      DrinkCategory.smoothie => c.mint,
      DrinkCategory.dairy ||
      DrinkCategory.plantMilk ||
      DrinkCategory.alcohol => c.nightTint,
    };
    return DecoratedBox(
      decoration: BoxDecoration(
        color: tint,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: SizedBox.square(
        dimension: 48,
        child: Icon(drinkCategoryIcon(category), size: 26, color: c.ink),
      ),
    );
  }
}

/// Small icon + text badge (sugar, caffeine, "Logged, not counted").
class DrinkBadge extends StatelessWidget {
  /// Creates a badge.
  const new({
    required this.icon,
    required this.text,
    required this.color,
    super.key,
  });

  /// Leading icon.
  final IconData icon;

  /// Badge text.
  final String text;

  /// Background tint; text and icon are `ink`.
  final Color color;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s8,
          vertical: 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: c.ink),
            const SizedBox(width: AppSpacing.s4),
            Flexible(
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
    );
  }
}
