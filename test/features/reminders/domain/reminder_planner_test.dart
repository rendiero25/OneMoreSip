import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/features/reminders/domain/reminder_planner.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart';

int _min(int hour, [int minute = 0]) => hour * 60 + minute;

String _two(int n) => n.toString().padLeft(2, '0');

const _interval = ReminderSettings(
  mode: ReminderMode.interval,
  wakeMin: 7 * 60,
  sleepMin: 22 * 60,
);

void main() {
  tzdata.initializeTimeZones();
  final jakarta = getLocation('Asia/Jakarta');
  final london = getLocation('Europe/London');
  final newYork = getLocation('America/New_York');

  TZDateTime jkt(int day, int hour, [int minute = 0]) =>
      TZDateTime(jakarta, 2026, 10, day, hour, minute);

  List<PlannedReminder> plan({
    ReminderSettings settings = _interval,
    Location? location,
    TZDateTime? now,
    DayIntake today = const DayIntake(goalMl: 2000, loggedMl: 0),
    List<BlockedWindow> blocked = const [],
  }) => planReminders(
    settings: settings,
    location: location ?? jakarta,
    now: now ?? jkt(12, 7),
    today: today,
    blocked: blocked,
  );

  List<String> hhmm(Iterable<PlannedReminder> r) => [
    for (final p in r) '${p.at.day}@${_two(p.at.hour)}:${_two(p.at.minute)}',
  ];

  test('interval mode: every 90 min from wake, before sleep', () {
    final today = plan().where((p) => p.at.day == 12);
    expect(hhmm(today), [
      '12@08:30',
      '12@10:00',
      '12@11:30',
      '12@13:00',
      '12@14:30',
      '12@16:00',
      '12@17:30',
      '12@19:00',
      '12@20:30',
    ]);
  });

  test('plans a rolling 36 h window into tomorrow', () {
    final result = plan();
    expect(result.last.at, jkt(13, 19));
    expect(result.every((p) => !p.at.isAfter(jkt(13, 19))), isTrue);
  });

  test('suggests BR-02 catch-up amounts for today', () {
    // 2,000 ml over 9 reminders = 222 → 200 ml.
    final today = plan().where((p) => p.at.day == 12);
    expect(today.map((p) => p.suggestedMl).toSet(), {200});
  });

  test('skips past times and times within 30 min of the last log', () {
    final result = plan(
      now: jkt(12, 10, 15),
      today: DayIntake(goalMl: 2000, loggedMl: 500, lastLogAt: jkt(12, 11, 10)),
    ).where((p) => p.at.day == 12);
    expect(hhmm(result).first, '12@13:00');
  });

  test('skips quiet hours, also across midnight', () {
    final daytime = plan(
      settings: const ReminderSettings(
        mode: ReminderMode.interval,
        wakeMin: 7 * 60,
        sleepMin: 22 * 60,
        quietStartMin: 12 * 60,
        quietEndMin: 14 * 60,
      ),
    );
    expect(hhmm(daytime), isNot(contains('12@13:00')));
    expect(hhmm(daytime), contains('12@14:30'));

    final night = plan(
      settings: const ReminderSettings(
        mode: ReminderMode.interval,
        wakeMin: 9 * 60,
        sleepMin: 60, // 01:00 next day
        intervalMin: 120,
        quietStartMin: 22 * 60,
        quietEndMin: 6 * 60,
      ),
    ).where((p) => p.at.day == 12);
    expect(hhmm(night).last, '12@21:00');
  });

  test('skips blocked windows such as fasting hours', () {
    final result = plan(blocked: [(start: jkt(12, 9), end: jkt(12, 17))]);
    expect(hhmm(result.where((p) => p.at.day == 12)), [
      '12@08:30',
      '12@17:30',
      '12@19:00',
      '12@20:30',
    ]);
  });

  test('no more reminders today once the goal is reached', () {
    final result = plan(today: const DayIntake(goalMl: 2000, loggedMl: 2000));
    expect(result.where((p) => p.at.day == 12), isEmpty);
    expect(result.where((p) => p.at.day == 13), isNotEmpty);
  });

  test('inactive weekdays get no reminders', () {
    // 2026-10-13 is a Tuesday.
    final result = plan(
      settings: const ReminderSettings(
        mode: ReminderMode.interval,
        wakeMin: 7 * 60,
        sleepMin: 22 * 60,
        weekdays: {DateTime.monday},
      ),
    );
    expect(result.where((p) => p.at.day == 13), isEmpty);
  });

  test('caps a day at maxPerDay, spread evenly to the last slot', () {
    final result = plan(
      settings: const ReminderSettings(
        mode: ReminderMode.interval,
        wakeMin: 7 * 60,
        sleepMin: 22 * 60,
        intervalMin: 30,
        maxPerDay: 8,
      ),
    ).where((p) => p.at.day == 12).toList();
    expect(result, hasLength(8));
    expect(hhmm([result.first]), ['12@07:30']);
    expect(hhmm([result.last]), ['12@21:30']);
  });

  test('fixed mode uses the chosen times', () {
    final result = plan(
      settings: ReminderSettings(
        mode: ReminderMode.fixed,
        wakeMin: 7 * 60,
        sleepMin: 22 * 60,
        fixedTimesMin: [_min(15), _min(9), _min(12, 30)],
      ),
    ).where((p) => p.at.day == 12);
    expect(hhmm(result), ['12@09:00', '12@12:30', '12@15:00']);
  });

  test('no suggested amounts under a fluid restriction (BR-01a, F-28)', () {
    final result = plan(
      today: const DayIntake(goalMl: 1500, loggedMl: 0, fluidRestricted: true),
    );
    expect(result, isNotEmpty);
    expect(result.every((p) => p.suggestedMl == null), isTrue);
  });

  group('DST', () {
    const at0130 = ReminderSettings(
      mode: ReminderMode.fixed,
      wakeMin: 0,
      sleepMin: 23 * 60,
      fixedTimesMin: [90, 10 * 60],
    );

    test('a time skipped by spring-forward moves just after the jump', () {
      // London, 2026-03-29: 01:00 GMT → 02:00 BST, so 01:30 does not exist.
      final result = plan(
        settings: at0130,
        location: london,
        now: TZDateTime(london, 2026, 3, 29),
      ).where((p) => p.at.day == 29).toList();
      expect(result.first.at.hour, 2);
      expect(result.first.at.minute, 30);
      expect(result.first.at.toUtc().hour, 1);
    });

    test('a time repeated by fall-back is used once', () {
      // London, 2026-10-25: 02:00 BST → 01:00 GMT, so 01:30 happens twice.
      final result = plan(
        settings: at0130,
        location: london,
        now: TZDateTime(london, 2026, 10, 25),
      ).where((p) => p.at.day == 25 && p.at.hour == 1);
      expect(result, hasLength(1));
    });

    test('wall-clock times stay put across the change', () {
      // New York, 2026-03-08: clocks jump forward at 02:00.
      final result = plan(
        location: newYork,
        now: TZDateTime(newYork, 2026, 3, 7, 7),
      );
      final byDay = {
        for (final day in [7, 8])
          day: result.where((p) => p.at.day == day).map((p) => p.at.hour),
      };
      expect(byDay[7]!.first, 8);
      expect(byDay[8]!.first, 8);
      expect(result.where((p) => p.at.day == 8).first.at.minute, 30);
    });
  });
}
