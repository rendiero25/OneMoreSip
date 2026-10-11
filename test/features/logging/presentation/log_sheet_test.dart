import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/app/app.dart';
import 'package:onemoresip/app/widgets/fab_log.dart';
import 'package:onemoresip/core/analytics/telemetry.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/features/drinks/domain/drink.dart';
import 'package:onemoresip/features/drinks/presentation/drink_picker_screen.dart';
import 'package:onemoresip/features/logging/data/drink_log_repository.dart';
import 'package:onemoresip/features/logging/presentation/log_sheet.dart';
import 'package:onemoresip/features/profile/data/profile_repository.dart';

import '../../../helpers/flags.dart';
import '../../../helpers/logging.dart';

class _FakeSink implements AnalyticsSink {
  final captured = <(String, Map<String, Object>)>[];

  @override
  Future<void> setEnabled({required bool enabled}) async {}

  @override
  Future<void> capture(String name, Map<String, Object> properties) async =>
      captured.add((name, properties));
}

Drink _drink(String id) => testCatalog.drinks.firstWhere((d) => d.id == id);

void main() {
  late AppDatabase db;
  late _FakeSink sink;

  setUp(() {
    db = memoryDatabase();
    sink = _FakeSink();
  });

  Future<List<DrinkLog>> logs() => db.select(db.drinkLogs).get();

  Future<int> todayMl() async {
    final profile = await ProfileRepository(db)
        .getOrCreateGuest(timezone: 'UTC');
    return await DrinkLogRepository(db)
        .hydrationMlOn(profile.id, DateTime.now());
  }

  /// Pumps the app on a 390 x 844 phone and opens the log sheet.
  Future<void> openSheet(
    WidgetTester tester, {
    Locale locale = const Locale('en'),
    double textScale = 1,
  }) async {
    tester.view
      ..physicalSize = const Size(390, 844)
      ..devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = textScale;
    addTearDown(tester.view.reset);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    final telemetry = Telemetry(sink);
    await telemetry.setAnalyticsConsent(granted: true);
    await pumpWithFlags(
      tester,
      child: App(locale: locale),
      overrides: [
        ...loggingOverrides(db),
        telemetryProvider.overrideWithValue(telemetry),
      ],
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byType(FabLog));
    await tester.pumpAndSettle();
  }

  Future<void> tapVisible(WidgetTester tester, Finder finder) async {
    await tester.ensureVisible(finder);
    await tester.pumpAndSettle();
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> add(WidgetTester tester) =>
      tapVisible(tester, find.text('Add drink'));

  testWidgets('no history: water first, then common drinks, no alcohol', (
    tester,
  ) async {
    await openSheet(tester);

    expect(find.text('Add a drink'), findsOneWidget);
    final names = [
      for (final id in ['water_plain', 'tea_black', 'coffee_black'])
        _drink(id).nameEn,
    ];
    for (final name in names) {
      expect(find.text(name), findsOneWidget, reason: name);
    }
    expect(find.text('Beer'), findsNothing);
  });

  testWidgets('recent drinks come first, newest first, never alcohol', (
    tester,
  ) async {
    final profile = await ProfileRepository(db)
        .getOrCreateGuest(timezone: 'UTC');
    final repo = DrinkLogRepository(db);
    final now = DateTime.now();
    for (final (id, minutesAgo) in [
      ('tea_sweet_iced', 30),
      ('alc_beer', 20),
      ('juice_orange', 10),
    ]) {
      await repo.add(
        profileId: profile.id,
        drink: _drink(id),
        volumeMl: 250,
        source: 'app',
        loggedAt: now.subtract(Duration(minutes: minutesAgo)),
      );
    }

    await openSheet(tester);

    final juice = tester.getTopLeft(find.text(_drink('juice_orange').nameEn));
    final tea = tester.getTopLeft(find.text('Iced sweet tea'));
    final water = tester.getTopLeft(find.text('Water'));
    expect(juice.dx, lessThan(tea.dx));
    expect(tea.dx, lessThan(water.dx));
    expect(find.text('Beer'), findsNothing);
  });

  testWidgets('preset + Add writes exactly one log with BR-03 hydration', (
    tester,
  ) async {
    await openSheet(tester);
    final juice = _drink('juice_orange');

    await tester.tap(find.text(juice.nameEn));
    await tester.tap(find.text('350 ml'));
    await tester.pumpAndSettle();
    // 350 ml × 88% = 308 ml; 350 ml × 8.4 g / 100 ml = 29 g.
    expect(find.text('Counts as 308 ml · 29 g sugar'), findsOneWidget);
    await add(tester);

    final saved = (await logs()).single;
    expect(saved.drinkId, juice.id);
    expect(saved.volumeMl, 350);
    expect(saved.hydrationMl, 308);
    expect(saved.hydrationMl, juice.hydrationFor(350));
    expect(saved.source, 'app');
    expect(find.byType(LogSheet), findsNothing);
  });

  testWidgets('custom volume uses the stepper in 10 ml steps', (tester) async {
    await openSheet(tester);

    await tester.tap(find.text('Custom'));
    await tester.pumpAndSettle();
    expect(find.byType(Slider), findsOneWidget);
    for (final tooltip in [
      'Increase by 10 ml',
      'Increase by 10 ml',
      'Increase by 10 ml',
      'Decrease by 10 ml',
    ]) {
      await tester.tap(find.byTooltip(tooltip));
      await tester.pumpAndSettle();
    }
    expect(find.text('270 ml'), findsOneWidget);
    await add(tester);

    final saved = (await logs()).single;
    expect(saved.volumeMl, 270);
    expect(saved.hydrationMl, 270);
  });

  testWidgets('custom volume stays within 50-1,500 ml', (tester) async {
    await openSheet(tester);
    await tester.tap(find.text('Custom'));
    await tester.pumpAndSettle();

    await tester.drag(find.byType(Slider), const Offset(-500, 0));
    await tester.pumpAndSettle();
    expect(find.text('50 ml'), findsNWidgets(2));
    await tester.tap(find.byTooltip('Decrease by 10 ml'));
    await tester.pumpAndSettle();
    expect(find.text('50 ml'), findsNWidgets(2));

    await tester.drag(find.byType(Slider), const Offset(500, 0));
    await tester.pumpAndSettle();
    expect(find.text('1,500 ml'), findsNWidgets(2));
  });

  for (final (locale, query, name) in [
    (const Locale('en'), 'iced sweet tea', 'Iced sweet tea'),
    (const Locale('id'), 'es teh manis', 'Es teh manis'),
  ]) {
    testWidgets('picker search "$query" (${locale.languageCode}) selects', (
      tester,
    ) async {
      await openSheet(tester, locale: locale);

      await tapVisible(
        tester,
        find.text(locale.languageCode == 'id' ? 'Semua minuman' : 'All drinks'),
      );
      expect(find.byType(DrinkPickerScreen), findsOneWidget);
      await tester.enterText(find.byType(TextField), query);
      await tester.pumpAndSettle();
      expect(find.text(name), findsWidgets);
      await tester.tap(find.text(name).first);
      await tester.pumpAndSettle();

      expect(find.byType(DrinkPickerScreen), findsNothing);
      expect(find.byType(LogSheet), findsOneWidget);
      expect(find.text(name), findsOneWidget);
      await tapVisible(
        tester,
        find.text(locale.languageCode == 'id' ? 'Tambahkan' : 'Add drink'),
      );
      expect((await logs()).single.drinkId, 'tea_sweet_iced');
    });
  }

  testWidgets('alcohol: not counted in picker and sheet, stored as 0', (
    tester,
  ) async {
    await openSheet(tester);
    await tapVisible(tester, find.text('All drinks'));

    await tapVisible(tester, find.text('Alcohol'));
    expect(
      find.text(
        'Alcohol is logged for your records but never counts toward your '
        'water goal.',
      ),
      findsOneWidget,
    );
    expect(find.text('Logged, not counted'), findsWidgets);
    await tapVisible(tester, find.text('Beer'));

    expect(find.byType(LogSheet), findsOneWidget);
    expect(find.text('Logged, not counted'), findsOneWidget);
    await add(tester);

    final saved = (await logs()).single;
    expect(saved.drinkId, 'alc_beer');
    expect(saved.volumeMl, 250);
    expect(saved.hydrationMl, 0);
  });

  testWidgets('Undo within 5 s removes the log and restores the total', (
    tester,
  ) async {
    await openSheet(tester);
    await add(tester);

    expect(find.text('Added 250 ml Water'), findsOneWidget);
    expect(await todayMl(), 250);
    await tester.pump(const Duration(seconds: 4));
    await tester.tap(find.text('Undo'));
    await tester.pumpAndSettle();

    final saved = (await logs()).single;
    expect(saved.deletedAt, isNotNull);
    expect(await todayMl(), 0);
  });

  testWidgets('after 5 s the snackbar is gone and the log stays', (
    tester,
  ) async {
    await openSheet(tester);
    await add(tester);
    expect(find.text('Undo'), findsOneWidget);

    await tester.pump(const Duration(seconds: 6));
    await tester.pumpAndSettle();

    expect(find.text('Undo'), findsNothing);
    expect((await logs()).single.deletedAt, isNull);
    expect(await todayMl(), 250);
  });

  testWidgets('over-drinking notice above 1,000 ml in 60 min; still logs', (
    tester,
  ) async {
    final profile = await ProfileRepository(db)
        .getOrCreateGuest(timezone: 'UTC');
    await DrinkLogRepository(db).add(
      profileId: profile.id,
      drink: _drink('water_plain'),
      volumeMl: 800,
      source: 'app',
      loggedAt: DateTime.now().subtract(const Duration(minutes: 10)),
    );
    await openSheet(tester);

    // 800 + 150 = 950 ml: below the hourly limit.
    await tester.tap(find.text('150 ml'));
    await tester.pumpAndSettle();
    expect(find.text("That's a lot in one hour."), findsNothing);

    // 800 + 250 = 1,050 ml.
    await tester.tap(find.text('250 ml'));
    await tester.pumpAndSettle();
    expect(find.text("That's a lot in one hour."), findsOneWidget);
    await add(tester);

    expect(await logs(), hasLength(2));
  });

  testWidgets('telemetry receives only drink_logged{source: in_app}', (
    tester,
  ) async {
    await openSheet(tester);
    await add(tester);

    final (name, properties) = sink.captured.single;
    expect(name, 'drink_logged');
    expect(properties, {'source': 'in_app'});
  });

  for (final (locale, scale) in [
    (const Locale('en'), 2.0),
    (const Locale('ar'), 1.0),
    (const Locale('ar'), 2.0),
  ]) {
    testWidgets('sheet and picker render without overflow '
        '(${locale.languageCode}, ${scale}x)', (tester) async {
      await openSheet(tester, locale: locale, textScale: scale);
      final ar = locale.languageCode == 'ar';
      expect(
        Directionality.of(tester.element(find.byType(LogSheet))),
        ar ? TextDirection.rtl : TextDirection.ltr,
      );

      await tapVisible(tester, find.text(ar ? 'مخصص' : 'Custom'));
      await tapVisible(tester, find.text(_drink('juice_orange').nameEn));
      expect(tester.takeException(), isNull);

      await tapVisible(tester, find.text(ar ? 'كل المشروبات' : 'All drinks'));
      expect(find.byType(DrinkPickerScreen), findsOneWidget);
      await tapVisible(tester, find.text(ar ? 'كحول' : 'Alcohol'));
      expect(tester.takeException(), isNull);
    });
  }
}
