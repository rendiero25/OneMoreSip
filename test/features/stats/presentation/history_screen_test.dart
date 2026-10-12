import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/app/theme/app_theme.dart';
import 'package:onemoresip/core/db/app_database.dart';
import 'package:onemoresip/core/db/database_providers.dart';
import 'package:onemoresip/core/flags/feature_flags.dart';
import 'package:onemoresip/features/drinks/data/drink_catalog_provider.dart';
import 'package:onemoresip/features/drinks/domain/drink.dart';
import 'package:onemoresip/features/drinks/domain/drink_catalog.dart';
import 'package:onemoresip/features/logging/data/drink_log_repository.dart';
import 'package:onemoresip/features/profile/data/profile_repository.dart';
import 'package:onemoresip/features/stats/presentation/history_screen.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

import '../../../helpers/database.dart';
import '../../../helpers/logging.dart';

Drink _drink(
  String id,
  String name,
  DrinkCategory category, {
  double waterPct = 100,
  bool isAlcoholic = false,
}) => Drink(
  id: id,
  nameEn: name,
  nameId: name,
  localName: '',
  category: category,
  defaultServingMl: 250,
  waterPct: waterPct,
  isAlcoholic: isAlcoholic,
  sugarGPer100Ml: 0,
  caffeineMgPer100Ml: 0,
);

