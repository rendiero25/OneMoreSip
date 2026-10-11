import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/core/db/database_providers.dart';
import 'package:onemoresip/core/db/outbox.dart';

/// Reminder settings per profile; every write is queued for sync (SD-5).
class ReminderSettingsRepository {
  /// Creates a repository over [_db].
  new(this._db);

  final AppDatabase _db;

  /// The settings of [profileId], or null if never saved.
  Future<ReminderSetting?> get(String profileId) => (_db.select(
    _db.reminderSettings,
  )..where((s) => s.profileId.equals(profileId))).getSingleOrNull();

  /// Inserts or updates the columns present in [settings] (which must
  /// include `profileId`) and returns the stored row.
  Future<ReminderSetting> upsert(ReminderSettingsCompanion settings) =>
      _db.transaction(() async {
        final profileId = settings.profileId.value;
        final op = await get(profileId) == null
            ? OutboxOp.insert
            : OutboxOp.update;
        await _db
            .into(_db.reminderSettings)
            .insertOnConflictUpdate(
              settings.copyWith(updatedAt: Value(DateTime.now().toUtc())),
            );
        final saved = (await get(profileId))!;
        await _db.enqueue(_db.reminderSettings, profileId, op, saved);
        return saved;
      });
}

/// The [ReminderSettingsRepository] over the app database.
final reminderSettingsRepositoryProvider = Provider<ReminderSettingsRepository>(
  (ref) => ReminderSettingsRepository(ref.watch(appDatabaseProvider)),
);
