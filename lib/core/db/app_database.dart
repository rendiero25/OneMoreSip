import 'package:drift/drift.dart';

part 'app_database.g.dart';

/// The encrypted on-device database (SD-4.2). Tables live in `tables.drift`.
@DriftDatabase(include: {'tables.drift'})
class AppDatabase extends _$AppDatabase {
  /// Opens the database on [e], e.g. `appDatabaseProvider`'s connection.
  new(super.e);

  @override
  int get schemaVersion => 1;
}
