import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/core/db/database_providers.dart';
import 'package:onemoresip/core/db/outbox.dart';

/// Local account id of rows created before sign-up (SD-4.2).
const guestAccountId = 'guest';

/// Profiles in the local database; every write is queued for sync (SD-5).
class ProfileRepository {
  /// Creates a repository over [_db].
  new(this._db);

  final AppDatabase _db;

  /// The guest's main profile, created with [timezone] if there is none.
  Future<Profile> getOrCreateGuest({required String timezone}) =>
      _db.transaction(() async {
        final existing =
            await (_db.select(_db.profiles)
                  ..where(
                    (p) =>
                        p.accountId.equals(guestAccountId) &
                        p.kind.equals('main') &
                        p.deletedAt.isNull(),
                  )
                  ..limit(1))
                .getSingleOrNull();
        if (existing != null) return existing;

        final profile = await _db
            .into(_db.profiles)
            .insertReturning(
              ProfilesCompanion.insert(
                id: newRowId(),
                accountId: guestAccountId,
                kind: 'main',
                displayName: '',
                timezone: timezone,
                updatedAt: DateTime.now().toUtc(),
              ),
            );
        await _db.enqueue(_db.profiles, profile.id, OutboxOp.insert, profile);
        return profile;
      });

  /// The guest's main profile, or `null` while there is none.
  Stream<Profile?> watchGuest() =>
      (_db.select(_db.profiles)
            ..where(
              (p) =>
                  p.accountId.equals(guestAccountId) &
                  p.kind.equals('main') &
                  p.deletedAt.isNull(),
            )
            ..limit(1))
          .watchSingleOrNull();

  /// Saves [profile] and returns it with the new `updated_at`.
  Future<Profile> update(Profile profile) => _db.transaction(() async {
    final saved = profile.copyWith(updatedAt: DateTime.now().toUtc());
    if (!await _db.update(_db.profiles).replace(saved)) {
      throw StateError('Profile ${saved.id} does not exist');
    }
    await _db.enqueue(_db.profiles, saved.id, OutboxOp.update, saved);
    return saved;
  });
}

/// The [ProfileRepository] over the app database.
final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => ProfileRepository(ref.watch(appDatabaseProvider)),
);

/// The profile whose data the screens show: the guest's main profile, or
/// `null` until onboarding (T-030) creates it. Accounts and profile
/// switching replace this in T-070 and the family tasks.
final currentProfileProvider = StreamProvider<Profile?>(
  (ref) => ref.watch(profileRepositoryProvider).watchGuest(),
);
