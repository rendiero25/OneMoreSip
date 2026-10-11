import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/features/logging/domain/hydration.dart';

void main() {
  test('water counts in full', () {
    expect(hydrationMl(volumeMl: 250, waterPct: 100, isAlcoholic: false), 250);
  });

  test('other drinks count by water fraction, rounded', () {
    expect(hydrationMl(volumeMl: 330, waterPct: 90, isAlcoholic: false), 297);
    expect(hydrationMl(volumeMl: 200, waterPct: 88.5, isAlcoholic: false), 177);
  });

  test('factor never exceeds 1.0 (D-23)', () {
    expect(hydrationMl(volumeMl: 250, waterPct: 120, isAlcoholic: false), 250);
  });

  test('alcohol counts 0', () {
    expect(hydrationMl(volumeMl: 330, waterPct: 93, isAlcoholic: true), 0);
  });
}
