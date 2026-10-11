import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// DS-5 log button: 72 dp `accent` circle with a 32 "+" and the
/// `fabShadow` glow (DS-4). Announced as "Log drink".
class FabLog extends StatelessWidget {
  /// Creates the button.
  const new({required this.onPressed, super.key});

  /// Tap callback.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return Semantics(
      button: true,
      label: AppLocalizations.of(context).fabLogLabel,
      excludeSemantics: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: c.fabShadow,
              offset: const Offset(0, 8),
              blurRadius: 24,
            ),
          ],
        ),
        child: Material(
          color: c.accent,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onPressed,
            child: SizedBox.square(
              dimension: 72,
              child: Icon(LucideIcons.plus, size: 32, color: c.onAccent),
            ),
          ),
        ),
      ),
    );
  }
}
