import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/features/safety/domain/over_drinking.dart';

OverDrinkingWarning _warn({
  int hour = 0,
  int today = 0,
  int goal = 2000,
  int? restriction,
}) => overDrinkingWarning(
  last60MinMl: hour,
  todayMl: today,
  goalMl: goal,
  restrictionMl: restriction,
);

void main() {
  test('nothing below the thresholds', () {
    expect(_warn(hour: 500, today: 1500), OverDrinkingWarning.none);
  });

  group('hourly (> 1,000 ml in 60 min)', () {
    test('exactly 1,000 ml is not a warning', () {
      expect(_warn(hour: 1000, today: 1000), OverDrinkingWarning.none);
    });

    test('above 1,000 ml warns', () {
      expect(_warn(hour: 1001, today: 1001), OverDrinkingWarning.hourly);
    });

    test('applies under a restriction too', () {
      expect(
        _warn(hour: 1050, today: 1050, restriction: 1500),
        OverDrinkingWarning.hourly,
      );
    });
  });

  group('daily without a restriction: max(goal x 1.6, 4,500 ml)', () {
    test('the 4,500 ml floor applies to smaller goals', () {
      expect(_warn(today: 4500), OverDrinkingWarning.none);
      expect(_warn(today: 4501), OverDrinkingWarning.daily);
    });

    test('goal x 1.6 applies to larger goals', () {
      // 3,000 x 1.6 = 4,800.
      expect(_warn(goal: 3000, today: 4800), OverDrinkingWarning.none);
      expect(_warn(goal: 3000, today: 4801), OverDrinkingWarning.daily);
    });
  });

  group('daily under a restriction: the restriction value (BR-01a)', () {
    test('above the limit warns, at the limit does not', () {
      expect(_warn(today: 1200, restriction: 1200), OverDrinkingWarning.none);
      expect(_warn(today: 1201, restriction: 1200), OverDrinkingWarning.daily);
    });

    test('the goal-based threshold is ignored', () {
      expect(
        _warn(goal: 1200, today: 1300, restriction: 1200),
        OverDrinkingWarning.daily,
      );
    });
  });

  test('the daily card wins when both apply', () {
    expect(_warn(hour: 1200, today: 4600), OverDrinkingWarning.daily);
    expect(
      _warn(hour: 1100, today: 1300, restriction: 1200),
      OverDrinkingWarning.daily,
    );
  });
}
