import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/features/drinks/domain/drink_catalog.dart';

/// Bundled drink database asset (F-03).
const drinksAsset = 'data/drinks.json';

/// The bundled drink catalog, loaded once.
final drinkCatalogProvider = FutureProvider<DrinkCatalog>((ref) async {
  return DrinkCatalog.fromJsonString(await rootBundle.loadString(drinksAsset));
});
