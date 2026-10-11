import 'package:flutter/material.dart';
import 'package:onemoresip/core/sippy/sippy.dart';
import 'package:onemoresip/core/sippy/sippy_state.dart';

/// Debug-only screen with every Sippy state (T-013). Registered only in
/// debug builds; labels are developer-facing state names.
class SippyDebugScreen extends StatelessWidget {
  /// Creates the screen.
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              for (final state in SippyState.values)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Sippy(state: state, key: ValueKey(state)),
                    Text(state.name),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
