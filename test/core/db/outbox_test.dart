import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/db/outbox.dart';

void main() {
  test('row ids are unique UUIDv7', () {
    final ids = List.generate(1000, (_) => newRowId());

    expect(ids.toSet(), hasLength(1000));
    final v7 = RegExp(
      r'^[0-9a-f]{8}-[0-9a-f]{4}-7[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
    );
    expect(ids.every(v7.hasMatch), isTrue);
  });

  test('row ids sort by creation time', () async {
    final ids = <String>[];
    for (var i = 0; i < 5; i++) {
      ids.add(newRowId());
      await Future<void>.delayed(const Duration(milliseconds: 2));
    }

    expect([...ids]..sort(), ids);
  });
}
