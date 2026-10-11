import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';

/// Test-only board of the DS tokens for the light/dark goldens.
class TokenShowcase extends StatelessWidget {
  /// Creates the board.
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final text = Theme.of(context).textTheme;
    final swatches = <String, Color>{
      'bg': c.bg,
      'surface': c.surface,
      'surfaceAlt': c.surfaceAlt,
      'ink': c.ink,
      'inkMuted': c.inkMuted,
      'onInk': c.onInk,
      'accent': c.accent,
      'onAccent': c.onAccent,
      'accentInk': c.accentInk,
      'line': c.line,
      'track': c.track,
      'divider': c.divider,
      'accentTint': c.accentTint,
      'mint': c.mint,
      'sunTint': c.sunTint,
      'coralTint': c.coralTint,
      'nightTint': c.nightTint,
      'mutedOnTint': c.mutedOnTint,
      'nav': c.nav,
      'navOn': c.navOn,
      'navOff': c.navOff,
      'snackAction': c.snackAction,
      'hcBg': c.hcBg,
      'hcButton': c.hcButton,
    };
    final styles = <String, TextStyle?>{
      'hero': text.displayLarge,
      'display': text.displayMedium,
      'h1': text.headlineLarge,
      'h2': text.headlineMedium,
      'title': text.titleLarge,
      'body': text.bodyLarge,
      'bodyStrong': text.titleMedium,
      'label': text.labelLarge,
      'caption': text.bodySmall,
    };

    return Material(
      color: c.bg,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.gutter),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.s16,
          children: [
            Wrap(
              spacing: AppSpacing.s8,
              runSpacing: AppSpacing.s8,
              children: [
                for (final MapEntry(:key, :value) in swatches.entries)
                  SizedBox(
                    width: 104,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: value,
                            borderRadius: BorderRadius.circular(AppRadius.sm),
                            border: Border.all(color: c.line),
                          ),
                        ),
                        Text(key, style: text.bodySmall),
                      ],
                    ),
                  ),
              ],
            ),
            Wrap(
              spacing: AppSpacing.s8,
              children: [
                _status(c.okBg, c.okFg, LucideIcons.circleCheck, 'Hydrated'),
                _status(
                  c.warnBg,
                  c.warnFg,
                  LucideIcons.clock,
                  'Getting thirsty',
                ),
                _status(c.badBg, c.badFg, LucideIcons.triangleAlert, 'Behind'),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(AppSpacing.s20),
              decoration: BoxDecoration(
                color: c.surface,
                borderRadius: BorderRadius.circular(AppRadius.lg),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final MapEntry(:key, :value) in styles.entries)
                    Text('$key 1,250 ml', style: value),
                ],
              ),
            ),
            Row(
              spacing: AppSpacing.s12,
              children: [
                for (final w in [400, 500, 600, 700, 800])
                  Text(
                    'Aa $w',
                    style: text.titleLarge!.copyWith(
                      fontWeight: FontWeight.values[w ~/ 100 - 1],
                    ),
                  ),
                Icon(LucideIcons.droplet, color: c.accent),
                Icon(LucideIcons.glassWater, color: c.ink),
                Icon(LucideIcons.bell, color: c.inkMuted),
              ],
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.s20),
                decoration: BoxDecoration(
                  color: c.mint,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('١٬٢٥٠ مل', style: text.displayMedium),
                    Text('اشرب كوبًا من الماء', style: text.headlineMedium),
                    Text(
                      'تذكير لطيف. نقرة واحدة للتسجيل. 250 ml',
                      style: text.bodyLarge,
                    ),
                    Text(
                      'آخر شربة قبل ساعة',
                      style: text.bodySmall!.copyWith(color: c.mutedOnTint),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _status(Color bg, Color fg, IconData icon, String label) => Container(
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.s12,
      vertical: AppSpacing.s8,
    ),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(AppRadius.pill),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      spacing: AppSpacing.s8,
      children: [
        Icon(icon, color: fg, size: 20),
        Text(label, style: AppTypography.label.copyWith(color: fg)),
      ],
    ),
  );
}
