import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/sippy/sippy_state.dart';
import 'package:onemoresip/features/reminders/domain/catch_up.dart';
import 'package:onemoresip/features/safety/domain/safety_policy.dart';

void main() {
  const free = SafetyPolicy();
  const restricted = SafetyPolicy(restrictionMl: 1200);

  group('SafetyPolicy', () {
    test('without a restriction everything is allowed', () {
      expect(free.isRestricted, isFalse);
      expect(free.allowAdjustments, isTrue);
      expect(free.allowCatchUp, isTrue);
      expect(free.allowDrinkMoreCopy, isTrue);
      expect(free.effectiveGoal(2300), 2300);
    });

    test('a restriction disables adjustments, catch-up and drink-more '
        'copy', () {
      expect(restricted.isRestricted, isTrue);
      expect(restricted.allowAdjustments, isFalse);
      expect(restricted.allowCatchUp, isFalse);
      expect(restricted.allowDrinkMoreCopy, isFalse);
    });

    test('the goal equals the restriction, whatever was computed', () {
      expect(restricted.effectiveGoal(2300), 1200);
      expect(restricted.effectiveGoal(800), 1200);
    });

    test('drink-more copy is hidden under a restriction', () {
      expect(free.drinkMoreCopy(() => 'nudge'), 'nudge');
      expect(
        restricted.drinkMoreCopy(() => fail('copy must not be built')),
        isNull,
      );
    });

    test('catch-up nudges and a thirsty Sippy are off under a restriction', () {
      final wake = DateTime(2026, 10, 11, 7);
      final sleep = DateTime(2026, 10, 11, 23);
      expect(
        catchUpPerReminderMl(
          goalMl: restricted.effectiveGoal(2300),
          loggedMl: 0,
          remindersLeft: 4,
          loggedLast60MinMl: 0,
          fluidRestricted: restricted.isRestricted,
        ),
        isNull,
      );
      expect(
        shouldShowBehindMessage(
          goalMl: restricted.effectiveGoal(2300),
          loggedMl: 0,
          wake: wake,
          sleep: sleep,
          now: DateTime(2026, 10, 11, 21),
          fluidRestricted: restricted.isRestricted,
        ),
        isFalse,
      );
      expect(
        sippyStateFor(
          level: 0,
          pace: 80,
          fluidRestricted: restricted.isRestricted,
        ),
        SippyState.fresh,
      );
    });
  });

  group('validateRestrictionMl', () {
    test('boundaries and step (D-34)', () {
      expect(validateRestrictionMl(450), RestrictionValidation.belowMin);
      expect(validateRestrictionMl(500), RestrictionValidation.valid);
      expect(validateRestrictionMl(525), RestrictionValidation.offStep);
      expect(validateRestrictionMl(1500), RestrictionValidation.valid);
      expect(validateRestrictionMl(3000), RestrictionValidation.valid);
      expect(validateRestrictionMl(3050), RestrictionValidation.aboveMax);
    });
  });

  group('stepRestrictionMl', () {
    test('an empty field starts at 1,500 ml', () {
      expect(stepRestrictionMl(null, up: true), 1500);
      expect(stepRestrictionMl(null, up: false), 1500);
    });

    test('moves 50 ml and stays in range', () {
      expect(stepRestrictionMl(1500, up: true), 1550);
      expect(stepRestrictionMl(1500, up: false), 1450);
      expect(stepRestrictionMl(3000, up: true), 3000);
      expect(stepRestrictionMl(500, up: false), 500);
    });

    test('snaps off-step and out-of-range values onto the grid', () {
      expect(stepRestrictionMl(1525, up: true), 1550);
      expect(stepRestrictionMl(1525, up: false), 1500);
      expect(stepRestrictionMl(200, up: true), 500);
      expect(stepRestrictionMl(9000, up: false), 3000);
    });
  });
}
