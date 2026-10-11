import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/sippy/sippy_state.dart';

void main() {
  test('on pace or slightly behind is fresh', () {
    expect(sippyStateFor(level: 50, pace: 50), SippyState.fresh);
    expect(sippyStateFor(level: 41, pace: 50), SippyState.fresh);
  });

  test('behind 10 to 30 points is thirsty', () {
    expect(sippyStateFor(level: 40, pace: 50), SippyState.thirsty);
    expect(sippyStateFor(level: 20, pace: 50), SippyState.thirsty);
  });

  test('behind more than 30 points is tired', () {
    expect(sippyStateFor(level: 19, pace: 50), SippyState.tired);
  });

  test('just logged is happy, even when behind', () {
    expect(
      sippyStateFor(level: 10, pace: 60, justLogged: true),
      SippyState.happy,
    );
  });

  test('goal reached is celebrating', () {
    expect(
      sippyStateFor(level: 100, pace: 80, justLogged: true),
      SippyState.celebrating,
    );
  });

  test('night is sleeping, fasting is waiting and wins over night', () {
    expect(
      sippyStateFor(level: 10, pace: 90, isNight: true),
      SippyState.sleeping,
    );
    expect(
      sippyStateFor(level: 10, pace: 90, isNight: true, isFasting: true),
      SippyState.waiting,
    );
  });

  test('fluid restriction never shows thirsty or tired (F-28, D-27)', () {
    for (var level = 0; level <= 99; level++) {
      final state = sippyStateFor(
        level: level,
        pace: 100,
        fluidRestricted: true,
      );
      expect(state, isNot(anyOf(SippyState.thirsty, SippyState.tired)));
    }
  });
}
