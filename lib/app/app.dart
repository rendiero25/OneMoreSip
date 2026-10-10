import 'package:flutter/material.dart';

/// Root widget of One More Sip.
///
/// Placeholder until the app skeleton (T-002) adds routing, theme and l10n.
class App extends StatelessWidget {
  /// Creates the root widget.
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Brand name (D-01), not translated.
      title: 'Sip!',
      home: Scaffold(),
    );
  }
}
