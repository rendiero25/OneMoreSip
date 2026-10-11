import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_theme.dart';
import 'package:onemoresip/features/safety/domain/over_drinking.dart';
import 'package:onemoresip/features/safety/presentation/fluid_restriction_field.dart';
import 'package:onemoresip/features/safety/presentation/medical_disclaimer.dart';
import 'package:onemoresip/features/safety/presentation/over_drinking_notice.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// Pumps [child] on a 390 x 844 phone at [scale] text size in [locale].
Future<void> _pump(
  WidgetTester tester,
  Widget child, {
  Locale locale = const Locale('en'),
  double scale = 1,
}) async {
  tester.view
    ..physicalSize = const Size(390, 844)
    ..devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.light,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(scale)),
          child: Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: child,
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

const _variants = [
  (Locale('en'), 1.0),
  (Locale('en'), 2.0),
  (Locale('ar'), 1.0),
  (Locale('ar'), 2.0),
];

void main() {
  group('FluidRestrictionField', () {
    late List<RestrictionAnswer> answers;

    Future<void> pumpField(
      WidgetTester tester, {
      RestrictionAnswer? initial,
      Locale locale = const Locale('en'),
      double scale = 1,
    }) {
      answers = [];
      return _pump(
        tester,
        FluidRestrictionField(initial: initial, onChanged: answers.add),
        locale: locale,
        scale: scale,
      );
    }

    testWidgets('starts unanswered without the ml field', (tester) async {
      await pumpField(tester);
      expect(
        find.text('Has a doctor limited how much you can drink?'),
        findsOneWidget,
      );
      expect(find.byType(TextField), findsNothing);
      expect(find.byIcon(LucideIcons.check), findsNothing);
    });

    testWidgets('No reports no restriction', (tester) async {
      await pumpField(tester);
      await tester.tap(find.text('No'));
      await tester.pump();
      expect(answers.last, (hasRestriction: false, validMl: null));
      expect(find.byType(TextField), findsNothing);
      expect(find.byIcon(LucideIcons.check), findsOneWidget);
    });

    testWidgets('Yes shows the field and hint; empty is not yet valid', (
      tester,
    ) async {
      await pumpField(tester);
      await tester.tap(find.text('Yes'));
      await tester.pump();
      expect(answers.last, (hasRestriction: true, validMl: null));
      expect(find.byType(TextField), findsOneWidget);
      expect(
        find.text('Use the exact amount your doctor gave you.'),
        findsOneWidget,
      );
      expect(find.textContaining('Enter 500'), findsNothing);
    });

    testWidgets('typed values are validated (D-34)', (tester) async {
      await pumpField(tester);
      await tester.tap(find.text('Yes'));
      await tester.pump();

      await tester.enterText(find.byType(TextField), '450');
      await tester.pump();
      expect(answers.last, (hasRestriction: true, validMl: null));
      expect(
        find.text('Enter 500–3,000 ml, in steps of 50 ml.'),
        findsOneWidget,
      );
      expect(find.byIcon(LucideIcons.circleAlert), findsOneWidget);

      await tester.enterText(find.byType(TextField), '1525');
      await tester.pump();
      expect(answers.last.validMl, isNull);

      await tester.enterText(find.byType(TextField), '1200');
      await tester.pump();
      expect(answers.last, (hasRestriction: true, validMl: 1200));
      expect(find.textContaining('Enter 500'), findsNothing);
      expect(
        find.text("We'll never ask you to drink more than this."),
        findsOneWidget,
      );
    });

    testWidgets('− / + step by 50 ml within range', (tester) async {
      await pumpField(tester, initial: (hasRestriction: true, validMl: 2950));
      expect(find.text('2950'), findsOneWidget);

      await tester.tap(find.byTooltip('Increase by 50 ml'));
      await tester.pump();
      expect(answers.last.validMl, 3000);
      await tester.tap(find.byTooltip('Increase by 50 ml'));
      await tester.pump();
      expect(answers.last.validMl, 3000);

      await tester.tap(find.byTooltip('Decrease by 50 ml'));
      await tester.pump();
      expect(answers.last.validMl, 2950);
      expect(find.text('2950'), findsOneWidget);
    });

    testWidgets('choices and step buttons are at least 48 dp', (tester) async {
      await pumpField(tester, initial: (hasRestriction: true, validMl: 1500));
      for (final finder in [
        find.byTooltip('Increase by 50 ml'),
        find.byTooltip('Decrease by 50 ml'),
        find.ancestor(of: find.text('Yes'), matching: find.byType(InkWell)),
      ]) {
        final size = tester.getSize(finder);
        expect(size.width, greaterThanOrEqualTo(48));
        expect(size.height, greaterThanOrEqualTo(48));
      }
    });

    testWidgets('choices expose radio-like semantics', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpField(tester, initial: (hasRestriction: false, validMl: null));
      expect(
        tester.getSemantics(find.text('No')),
        matchesSemantics(
          label: 'No',
          isButton: true,
          isInMutuallyExclusiveGroup: true,
          hasCheckedState: true,
          isChecked: true,
          hasTapAction: true,
          hasFocusAction: true,
          isFocusable: true,
        ),
      );
      handle.dispose();
    });

    for (final (locale, scale) in _variants) {
      testWidgets('${locale.languageCode} at ${scale * 100}% has no overflow', (
        tester,
      ) async {
        await pumpField(
          tester,
          initial: (hasRestriction: true, validMl: null),
          locale: locale,
          scale: scale,
        );
        await tester.enterText(find.byType(TextField), '450');
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('MedicalDisclaimer', () {
    testWidgets('icon and text', (tester) async {
      await _pump(tester, const MedicalDisclaimer());
      expect(find.byIcon(LucideIcons.info), findsOneWidget);
      expect(
        find.textContaining('One More Sip is not a medical device.'),
        findsOneWidget,
      );
    });

    for (final (locale, scale) in _variants) {
      testWidgets('${locale.languageCode} at ${scale * 100}% has no overflow', (
        tester,
      ) async {
        await _pump(
          tester,
          const MedicalDisclaimer(),
          locale: locale,
          scale: scale,
        );
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('OverDrinkingNotice', () {
    testWidgets('none renders nothing', (tester) async {
      await _pump(
        tester,
        const OverDrinkingNotice(warning: OverDrinkingWarning.none),
      );
      expect(find.byType(Text), findsNothing);
      expect(find.byType(Icon), findsNothing);
    });

    testWidgets('hourly: gentle note with icon and text', (tester) async {
      final handle = tester.ensureSemantics();
      await _pump(
        tester,
        const OverDrinkingNotice(warning: OverDrinkingWarning.hourly),
      );
      expect(find.byIcon(LucideIcons.hourglass), findsOneWidget);
      expect(find.text("That's a lot in one hour."), findsOneWidget);
      expect(find.text('Take it easy — sip slowly.'), findsOneWidget);
      expect(
        tester.getSemantics(find.byType(OverDrinkingNotice)),
        matchesSemantics(
          isLiveRegion: true,
          label: "That's a lot in one hour.\nTake it easy — sip slowly.",
        ),
      );
      handle.dispose();
    });

    testWidgets('daily: card asks to talk to a doctor', (tester) async {
      await _pump(
        tester,
        const OverDrinkingNotice(warning: OverDrinkingWarning.daily),
      );
      expect(find.byIcon(LucideIcons.triangleAlert), findsOneWidget);
      expect(find.text("That's a lot for one day."), findsOneWidget);
      expect(
        find.textContaining('Talk to a doctor if you often feel very thirsty'),
        findsOneWidget,
      );
    });

    for (final warning in [
      OverDrinkingWarning.hourly,
      OverDrinkingWarning.daily,
    ]) {
      for (final (locale, scale) in _variants) {
        testWidgets(
          '${warning.name} ${locale.languageCode} at ${scale * 100}% has no '
          'overflow',
          (tester) async {
            await _pump(
              tester,
              OverDrinkingNotice(warning: warning),
              locale: locale,
              scale: scale,
            );
            expect(find.byType(Icon), findsOneWidget);
            expect(tester.takeException(), isNull);
          },
        );
      }
    }
  });
}
