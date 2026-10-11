import 'dart:convert';

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/features/reminders/data/reminder_settings_repository.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  const profileId = '0192f0c0-0000-7000-8000-000000000001';

  late AppDatabase db;
  late ReminderSettingsRepository repo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repo = ReminderSettingsRepository(db);
  });
  tearDown(() => db.close());

  test('get is null before the first save', () async {
    expect(await repo.get(profileId), isNull);
  });

  test('upsert round-trips and queues insert, then update', () async {
    final inserted = await repo.upsert(
      const ReminderSettingsCompanion(
        profileId: Value(profileId),
        mode: Value('interval'),
        intervalMin: Value(60),
        fixedTimes: Value('["08:00","12:00"]'),
      ),
    );
    expect(inserted.skipIfLoggedMin, 30); // column default
    expect(await repo.get(profileId), inserted);

    final updated = await repo.upsert(
      const ReminderSettingsCompanion(
        profileId: Value(profileId),
        intervalMin: Value(90),
      ),
    );
    expect(updated.mode, 'interval');
    expect(updated.intervalMin, 90);
    expect(updated.fixedTimes, '["08:00","12:00"]');
    expect(updated.updatedAt, isNotNull);
    expect(await repo.get(profileId), updated);

    final entries = await db.select(db.outbox).get();
    expect(entries.map((e) => e.op), ['insert', 'update']);
    expect(entries.map((e) => e.targetTable).toSet(), {'reminder_settings'});
    expect(entries.map((e) => e.rowId).toSet(), {profileId});
    expect(jsonDecode(entries.last.payload), containsPair('interval_min', 90));
  });

  test('a failing outbox write rolls back the settings too', () async {
    await db.customStatement(
      'CREATE TRIGGER fail_outbox BEFORE INSERT ON outbox '
      "BEGIN SELECT RAISE(ABORT, 'boom'); END",
    );

    await expectLater(
      repo.upsert(const ReminderSettingsCompanion(profileId: Value(profileId))),
      throwsA(isA<SqliteException>()),
    );
    expect(await repo.get(profileId), isNull);
  });
}
