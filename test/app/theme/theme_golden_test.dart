// Goldens render differently on Windows and the Linux CI runner, so they
// are verified locally on Windows only: `flutter test --tags golden`.
@Tags(['golden'])
library;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/app/theme/app_theme.dart';

import '../../helpers/fonts.dart';
import 'token_showcase.dart';

void main() {
  setUpAll(loadAppFonts);

  for (final (name, theme) in [
    ('light', AppTheme.light),
    ('dark', AppTheme.dark),
  ]) {
    testWidgets('token showcase ($name)', (tester) async {
      tester.view
        ..physicalSize = const Size(760, 920)
        ..devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const TokenShowcase(),
        ),
      );

      await expectLater(
        find.byType(TokenShowcase),
        matchesGoldenFile('goldens/theme_$name.png'),
      );
    });
  }
}
