import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// DS-5 progress glass: a glass filled to [progress] with a moving wave
/// and the percent below it.
///
/// Painted in code (D-29). The level animates over 400 ms (DS-9); under
/// Reduce Motion the level jumps and the wave stands still (DS-6).
class ProgressGlass extends StatefulWidget {
  /// Creates a glass; [progress] is clamped to 0–1.
  const new({required this.progress, super.key});

  /// Share of today's goal, 0–1.
  final double progress;

  @override
  State<ProgressGlass> createState() => _ProgressGlassState();
}

class _ProgressGlassState extends State<ProgressGlass>
    with SingleTickerProviderStateMixin {
  late final AnimationController _wave = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  );

  bool get _reduceMotion =>
      MediaQuery.maybeDisableAnimationsOf(context) ?? false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_reduceMotion) {
      _wave
        ..stop()
        ..value = 0;
    } else if (!_wave.isAnimating) {
      _wave.repeat();
    }
  }

  @override
  void dispose() {
    _wave.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final progress = widget.progress.clamp(0.0, 1.0);
    final percent = NumberFormat.percentPattern(
      Localizations.localeOf(context).toString(),
    ).format(progress);
    return Semantics(
      label: AppLocalizations.of(context).progressGlassLabel(percent),
      excludeSemantics: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 64,
            height: 98,
            child: TweenAnimationBuilder<double>(
              tween: Tween(end: progress),
              duration: _reduceMotion
                  ? Duration.zero
                  : const Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              builder: (context, level, _) => AnimatedBuilder(
                animation: _wave,
                builder: (context, _) => CustomPaint(
                  painter: _GlassPainter(
                    level: level,
                    phase: _wave.value * 2 * math.pi,
                    colors: c,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.s8),
          Text(
            percent,
            style: AppTypography.label.copyWith(
              color: c.ink,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _GlassPainter extends CustomPainter {
  new({required this.level, required this.phase, required this.colors});

  final double level;
  final double phase;
  final AppColors colors;

  // Glass outline in the export's 80 x 124 box.
  static final _glass = Path()
    ..moveTo(8, 6)
    ..lineTo(72, 6)
    ..lineTo(65, 112)
    ..quadraticBezierTo(64, 120, 56, 120)
    ..lineTo(24, 120)
    ..quadraticBezierTo(16, 120, 15, 112)
    ..close();

  @override
  void paint(Canvas canvas, Size size) {
    canvas
      ..save()
      ..scale(size.width / 80, size.height / 124)
      ..save()
      ..clipPath(_glass)
      ..drawPaint(Paint()..color = colors.surface);
    final top = 6 + (1 - level) * 114;
    canvas
      ..drawPath(
        _wave(top - 3, phase + math.pi),
        Paint()..color = colors.waterBack,
      )
      ..drawPath(_wave(top, phase), Paint()..color = colors.water)
      ..restore()
      ..drawPath(
        _glass,
        Paint()
          ..color = colors.ink
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3.5
          ..strokeJoin = StrokeJoin.round,
      )
      ..restore();
  }

  /// Water body whose surface is a sine wave around [y].
  Path _wave(double y, double phase) {
    final path = Path()..moveTo(0, 124);
    for (var x = 0.0; x <= 80; x += 4) {
      path.lineTo(x, y + 3 * math.sin(x / 80 * 2 * math.pi + phase));
    }
    return path
      ..lineTo(80, 124)
      ..close();
  }

  @override
  bool shouldRepaint(_GlassPainter old) =>
      old.level != level || old.phase != phase || old.colors != colors;
}
