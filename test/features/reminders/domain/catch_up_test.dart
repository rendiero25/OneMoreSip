import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/features/reminders/domain/catch_up.dart';

final _wake = DateTime(2026, 10, 11, 7);
final _sleep = DateTime(2026, 10, 11, 23);

DateTime _at(int hour, [int minute = 0]) =>
    DateTime(2026, 10, 11, hour, minute);

int? _catchUp({
  int goal = 2000,
  int logged = 0,
  int reminders = 4,
  int last60 = 0,
  bool restricted = false,
}) => catchUpPerReminderMl(
  goalMl: goal,
  loggedMl: logged,
  remindersLeft: reminders,
  loggedLast60MinMl: last60,
  fluidRestricted: restricted,
);

void main() {
  group('paceMl', () {
    test('is 0 before waking and the goal after sleep', () {
      expect(paceMl(goalMl: 2000, wake: _wake, sleep: _sleep, now: _at(6)), 0);
      expect(
        paceMl(goalMl: 2000, wake: _wake, sleep: _sleep, now: _at(23, 30)),
        2000,
      );
    });

    test('is linear over the waking window', () {
      expect(
        paceMl(goalMl: 2000, wake: _wake, sleep: _sleep, now: _at(15)),
        1000,
      );
    });
  });

  group('catchUpPerReminderMl', () {
    test('splits the remainder evenly, rounded down to 50 ml', () {
      expect(_catchUp(logged: 800), 300);
      expect(_catchUp(logged: 830), 250);
    });

    test('suggests at least 50 ml while something remains', () {
      expect(_catchUp(logged: 1980, reminders: 3), 50);
    });

    test('caps at 500 ml per reminder', () {
      expect(_catchUp(reminders: 2), 500);
    });

    test('keeps the last 60 minutes under 1,000 ml (BR-06)', () {
      expect(_catchUp(reminders: 2, last60: 700), 300);
      expect(_catchUp(reminders: 2, last60: 980), isNull);
    });

    test('nothing when the goal is reached or no reminders are left', () {
      expect(_catchUp(logged: 2000), isNull);
      expect(_catchUp(logged: 2500), isNull);
      expect(_catchUp(reminders: 0), isNull);
    });

    test('never under a fluid restriction (BR-01a, F-28)', () {
      for (var logged = 0; logged <= 2000; logged += 50) {
        expect(_catchUp(logged: logged, restricted: true), isNull);
      }
    });
  });

  group('shouldShowBehindMessage', () {
    bool behind(int logged, DateTime now, {bool restricted = false}) =>
        shouldShowBehindMessage(
          goalMl: 2000,
          loggedMl: logged,
          wake: _wake,
          sleep: _sleep,
          now: now,
          fluidRestricted: restricted,
        );

    test('only from 3/4 of the waking window', () {
      // 3/4 of 07:00–23:00 is 19:00.
      expect(behind(0, _at(18, 59)), isFalse);
      expect(behind(0, _at(19)), isTrue);
    });

    test('only when more than 40 points behind pace', () {
      // At 19:00 pace is 75%: 700 ml (35%) is exactly 40 points behind.
      expect(behind(700, _at(19)), isFalse);
      expect(behind(690, _at(19)), isTrue);
    });

    test('never under a fluid restriction (BR-01a, F-28)', () {
      for (var hour = 7; hour <= 23; hour++) {
        expect(behind(0, _at(hour), restricted: true), isFalse);
      }
    });
  });
}
