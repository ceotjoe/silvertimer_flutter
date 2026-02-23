import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:silvertimer_flutter/core/extensions/duration_extensions.dart';
import 'package:silvertimer_flutter/core/extensions/l10n_extension.dart';
import 'package:silvertimer_flutter/core/theme/app_colors.dart';
import 'package:silvertimer_flutter/features/timer/presentation/timer_controller.dart';

/// Circular countdown timer with optional electrode cleaning alarm tick marks.
///
/// Tick marks are drawn as radial lines on the progress ring at each
/// scheduled cleaning alarm position. Passed marks are dimmed; pending marks
/// are bright white. The most recently fired mark briefly pulses on firing.
class CircularTimer extends ConsumerStatefulWidget {
  const CircularTimer({
    super.key,
    required this.totalDuration,
    required this.elapsed,
    this.isComplete = false,
  });

  final Duration totalDuration;
  final Duration elapsed;
  final bool isComplete;

  @override
  ConsumerState<CircularTimer> createState() => _CircularTimerState();
}

class _CircularTimerState extends ConsumerState<CircularTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  /// Tracks how many alarms have fired so we can detect a new one.
  int _lastFiredCount = 0;

  static const double _radius = 130.0;
  static const double _lineWidth = 14.0;
  // Arc centerline sits at (radius − lineWidth/2) from the widget centre
  static const double _arcRadius = _radius - _lineWidth / 2;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _pulseAnimation = CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final markers = ref.watch(cleaningMarkersProvider);
    final nextCleaningIn = ref.watch(nextCleaningInProvider);

    // Detect a new alarm firing → trigger the brief pulse animation
    final firedCount = markers.passed.length;
    if (firedCount > _lastFiredCount) {
      _lastFiredCount = firedCount;
      _pulseController.forward(from: 0.0);
    }

    final remaining = widget.totalDuration - widget.elapsed;
    final clampedRemaining =
        remaining.isNegative ? Duration.zero : remaining;
    final percent = widget.totalDuration.inSeconds > 0
        ? (widget.elapsed.inSeconds / widget.totalDuration.inSeconds)
            .clamp(0.0, 1.0)
        : 0.0;

    final progressColor = widget.isComplete
        ? AppColors.progressComplete
        : AppColors.progressForeground;

    final cleanGreen = Colors.green.shade400;

    return SizedBox(
      width: _radius * 2,
      height: _radius * 2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ── Base ring ──────────────────────────────────────────────────
          CircularPercentIndicator(
            radius: _radius,
            lineWidth: _lineWidth,
            percent: percent,
            center: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  clampedRemaining.toHhMmSs(),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                ),
                Text(
                  context.l10n.remaining,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                // ── Next cleaning countdown ─────────────────────────────
                if (nextCleaningIn != null && !widget.isComplete) ...[
                  const SizedBox(height: 6),
                  Text(
                    nextCleaningIn.toHhMmSs(),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: cleanGreen,
                          fontWeight: FontWeight.w600,
                          fontFeatures: const [FontFeature.tabularFigures()],
                        ),
                  ),
                  Text(
                    context.l10n.nextClean,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: cleanGreen,
                        ),
                  ),
                ],
              ],
            ),
            progressColor: progressColor,
            backgroundColor: AppColors.progressBackground,
            circularStrokeCap: CircularStrokeCap.round,
            animation: false,
          ),

          // ── Cleaning alarm tick marks ───────────────────────────────────
          if (markers.pending.isNotEmpty || markers.passed.isNotEmpty)
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, _) {
                return CustomPaint(
                  size: const Size(_radius * 2, _radius * 2),
                  painter: _CleaningMarkerPainter(
                    pendingMarkers: markers.pending,
                    passedMarkers: markers.passed,
                    arcRadius: _arcRadius,
                    pulseProgress: _pulseAnimation.value,
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CustomPainter — radial tick marks at alarm positions on the ring
// ─────────────────────────────────────────────────────────────────────────────

/// Paints radial tick marks at normalized (0.0–1.0) positions on the ring.
///
/// **Geometry:** The ring starts at the top (angle = −π/2) and progresses
/// clockwise, matching [CircularPercentIndicator]'s default behaviour.
/// Position [p] maps to angle = −π/2 + p × 2π.
///
/// Each tick is a short line centred on the arc centerline [arcRadius], extending
/// [_tickHalfLength] pixels inward and outward.
class _CleaningMarkerPainter extends CustomPainter {
  const _CleaningMarkerPainter({
    required this.pendingMarkers,
    required this.passedMarkers,
    required this.arcRadius,
    required this.pulseProgress,
  });

  final List<double> pendingMarkers;
  final List<double> passedMarkers;
  final double arcRadius;

  /// 0.0 = alarm just fired (bright), 1.0 = fully transitioned to dim.
  final double pulseProgress;

  static const double _tickHalfLength = 7.0;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final passedPaint = Paint()
      ..color = Colors.white54
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final pendingPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.85)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // ── Passed marks ───────────────────────────────────────────────────────
    for (int i = 0; i < passedMarkers.length; i++) {
      final isLastFired = i == passedMarkers.length - 1;

      Paint paint;
      if (isLastFired && pulseProgress < 1.0) {
        // Animate: bright-pending → dim-passed
        final alpha = _lerp(0.85, 0.54, pulseProgress);
        final strokeW = _lerp(4.0, 2.5, pulseProgress);
        paint = Paint()
          ..color = Colors.white.withValues(alpha: alpha)
          ..strokeWidth = strokeW
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;
      } else {
        paint = passedPaint;
      }

      _drawTick(canvas, center, passedMarkers[i], paint);
    }

    // ── Pending marks ──────────────────────────────────────────────────────
    for (final marker in pendingMarkers) {
      _drawTick(canvas, center, marker, pendingPaint);
    }
  }

  void _drawTick(Canvas canvas, Offset center, double position, Paint paint) {
    final angle = -math.pi / 2 + position * 2 * math.pi;
    final inner = Offset(
      center.dx + (arcRadius - _tickHalfLength) * math.cos(angle),
      center.dy + (arcRadius - _tickHalfLength) * math.sin(angle),
    );
    final outer = Offset(
      center.dx + (arcRadius + _tickHalfLength) * math.cos(angle),
      center.dy + (arcRadius + _tickHalfLength) * math.sin(angle),
    );
    canvas.drawLine(inner, outer, paint);
  }

  @override
  bool shouldRepaint(_CleaningMarkerPainter old) {
    return old.pendingMarkers != pendingMarkers ||
        old.passedMarkers != passedMarkers ||
        old.pulseProgress != pulseProgress;
  }

  static double _lerp(double a, double b, double t) => a + (b - a) * t;
}
