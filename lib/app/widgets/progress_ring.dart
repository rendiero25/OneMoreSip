import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_typography.dart';

/// DS-5 progress ring: 12 px `accent` stroke on `track`, percent inside.
class ProgressRing extends StatelessWidget {
  /// Creates a ring; [progress] is clamped to 0–1.
  const new({required this.progress, this.size = 140, super.key});

  /// Share of the goal, 0–1.
  final double progress;

  /// Diameter.
  final double size;

  static const double _stroke = 12;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final progress = this.progress.clamp(0.0, 1.0);
    final percent = NumberFormat.percentPattern(
      Localizations.localeOf(context).toString(),
    ).format(progress);
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(
        painter: _RingPainter(progress, track: c.track, fill: c.accent),
        child: Padding(
          padding: const EdgeInsets.all(_stroke + 8),
          child: Center(
            // Large text shrinks to fit inside the ring instead of clipping.
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                percent,
                style: AppTypography.h1.copyWith(color: c.ink),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  new(this.progress, {required this.track, required this.fill});

  final double progress;
  final Color track;
  final Color fill;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    ).deflate(ProgressRing._stroke / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = ProgressRing._stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, 0, 2 * math.pi, false, paint..color = track);
    if (progress > 0) {
      canvas.drawArc(
        rect,
        -math.pi / 2,
        2 * math.pi * progress,
        false,
        paint..color = fill,
      );
    }
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.progress != progress || old.track != track || old.fill != fill;
}
