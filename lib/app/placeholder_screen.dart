import 'package:flutter/material.dart';

/// Temporary screen for a route whose feature is not built yet.
///
/// Shows only the screen ID (e.g. `UI-03`), a developer label, so it carries
/// no user-facing copy. Each feature task replaces its placeholder.
class PlaceholderScreen extends StatelessWidget {
  /// Creates a placeholder for the screen [id].
  const new({required this.id, super.key});

  /// Screen ID from docs/claude-design-prompts.md.
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(id)));
  }
}
