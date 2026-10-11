import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/db/app_database.dart';

import 'generated/schema.dart';

// Once schemaVersion is bumped, `dart run drift_dev make-migrations`
// generates migration_test.dart next to this file for every upgrade path.
void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  final verifier = SchemaVerifier(GeneratedHelper());

  test('schema matches the exported v1 in drift_schemas/', () async {
    final schema = await verifier.schemaAt(1);
    final db = AppDatabase(schema.newConnection());
    addTearDown(db.close);
    await verifier.migrateAndValidate(db, 1);
  });
}
