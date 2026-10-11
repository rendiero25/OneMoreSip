import 'dart:convert';

import 'package:onemoresip/features/drinks/domain/drink.dart';

/// The bundled drink database with search (F-03, T-021).
class DrinkCatalog {
  /// Creates a catalog of [drinks].
  new(this.drinks);

  /// Parses `data/drinks.json` (`{"meta": …, "drinks": […]}`).
  factory fromJsonString(String source) {
    if (jsonDecode(source) case {'drinks': final List<Object?> entries}) {
      return DrinkCatalog([
        for (final entry in entries)
          if (entry is Map<String, Object?>)
            Drink.fromJson(entry)
          else
            throw const FormatException('Invalid drink entry'),
      ]);
    }
    throw const FormatException('Missing "drinks" list');
  }

  /// All drinks, in database order.
  final List<Drink> drinks;

  /// Drinks whose English, Indonesian or local name contains every word of
  /// [query] (case- and accent-insensitive). Names starting with the query
  /// come first; otherwise database order is kept. Empty query → all.
  List<Drink> search(String query) {
    final words = _normalize(query).split(' ').where((w) => w.isNotEmpty);
    if (words.isEmpty) return drinks;

    final starts = <Drink>[];
    final contains = <Drink>[];
    final phrase = words.join(' ');
    for (final drink in drinks) {
      final names = [
        drink.nameEn,
        drink.nameId,
        drink.localName,
      ].map(_normalize).toList();
      if (!words.every((w) => names.any((n) => n.contains(w)))) continue;
      (names.any((n) => n.startsWith(phrase)) ? starts : contains).add(drink);
    }
    return [...starts, ...contains];
  }

  static String _normalize(String text) {
    final lower = text.toLowerCase();
    final buffer = StringBuffer();
    for (final rune in lower.runes) {
      final char = String.fromCharCode(rune);
      buffer.write(_accents[char] ?? char);
    }
    return buffer
        .toString()
        .replaceAll(RegExp(r'[^\p{L}\p{N}]+', unicode: true), ' ')
        .trim();
  }

  static const _accents = {
    'à': 'a', 'á': 'a', 'â': 'a', 'ã': 'a', 'ä': 'a', 'å': 'a', //
    'ç': 'c', 'è': 'e', 'é': 'e', 'ê': 'e', 'ë': 'e', //
    'ì': 'i', 'í': 'i', 'î': 'i', 'ï': 'i', 'ñ': 'n', //
    'ò': 'o', 'ó': 'o', 'ô': 'o', 'õ': 'o', 'ö': 'o', //
    'ù': 'u', 'ú': 'u', 'û': 'u', 'ü': 'u', 'ş': 's', 'ğ': 'g', 'ı': 'i',
  };
}
