import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/app/router.dart';

/// Root widget of One More Sip.
///
/// Theme (T-010) and l10n (T-006) are added by their tasks.
class App extends ConsumerWidget {
  /// Creates the root widget.
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      // Brand name (D-01), not translated.
      title: 'Sip!',
      routerConfig: ref.watch(routerProvider),
    );
  }
}
