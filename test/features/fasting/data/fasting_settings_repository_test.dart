import 'dart:convert';

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/features/fasting/data/fasting_settings_repository.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  const profileId = '0192f0c0-0000-7000-8000-000000000001';

  late AppDatabase db;
  late FastingSettingsRepository repo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repo = FastingSettingsRepository(db);
  });
  tearDown(() => db.close());

  test('upsert round-trips and queues insert, then update', () async {
    expect(await repo.get(profileId), isNull);

    final inserted = await repo.upsert(
      const FastingSettingsCompanion(
        profileId: Value(profileId),
        enabled: Value(true),
        type: Value('ramadan'),
      ),
    );
    expect(inserted.splitPattern, '2-4-2'); // column default
    expect(await repo.get(profileId), inserted);

    final updated = await repo.upsert(
      const FastingSettingsCompanion(
        profileId: Value(profileId),
        enabled: Value(false),
      ),
    );
    expect(updated.enabled, isFalse);
    expect(updated.type, 'ramadan');
    expect(await repo.get(profileId), updated);

    final entries = await db.select(db.outbox).get();
    expect(entries.map((e) => e.op), ['insert', 'update']);
    expect(entries.map((e) => e.targetTable).toSet(), {'fasting_settings'});
    expect(jsonDecode(entries.last.payload), containsPair('enabled', false));
  });
}
