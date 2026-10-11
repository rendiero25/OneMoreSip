import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/features/drinks/domain/drink.dart';
import 'package:onemoresip/features/drinks/domain/drink_catalog.dart';

void main() {
  final catalog = DrinkCatalog.fromJsonString(
    File('data/drinks.json').readAsStringSync(),
  );

  test('loads the whole bundled database (F-03: >= 160 drinks)', () {
    expect(catalog.drinks.length, greaterThanOrEqualTo(160));
    expect(
      catalog.drinks.map((d) => d.id).toSet(),
      hasLength(catalog.drinks.length),
      reason: 'ids are unique',
    );
  });

  test('finds "es teh manis" in Indonesian (T-021)', () {
    expect(catalog.search('es teh manis').first.id, 'tea_sweet_iced');
  });

  test('finds "iced sweet tea" in English (T-021)', () {
    expect(catalog.search('iced sweet tea').first.id, 'tea_sweet_iced');
  });

  test('search ignores case, accents and word order', () {
    final ids = catalog.search('MANIS teh').map((d) => d.id);
    expect(ids, contains('tea_sweet_iced'));
    expect(
      catalog.search('frappé').map((d) => d.id),
      contains('coffee_blended_frappe'),
    );
  });

  test('names starting with the query rank first', () {
    final results = catalog.search('teh');
    expect(results.first.nameId.toLowerCase(), startsWith('teh'));
  });

  test('empty query returns everything; nonsense returns nothing', () {
    expect(catalog.search('  '), hasLength(catalog.drinks.length));
    expect(catalog.search('zzzqqq'), isEmpty);
  });

  test('alcohol is in the catalog but counts 0 (D-23)', () {
    final alcohol = catalog.drinks.where(
      (d) => d.category == DrinkCategory.alcohol,
    );
    expect(alcohol, isNotEmpty);
    for (final drink in alcohol) {
      expect(drink.isAlcoholic, isTrue, reason: drink.id);
      expect(drink.hydrationFor(330), 0, reason: drink.id);
    }
  });

  test('hydration uses BR-03', () {
    final water = catalog.drinks.firstWhere((d) => d.id == 'water_plain');
    expect(water.hydrationFor(250), 250);
    final tea = catalog.drinks.firstWhere((d) => d.id == 'tea_sweet_iced');
    expect(tea.hydrationFor(100), tea.waterPct.round());
  });

  test('display name follows the language', () {
    final tea = catalog.drinks.firstWhere((d) => d.id == 'tea_sweet_iced');
    expect(tea.nameFor('id'), 'Es teh manis');
    expect(tea.nameFor('en'), 'Iced sweet tea');
    expect(tea.nameFor('pt'), 'Iced sweet tea');
  });

  test('rejects malformed data', () {
    expect(() => DrinkCatalog.fromJsonString('{}'), throwsFormatException);
    expect(
      () => DrinkCatalog.fromJsonString('{"drinks": [{"id": 1}]}'),
      throwsFormatException,
    );
  });
}
