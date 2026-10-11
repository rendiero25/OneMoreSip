import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/features/streaks/domain/streak.dart';

final _today = DateTime(2026, 10, 11, 14, 30);

/// Day [daysAgo] before today with [hydration] of a 2,000 ml goal.
StreakDay _day(int daysAgo, int hydration, {int logs = 1}) => (
  date: DateTime(2026, 10, 11 - daysAgo),
  hydrationMl: hydration,
  goalMl: 2000,
  logCount: logs,
);

StreakResult _streak(
  List<StreakDay> days, {
  int freezes = 0,
  bool restricted = false,
}) => computeStreak(
  days: days,
  today: _today,
  freezesAvailable: freezes,
  fluidRestricted: restricted,
);

void main() {
  test('counts consecutive goal-met days up to yesterday', () {
    final result = _streak([_day(1, 2000), _day(2, 2100), _day(3, 2000)]);
    expect(result.length, 3);
    expect(result.frozenDays, isEmpty);
  });

  test('an unfinished today does not break the streak', () {
    expect(_streak([_day(0, 500), _day(1, 2000)]).length, 1);
  });

  test('today adds once its goal is met', () {
    expect(_streak([_day(0, 2000), _day(1, 2000)]).length, 2);
  });

  test('a missed day breaks the streak without freezes', () {
    expect(_streak([_day(1, 2000), _day(2, 1999), _day(3, 2000)]).length, 1);
  });

  test('a freeze covers a missed day but does not add to the length', () {
    final result = _streak([
      _day(1, 2000),
      _day(2, 500),
      _day(3, 2000),
    ], freezes: 1);
    expect(result.length, 2);
    expect(result.frozenDays, [DateTime.utc(2026, 10, 9)]);
  });

  test('days without a record are missed days and can be frozen', () {
    final result = _streak([_day(1, 2000), _day(4, 2000)], freezes: 2);
    expect(result.length, 2);
    expect(result.frozenDays, hasLength(2));
  });

  test('freezes are not spent on a gap they cannot fully cover', () {
    final result = _streak([_day(1, 2000), _day(5, 2000)], freezes: 2);
    expect(result.length, 1);
    expect(result.frozenDays, isEmpty);
  });

  test('freezes are not spent before the first counting day', () {
    final result = _streak([_day(1, 2000), _day(2, 0)], freezes: 3);
    expect(result.length, 1);
    expect(result.frozenDays, isEmpty);
  });

  test('empty history is a zero streak', () {
    expect(_streak([], freezes: 3).length, 0);
  });

  group('fluid restriction (F-28, D-31)', () {
    test('any logged day counts, regardless of volume', () {
      final result = _streak([_day(1, 300), _day(2, 100)], restricted: true);
      expect(result.length, 2);
    });

    test('a day with no logs still breaks the streak', () {
      final result = _streak([
        _day(1, 300),
        _day(2, 0, logs: 0),
        _day(3, 300),
      ], restricted: true);
      expect(result.length, 1);
    });
  });
}
