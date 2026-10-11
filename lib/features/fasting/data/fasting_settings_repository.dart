import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/core/db/database_providers.dart';
import 'package:onemoresip/core/db/outbox.dart';

/// Fasting settings per profile; every write is queued for sync (SD-5).
class FastingSettingsRepository {
  /// Creates a repository over [_db].
  new(this._db);

  final AppDatabase _db;

  /// The settings of [profileId], or null if never saved.
  Future<FastingSetting?> get(String profileId) => (_db.select(
    _db.fastingSettings,
  )..where((s) => s.profileId.equals(profileId))).getSingleOrNull();

  /// Inserts or updates the columns present in [settings] (which must
  /// include `profileId`) and returns the stored row.
  Future<FastingSetting> upsert(FastingSettingsCompanion settings) =>
      _db.transaction(() async {
        final profileId = settings.profileId.value;
        final op = await get(profileId) == null
            ? OutboxOp.insert
            : OutboxOp.update;
        await _db
            .into(_db.fastingSettings)
            .insertOnConflictUpdate(
              settings.copyWith(updatedAt: Value(DateTime.now().toUtc())),
            );
        final saved = (await get(profileId))!;
        await _db.enqueue(_db.fastingSettings, profileId, op, saved);
        return saved;
      });
}

/// The [FastingSettingsRepository] over the app database.
final fastingSettingsRepositoryProvider = Provider<FastingSettingsRepository>(
  (ref) => FastingSettingsRepository(ref.watch(appDatabaseProvider)),
);
