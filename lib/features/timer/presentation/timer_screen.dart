import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:silvertimer_flutter/core/extensions/duration_extensions.dart';
import 'package:silvertimer_flutter/core/extensions/l10n_extension.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculator_input.dart';
import 'package:silvertimer_flutter/features/calculator/presentation/calculator_controller.dart';
import 'package:silvertimer_flutter/features/timer/data/notification_strings.dart';
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
    // Auto-load calculation when navigating to the timer screen.
    // If the timer is idle but a calculation result exists, load it.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final timerState = ref.read(timerControllerProvider);
      final calcResult = ref.read(calculatorControllerProvider).lastResult;
      if (timerState is TimerIdle && calcResult != null) {
        ref.read(timerControllerProvider.notifier).loadCalculation(calcResult);
      }
    });
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
    final l10n = context.l10n;

    // Show completion dialog reactively
    ref.listen<TimerState>(timerControllerProvider, (prev, next) {
      if (next is TimerCompleted && prev is! TimerCompleted) {
        _showCompletionDialog(context, next.totalDuration);
      }
    });

    // Show cleaning alarm SnackBar when the alarm count increases
    ref.listen<int>(cleaningAlarmCountProvider, (prev, next) {
      if (next > (prev ?? 0) && mounted) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.cleaning_services, color: Colors.white),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      l10n.cleanElectrodesSnackbar(next),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              duration: const Duration(seconds: 8),
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                label: l10n.dismiss,
                onPressed: () =>
                    ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              ),
            ),
          );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.timerTitle),
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
              _SessionSummary(input: calcState.lastResult!.input),

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
    final l10n = context.l10n;
    final (elapsed, total) = switch (state) {
      TimerIdle() => (Duration.zero, Duration.zero),
      TimerRunning(:final totalDuration, :final elapsed) => (elapsed, totalDuration),
      TimerPaused(:final totalDuration, :final elapsed) => (elapsed, totalDuration),
      TimerCompleted(:final totalDuration) => (totalDuration, totalDuration),
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _StatItem(label: l10n.elapsed, value: elapsed.toHhMmSs()),
        Container(width: 1, height: 40, color: Theme.of(context).dividerColor),
        _StatItem(label: l10n.total, value: total.toHhMmSs()),
      ],
    );
  }

  Widget _buildControls(BuildContext context, TimerState state) {
    final notifier = ref.read(timerControllerProvider.notifier);
    final l10n = context.l10n;

    return switch (state) {
      TimerIdle() => FilledButton.icon(
          onPressed: null,
          icon: const Icon(Icons.play_arrow),
          label: Text(l10n.noTimerLoaded),
        ),
      TimerPaused() => Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                onPressed: () {
                  notifier.start(
                    strings: NotificationStrings(
                      completeTitle: l10n.notifCompleteTitle,
                      completeBody: l10n.notifCompleteBody,
                      cleanTitle: l10n.notifCleanTitle,
                      cleanBodyForAlarm: (n) => l10n.notifCleanBody(n),
                      channelDescription: l10n.notifChannelDescription,
                    ),
                  );
                },
                icon: const Icon(Icons.play_arrow),
                label: Text(l10n.startButton),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              onPressed: () {
                notifier.reset();
                context.go('/calculator');
              },
              icon: const Icon(Icons.restart_alt),
              label: Text(l10n.resetButton),
            ),
          ],
        ),
      TimerRunning() => Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                onPressed: () => notifier.pause(),
                icon: const Icon(Icons.pause),
                label: Text(l10n.pauseButton),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              onPressed: () => _confirmReset(context, notifier),
              icon: const Icon(Icons.restart_alt),
              label: Text(l10n.resetButton),
            ),
          ],
        ),
      TimerCompleted() => FilledButton.icon(
          onPressed: () {
            notifier.reset();
            context.go('/calculator');
          },
          icon: const Icon(Icons.check),
          label: Text(l10n.doneButton),
        ),
    };
  }

  void _confirmReset(BuildContext context, TimerController notifier) {
    final l10n = context.l10n;
    final router = GoRouter.of(context);
    showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.resetTimerTitle),
        content: Text(l10n.resetTimerBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancelButton),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.resetButton),
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
    final l10n = context.l10n;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.check_circle, size: 64, color: Colors.green),
        title: Text(l10n.electrolysisCompleteTitle),
        content: Text(
          l10n.electrolysisCompleteBody(duration.toReadable()),
          textAlign: TextAlign.center,
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              ref.read(timerControllerProvider.notifier).reset();
              context.go('/calculator');
            },
            child: Text(l10n.doneButton),
          ),
        ],
      ),
    );
  }
}

class _SessionSummary extends StatelessWidget {
  const _SessionSummary({required this.input});

  final CalculatorInput input;

  @override
  Widget build(BuildContext context) {
    final volumeText = input.volumeUnit == VolumeUnit.ml
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