void main() {
  final water = _drink('water_plain', 'Water', DrinkCategory.water);
  final juice = _drink(
    'juice_orange',
    'Orange juice',
    DrinkCategory.juice,
    waterPct: 88,
  );
  final beer = _drink(
    'alc_beer',
    'Beer',
    DrinkCategory.alcohol,
    waterPct: 92,
    isAlcoholic: true,
  );
  final catalog = DrinkCatalog([water, juice, beer]);
  final now = DateTime(2026, 10, 11, 20);
  final today9 = DateTime(2026, 10, 11, 9);

  late AppDatabase db;
  late DrinkLogRepository logs;
  late Profile profile;

  setUp(() async {
    db = memoryDatabase();
    logs = DrinkLogRepository(db);
    profile = await ProfileRepository(db)
        .getOrCreateGuest(timezone: 'Asia/Jakarta');
  });

  Future<DrinkLog> add(Drink drink, int volumeMl, DateTime at) => logs.add(
    profileId: profile.id,
    drink: drink,
    volumeMl: volumeMl,
    source: 'app',
    loggedAt: at,
  );

  Future<void> pumpHistory(
    WidgetTester tester, {
    Locale locale = const Locale('en'),
    double scale = 1,
  }) async {
    tester.view
      ..physicalSize = const Size(390, 844)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(db),
          clockProvider.overrideWithValue(() => now),
          drinkCatalogProvider.overrideWith((ref) async => catalog),
        ],
        child: MaterialApp(
          theme: AppTheme.light,
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // Above the navigator, so the edit sheet scales too.
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.linear(scale)),
            child: child!,
          ),
          home: const Scaffold(body: HistoryScreen()),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('lists logs by day with totals, goal state and alcohol', (
    tester,
  ) async {
    await add(water, 250, today9);
    await add(beer, 330, DateTime(2026, 10, 11, 10));
    await add(water, 2200, DateTime(2026, 10, 10, 12));
    await pumpHistory(tester);

    expect(find.text('History'), findsOneWidget);
    expect(find.text('Today'), findsOneWidget);
    expect(find.text('Yesterday'), findsOneWidget);
    expect(find.text('250 / 2,200 ml'), findsOneWidget);
    expect(find.text('2,200 / 2,200 ml'), findsOneWidget);
    expect(find.text('Goal met'), findsOneWidget);
    expect(find.text('Water'), findsNWidgets(2));
    expect(find.text('Beer'), findsOneWidget);
    expect(find.text('330 ml'), findsOneWidget);
    expect(find.text('Logged, not counted'), findsOneWidget);
    expect(find.byTooltip('Edit Water at 9:00 AM'), findsOneWidget);
    await unmountApp(tester);
  });

  testWidgets('a drink missing from the catalog gets a generic name', (
    tester,
  ) async {
    await add(_drink('custom_x', 'X', DrinkCategory.water), 200, today9);
    await pumpHistory(tester);

    expect(find.text('Drink'), findsOneWidget);
    expect(find.text('200 / 2,200 ml'), findsOneWidget);
    await unmountApp(tester);
  });

  testWidgets('editing volume and drink updates the row and day total', (
    tester,
  ) async {
    await add(water, 250, today9);
    await pumpHistory(tester);

    await tester.tap(find.byTooltip('Edit Water at 9:00 AM'));
    await tester.pumpAndSettle();
    expect(find.text('Edit drink'), findsOneWidget);

    await tester.tap(find.text('500 ml'));
    await tester.tap(find.byTooltip('Increase by 50 ml'));
    await tester.pump();
    expect(find.text('550 ml'), findsOneWidget);

    await tester.tap(find.text('Change drink'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'orange');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Orange juice'));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Save'));
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Edit drink'), findsNothing);
    expect(find.text('Orange juice'), findsOneWidget);
    expect(find.text('550 ml'), findsOneWidget);
    expect(find.text('Counts 484 ml'), findsOneWidget);
    expect(find.text('484 / 2,200 ml'), findsOneWidget);
    await unmountApp(tester);
  });

  testWidgets('delete removes the row; Undo restores it', (tester) async {
    await add(water, 250, today9);
    await add(water, 300, DateTime(2026, 10, 11, 11));
    await pumpHistory(tester);
    expect(find.text('550 / 2,200 ml'), findsOneWidget);

    await tester.tap(find.byTooltip('Delete Water at 9:00 AM'));
    await tester.pumpAndSettle();
    expect(find.text('Drink deleted'), findsOneWidget);
    expect(find.text('250 ml'), findsNothing);
    expect(find.text('300 / 2,200 ml'), findsOneWidget);

    await tester.tap(find.text('Undo'));
    await tester.pumpAndSettle();
    expect(find.text('250 ml'), findsOneWidget);
    expect(find.text('550 / 2,200 ml'), findsOneWidget);
    await unmountApp(tester);
  });

  testWidgets('empty today shows a friendly line', (tester) async {
    await pumpHistory(tester);

    expect(find.text('Today'), findsOneWidget);
    expect(find.text('0 / 2,200 ml'), findsOneWidget);
    expect(find.text('No drinks logged yet today.'), findsOneWidget);
    await unmountApp(tester);
  });

  testWidgets('under a fluid restriction the total shows the limit', (
    tester,
  ) async {
    await ProfileRepository(db)
        .update(profile.copyWith(fluidRestrictionMl: const Value(1500)));
    await add(water, 1500, today9);
    await pumpHistory(tester);

    expect(find.text('1,500 / 1,500 ml limit'), findsOneWidget);
    expect(find.text('Goal met'), findsNothing);
    await unmountApp(tester);
  });

  for (final (locale, scale) in const [
    (Locale('en'), 2.0),
    (Locale('ar'), 1.0),
    (Locale('ar'), 2.0),
  ]) {
    testWidgets('renders without overflow: $locale at ${scale * 100}%', (
      tester,
    ) async {
      await add(water, 2200, today9);
      await add(beer, 330, DateTime(2026, 10, 11, 10));
      await add(juice, 300, DateTime(2026, 10, 9, 10));
      await pumpHistory(tester, locale: locale, scale: scale);
      expect(tester.takeException(), isNull);
      if (locale.languageCode == 'ar') {
        expect(
          Directionality.of(tester.element(find.byType(HistoryScreen))),
          TextDirection.rtl,
        );
      }

      // Opens the edit sheet of the first row.
      final edit = find.byWidgetPredicate(
        (w) => w is IconButton && w.tooltip != null,
      );
      await tester.tap(edit.first);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await unmountApp(tester);
    });
  }
}
