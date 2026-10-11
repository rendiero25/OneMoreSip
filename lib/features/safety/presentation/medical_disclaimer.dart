import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// "Not a medical device" note for onboarding, About and AI screens (F-28,
/// SC-03). Uses `inkMuted`, so place it on `bg` / `surface`, not on tints.
class MedicalDisclaimer extends StatelessWidget {
  /// Creates the disclaimer.
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(LucideIcons.info, size: 18, color: c.inkMuted),
        const SizedBox(width: AppSpacing.s8),
        Expanded(
          child: Text(
            AppLocalizations.of(context).medicalDisclaimer,
            style: AppTypography.label.copyWith(color: c.inkMuted),
          ),
        ),
      ],
    );
  }
}
