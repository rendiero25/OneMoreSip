import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/app/router.dart';
import 'package:onemoresip/app/theme/app_theme.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// Root widget of One More Sip. Light/dark theme follows the system
/// (T-010).
class App extends ConsumerWidget {
  /// Creates the root widget.
  const new({super.key, this.locale});

  /// Forces a locale (tests, in-app language switch in T-073); `null`
  /// follows the system language.
  final Locale? locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      // Brand name (D-01), not translated.
      title: 'Sip!',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      // themeMode defaults to ThemeMode.system.
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: ref.watch(routerProvider),
    );
  }
}
