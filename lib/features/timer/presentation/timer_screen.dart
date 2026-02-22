import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:silvertimer_flutter/core/extensions/duration_extensions.dart';
import 'package:silvertimer_flutter/features/calculator/presentation/calculator_controller.dart';
import 'package:silvertimer_flutter/features/timer/domain/models/timer_state.dart';
import 'package:silvertimer_flutter/features/timer/presentation/timer_controller.dart';
import 'package:silvertimer_flutter/features/timer/presentation/widgets/circular_timer.dart';

class TimerScreen extends ConsumerStatefulWidget {
  const TimerScreen({super.key});

  @override
  ConsumerState<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends ConsumerState<TimerScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final notifier = ref.read(timerControllerProvider.notifier);
    if (state == AppLifecycleState.paused) {
      notifier.onAppPaused();
    } else if (state == AppLifecycleState.resumed) {
      notifier.onAppResumed();
    }
  }

  @override
  Widget build(BuildContext context) {
    final timerState = ref.watch(timerControllerProvider);
    final calcState = ref.watch(calculatorControllerProvider);

    // Show completion dialog reactively
    ref.listen<TimerState>(timerControllerProvider, (prev, next) {
      if (next is TimerCompleted && prev is! TimerCompleted) {
        _showCompletionDialog(context, next.totalDuration);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/calculator'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Session summary
            if (calcState.lastResult != null)
              _SessionSummary(result: calcState.lastResult!.input),

            const SizedBox(height: 40),

            // Circular timer
            _buildTimerDisplay(timerState),

            const SizedBox(height: 32),

            // Elapsed / remaining row
            _buildElapsedRow(context, timerState),

            const SizedBox(height: 40),

            // Control buttons
            _buildControls(context, timerState),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerDisplay(TimerState state) {
    return switch (state) {
      TimerIdle() => CircularTimer(
          totalDuration: Duration.zero,
          elapsed: Duration.zero,
        ),
      TimerRunning(:final totalDuration, :final elapsed) => CircularTimer(
          totalDuration: totalDuration,
          elapsed: elapsed,
        ),
      TimerPaused(:final totalDuration, :final elapsed) => CircularTimer(
          totalDuration: totalDuration,
          elapsed: elapsed,
        ),
      TimerCompleted(:final totalDuration) => CircularTimer(
          totalDuration: totalDuration,
          elapsed: totalDuration,
          isComplete: true,
        ),
    };
  }

  Widget _buildElapsedRow(BuildContext context, TimerState state) {
    final (elapsed, total) = switch (state) {
      TimerIdle() => (Duration.zero, Duration.zero),
      TimerRunning(:final totalDuration, :final elapsed) => (elapsed, totalDuration),
      TimerPaused(:final totalDuration, :final elapsed) => (elapsed, totalDuration),
      TimerCompleted(:final totalDuration) => (totalDuration, totalDuration),
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatItem(label: 'Elapsed', value: elapsed.toHhMmSs()),
        Container(width: 1, height: 40, color: Theme.of(context).dividerColor),
        _StatItem(label: 'Total', value: total.toHhMmSs()),
      ],
    );
  }

  Widget _buildControls(BuildContext context, TimerState state) {
    final notifier = ref.read(timerControllerProvider.notifier);

    return switch (state) {
      TimerIdle() => FilledButton.icon(
          onPressed: null,
          icon: const Icon(Icons.play_arrow),
          label: const Text('No Timer Loaded'),
        ),
      TimerPaused() => Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                onPressed: () => notifier.start(),
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start'),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              onPressed: () {
                notifier.reset();
                context.go('/calculator');
              },
              icon: const Icon(Icons.restart_alt),
              label: const Text('Reset'),
            ),
          ],
        ),
      TimerRunning() => Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                onPressed: () => notifier.pause(),
                icon: const Icon(Icons.pause),
                label: const Text('Pause'),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              onPressed: () => _confirmReset(context, notifier),
              icon: const Icon(Icons.restart_alt),
              label: const Text('Reset'),
            ),
          ],
        ),
      TimerCompleted() => FilledButton.icon(
          onPressed: () {
            notifier.reset();
            context.go('/calculator');
          },
          icon: const Icon(Icons.check),
          label: const Text('Done'),
        ),
    };
  }

  void _confirmReset(BuildContext context, TimerController notifier) {
    final router = GoRouter.of(context);
    showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Reset Timer?'),
        content: const Text('This will stop and reset the current timer.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Reset'),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed == true && mounted) {
        notifier.reset();
        router.go('/calculator');
      }
    });
  }

  void _showCompletionDialog(BuildContext context, Duration duration) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.check_circle, size: 64, color: Colors.green),
        title: const Text('Electrolysis Complete!'),
        content: Text(
          'Your colloidal silver process is finished.\nTotal time: ${duration.toReadable()}',
          textAlign: TextAlign.center,
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              ref.read(timerControllerProvider.notifier).reset();
              context.go('/calculator');
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}

class _SessionSummary extends StatelessWidget {
  const _SessionSummary({required this.result});

  final dynamic result;

  @override
  Widget build(BuildContext context) {
    final input = result;
    final volumeText = input.volumeUnit.name == 'ml'
        ? '${input.volumeValue.toStringAsFixed(0)} mL'
        : '${input.volumeValue.toStringAsFixed(2)} L';

    return Text(
      '$volumeText  •  ${input.currentMilliamps} mA  •  ${input.targetPpm} PPM',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
      textAlign: TextAlign.center,
    ).animate().fadeIn(duration: 300.ms);
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontFeatures: const [FontFeature.tabularFigures()],
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
