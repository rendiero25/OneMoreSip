import 'dart:convert';

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/features/profile/data/profile_repository.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  late AppDatabase db;
  late ProfileRepository repo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repo = ProfileRepository(db);
  });
  tearDown(() => db.close());

  Future<List<OutboxEntry>> outbox() => db.select(db.outbox).get();

  test('creates the guest profile once with one outbox insert', () async {
    final created = await repo.getOrCreateGuest(timezone: 'Asia/Jakarta');
    final again = await repo.getOrCreateGuest(timezone: 'Europe/Berlin');

    expect(again, created);
    expect(created.accountId, guestAccountId);
    expect(created.kind, 'main');
    expect(created.timezone, 'Asia/Jakarta');
    final entry = (await outbox()).single;
    expect(entry.targetTable, 'profiles');
    expect(entry.rowId, created.id);
    expect(entry.op, 'insert');
    expect(jsonDecode(entry.payload), containsPair('account_id', 'guest'));
  });

  test('update saves the change and queues one update', () async {
    final guest = await repo.getOrCreateGuest(timezone: 'Asia/Jakarta');

    final saved = await repo.update(
      guest.copyWith(displayName: 'Rina', weightKg: const Value(55.5)),
    );

    final stored = await db.select(db.profiles).getSingle();
    expect(stored, saved);
    expect(stored.displayName, 'Rina');
    expect(stored.weightKg, 55.5);
    final entries = await outbox();
    expect(entries.map((e) => e.op), ['insert', 'update']);
    final payload = jsonDecode(entries.last.payload) as Map<String, Object?>;
    expect(payload['display_name'], 'Rina');
    expect(payload['updated_at'], saved.updatedAt.toIso8601String());
  });

  test('updating a missing profile writes nothing', () async {
    final guest = await repo.getOrCreateGuest(timezone: 'Asia/Jakarta');

    await expectLater(
      repo.update(guest.copyWith(id: 'missing')),
      throwsStateError,
    );
    expect((await outbox()).length, 1);
  });

  test('watchGuest emits null, then the guest and its updates', () async {
    final seen = <Profile?>[];
    final sub = repo.watchGuest().listen(seen.add);
    await pumpEventQueue();
    final guest = await repo.getOrCreateGuest(timezone: 'Asia/Jakarta');
    await pumpEventQueue();
    await repo.update(guest.copyWith(goalOverrideMl: const Value(2500)));
    await pumpEventQueue();
    await sub.cancel();

    expect(seen, hasLength(3));
    expect(seen.first, isNull);
    expect(seen[1]?.id, guest.id);
    expect(seen.last?.goalOverrideMl, 2500);
  });
}
