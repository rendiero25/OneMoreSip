import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/core/db/database_providers.dart';
import 'package:onemoresip/core/db/outbox.dart';
import 'package:onemoresip/features/drinks/domain/drink.dart';

/// Drink logs in the local database; every write is queued for sync (SD-5).
///
/// Times are stored in UTC; days are local calendar days of the device.
class DrinkLogRepository {
  /// Creates a repository over [_db].
  new(this._db);

  final AppDatabase _db;

  /// Logs [volumeMl] of [drink] for [profileId]. `source` is one of the
  /// `drink_logs.source` values in SD-4.1, e.g. `app` or `widget`.
  Future<DrinkLog> add({
    required String profileId,
    required Drink drink,
    required int volumeMl,
    required String source,
    required DateTime loggedAt,
  }) {
    _checkVolume(volumeMl);
    return _db.transaction(() async {
      final log = await _db
          .into(_db.drinkLogs)
          .insertReturning(
            DrinkLogsCompanion.insert(
              id: newRowId(),
              profileId: profileId,
              drinkId: drink.id,
              volumeMl: volumeMl,
              hydrationMl: drink.hydrationFor(volumeMl),
              caffeineMg: Value(_amount(drink.caffeineMgPer100Ml, volumeMl)),
              sugarG: Value(_amount(drink.sugarGPer100Ml, volumeMl)),
              source: source,
              loggedAt: loggedAt.toUtc(),
              updatedAt: DateTime.now().toUtc(),
            ),
          );
      await _db.enqueue(_db.drinkLogs, log.id, OutboxOp.insert, log);
      return log;
    });
  }

  /// Changes the log [id] to [volumeMl] of [drink] at [loggedAt].
  Future<DrinkLog> edit(
    String id, {
    required Drink drink,
    required int volumeMl,
    required DateTime loggedAt,
  }) {
    _checkVolume(volumeMl);
    return _db.transaction(() async {
      final log = (await _get(id)).copyWith(
        drinkId: drink.id,
        volumeMl: volumeMl,
        hydrationMl: drink.hydrationFor(volumeMl),
        caffeineMg: Value(_amount(drink.caffeineMgPer100Ml, volumeMl)),
        sugarG: Value(_amount(drink.sugarGPer100Ml, volumeMl)),
        loggedAt: loggedAt.toUtc(),
        updatedAt: DateTime.now().toUtc(),
      );
      await _db.update(_db.drinkLogs).replace(log);
      await _db.enqueue(_db.drinkLogs, id, OutboxOp.update, log);
      return log;
    });
  }

  /// Soft-deletes the log [id] (SD-5).
  Future<void> delete(String id) => _db.transaction(() async {
    final now = DateTime.now().toUtc();
    final log = (await _get(id))
        .copyWith(updatedAt: now, deletedAt: Value(now));
    await _db.update(_db.drinkLogs).replace(log);
    await _db.enqueue(_db.drinkLogs, id, OutboxOp.delete, log);
  });

  /// Non-deleted logs of [profileId] on the local calendar day of [day],
  /// oldest first.
  Stream<List<DrinkLog>> watchDay(String profileId, DateTime day) =>
      (_db.select(_db.drinkLogs)
            ..where((_) => _onDay(profileId, day))
            ..orderBy([(l) => OrderingTerm.asc(l.loggedAt)]))
          .watch();

  /// Millilitres counted toward the goal (BR-03) on the day of [day].
  Future<int> hydrationMlOn(String profileId, DateTime day) async {
    final total = _db.drinkLogs.hydrationMl.sum();
    final query = _db.selectOnly(_db.drinkLogs)
      ..addColumns([total])
      ..where(_onDay(profileId, day));
    return (await query.getSingle()).read<int>(total) ?? 0;
  }

  Expression<bool> _onDay(String profileId, DateTime day) {
    final start = DateTime(day.year, day.month, day.day);
    final end = DateTime(day.year, day.month, day.day + 1);
    final logs = _db.drinkLogs;
    return logs.profileId.equals(profileId) &
        logs.deletedAt.isNull() &
        logs.loggedAt.isBiggerOrEqualValue(start.toUtc()) &
        logs.loggedAt.isSmallerThanValue(end.toUtc());
  }

  Future<DrinkLog> _get(String id) async {
    final log = await (_db.select(
      _db.drinkLogs,
    )..where((l) => l.id.equals(id) & l.deletedAt.isNull())).getSingleOrNull();
    return log ?? (throw StateError('Drink log $id does not exist'));
  }

  // Matches the server check on `drink_logs.volume_ml` (SD-4.1).
  static void _checkVolume(int volumeMl) =>
      RangeError.checkValueInInterval(volumeMl, 1, 3000, 'volumeMl');

  // Per-100-ml value for volumeMl, at the server's 1 decimal (SD-4.1).
  static double _amount(double per100Ml, int volumeMl) =>
      (per100Ml * volumeMl / 10).round() / 10;
}

/// The [DrinkLogRepository] over the app database.
final drinkLogRepositoryProvider = Provider<DrinkLogRepository>(
  (ref) => DrinkLogRepository(ref.watch(appDatabaseProvider)),
);
