import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:silvertimer_flutter/core/extensions/duration_extensions.dart';
import 'package:silvertimer_flutter/core/theme/app_colors.dart';

class CircularTimer extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final remaining = totalDuration - elapsed;
    final clampedRemaining = remaining.isNegative ? Duration.zero : remaining;
    final percent = totalDuration.inSeconds > 0
        ? (elapsed.inSeconds / totalDuration.inSeconds).clamp(0.0, 1.0)
        : 0.0;

    final color = isComplete ? AppColors.progressComplete : AppColors.progressForeground;

    return CircularPercentIndicator(
      radius: 130,
      lineWidth: 14,
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
            'remaining',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      progressColor: color,
      backgroundColor: AppColors.progressBackground,
      circularStrokeCap: CircularStrokeCap.round,
      animation: false,
    );
  }
}
