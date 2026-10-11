import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/app/app.dart';
import 'package:onemoresip/app/theme/app_theme.dart';

import '../helpers/flags.dart';

void main() {
  testWidgets('App builds with the brand title and opens Home', (tester) async {
    await pumpWithFlags(tester, child: const App());
    await tester.pumpAndSettle();

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.title, 'Sip!');
    expect(app.theme, same(AppTheme.light));
    expect(app.darkTheme, same(AppTheme.dark));
    expect(app.themeMode, ThemeMode.system);
    expect(find.byKey(const ValueKey('UI-03')), findsOneWidget);
  });
}
