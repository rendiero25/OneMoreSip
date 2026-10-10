import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:onemoresip/app/app.dart';
import 'package:onemoresip/app/router.dart';

import '../helpers/flags.dart';

void main() {
  const screens = {
    Routes.splash: 'UI-01-splash',
    Routes.welcome: 'UI-01-welcome',
    Routes.onboarding: 'UI-02',
    Routes.home: 'UI-03',
    Routes.simple: 'UI-03b',
    Routes.log: 'UI-04',
    Routes.drinks: 'UI-05',
    Routes.aiPhoto: 'UI-06',
    Routes.aiChat: 'UI-07',
    Routes.insight: 'UI-08',
    Routes.stats: 'UI-09',
    Routes.paywall: 'UI-10',
    Routes.challenges: 'UI-11',
    Routes.family: 'UI-12',
    Routes.fasting: 'UI-13',
    Routes.reminders: 'UI-14',
    Routes.me: 'UI-15',
    Routes.streaks: 'UI-16',
    '/i/abc123': 'invite',
    '/c/XYZ9': 'challenge-join',
  };

  Future<GoRouter> pumpApp(WidgetTester tester) async {
    final container = await pumpWithFlags(tester, child: const App());
    final router = container.read(routerProvider);
    await tester.pumpAndSettle();
    return router;
  }

  testWidgets('every route opens its screen', (tester) async {
    final router = await pumpApp(tester);

    for (final MapEntry(key: path, value: id) in screens.entries) {
      router.go(path);
      await tester.pumpAndSettle();
      expect(find.byKey(ValueKey(id)), findsOneWidget, reason: path);
    }
  });

  testWidgets('deep links expose their parameter', (tester) async {
    final router = await pumpApp(tester);

    router.go('/i/abc123');
    await tester.pumpAndSettle();
    expect(router.state.pathParameters['token'], 'abc123');

    router.go('/c/XYZ9');
    await tester.pumpAndSettle();
    expect(router.state.pathParameters['code'], 'XYZ9');
  });
}
