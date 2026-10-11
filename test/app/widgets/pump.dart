import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/app/theme/app_theme.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// Pumps [child] in a themed, localized app.
Future<void> pumpComponent(
  WidgetTester tester,
  Widget child, {
  Locale locale = const Locale('en'),
  bool reduceMotion = false,
}) {
  return tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.light,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Builder(
        builder: (context) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(disableAnimations: reduceMotion),
          child: Scaffold(body: Center(child: child)),
        ),
      ),
    ),
  );
}
