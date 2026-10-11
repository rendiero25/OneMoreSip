import 'package:onemoresip/features/logging/domain/hydration.dart';

/// Drink categories of the bundled database (data/README.md).
enum DrinkCategory {
  /// Plain or flavoured water.
  water,

  /// Coconut water.
  coconut,

  /// Coffee drinks.
  coffee,

  /// Tea drinks.
  tea,

  /// Dairy milk drinks.
  dairy,

  /// Plant-based milks.
  plantMilk,

  /// Juices.
  juice,

  /// Smoothies.
  smoothie,

  /// Soft drinks.
  soda,

  /// Sports and electrolyte drinks.
  sports,

  /// Energy drinks.
  energy,

  /// Traditional drinks.
  traditional,

  /// Alcoholic drinks — logged, never counted (D-23).
  alcohol,
}

/// One drink from `data/drinks.json` (F-03).
class Drink {
  /// Creates a drink.
  const new({
    required this.id,
    required this.nameEn,
    required this.nameId,
    required this.localName,
    required this.category,
    required this.defaultServingMl,
    required this.waterPct,
    required this.isAlcoholic,
    required this.sugarGPer100Ml,
    required this.caffeineMgPer100Ml,
  });

  /// Parses one entry; throws [FormatException] on malformed data.
  factory fromJson(Map<String, Object?> json) {
    if (json case {
      'id': final String id,
      'name_en': final String nameEn,
      'name_id': final String nameId,
      'local_name': final String localName,
      'category': final String category,
      'default_serving_ml': final int defaultServingMl,
      'water_pct': final num waterPct,
      'is_alcoholic': final bool isAlcoholic,
      'sugar_g_per_100ml': final num sugar,
      'caffeine_mg_per_100ml': final num caffeine,
    }) {
      return Drink(
        id: id,
        nameEn: nameEn,
        nameId: nameId,
        localName: localName,
        category: _category(category),
        defaultServingMl: defaultServingMl,
        waterPct: waterPct.toDouble(),
        isAlcoholic: isAlcoholic,
        sugarGPer100Ml: sugar.toDouble(),
        caffeineMgPer100Ml: caffeine.toDouble(),
      );
    }
    throw FormatException('Invalid drink entry', json);
  }

  /// Stable id, also the ARB key suffix for translated names (T-130).
  final String id;

  /// English name.
  final String nameEn;

  /// Indonesian name.
  final String nameId;

  /// Name in the country of origin, or empty.
  final String localName;

  /// Category.
  final DrinkCategory category;

  /// Default serving size.
  final int defaultServingMl;

  /// Water content in percent.
  final double waterPct;

  /// Alcoholic drinks count 0 toward the goal (D-23).
  final bool isAlcoholic;

  /// Total sugar per 100 ml (estimate).
  final double sugarGPer100Ml;

  /// Caffeine per 100 ml (estimate).
  final double caffeineMgPer100Ml;

  /// Millilitres of [volumeMl] that count toward the goal (BR-03).
  int hydrationFor(int volumeMl) => hydrationMl(
    volumeMl: volumeMl,
    waterPct: waterPct,
    isAlcoholic: isAlcoholic,
  );

  /// Display name for [languageCode]: Indonesian for `id`, else English
  /// until ES/PT/AR names are translated (T-130).
  String nameFor(String languageCode) => languageCode == 'id' ? nameId : nameEn;

  static DrinkCategory _category(String value) => switch (value) {
    'plant_milk' => DrinkCategory.plantMilk,
    _ => DrinkCategory.values.firstWhere(
      (c) => c.name == value,
      orElse: () => throw FormatException('Unknown drink category', value),
    ),
  };
}
