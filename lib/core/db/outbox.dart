import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:uuid/uuid.dart';

/// A new UUIDv7 row id: generated on the device and time-ordered, so sync
/// retries are idempotent (SD-5).
String newRowId() => const Uuid().v7();

/// Kind of a pending sync write (SD-5).
enum OutboxOp {
  /// A new row.
  insert,

  /// A changed row.
  update,

  /// A soft-deleted row (`deleted_at` set).
  delete,
}

// Column names as keys and ISO-8601 times; rows store UTC times.
const _serializer = ValueSerializer.defaults(
  serializeDateTimeValuesAsString: true,
);

/// Outbox writes for repositories.
extension OutboxWrites on AppDatabase {
  /// Queues [row] of [table] for sync. Call it inside the transaction that
  /// wrote the row, so both are stored or neither is (SD-5).
  Future<void> enqueue(
    TableInfo<Table, DataClass> table,
    String rowId,
    OutboxOp op,
    DataClass row,
  ) => into(outbox).insert(
    OutboxCompanion.insert(
      targetTable: table.actualTableName,
      rowId: rowId,
      op: op.name,
      payload: jsonEncode(row.toJson(serializer: _serializer)),
      createdAt: DateTime.now().toUtc(),
    ),
  );
}
