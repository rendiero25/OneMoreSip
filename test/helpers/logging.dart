import 'dart:io';

import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/core/db/database_providers.dart';
import 'package:onemoresip/features/drinks/data/drink_catalog_provider.dart';
import 'package:onemoresip/features/drinks/domain/drink_catalog.dart';

/// The bundled drink catalog, read synchronously: `rootBundle` decodes
/// large assets on another isolate, which never finishes under the fake
/// clock of widget tests.
final testCatalog = DrinkCatalog.fromJsonString(
  File(drinksAsset).readAsStringSync(),
);

/// An in-memory database closed when the test ends.
AppDatabase memoryDatabase() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  final db = AppDatabase(NativeDatabase.memory());
  addTearDown(db.close);
  return db;
}

/// Overrides for screens that log drinks: [db] and [testCatalog].
List<Override> loggingOverrides(AppDatabase db) => [
  appDatabaseProvider.overrideWithValue(db),
  drinkCatalogProvider.overrideWith((ref) => testCatalog),
];
