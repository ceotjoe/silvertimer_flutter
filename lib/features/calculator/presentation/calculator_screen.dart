import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:silvertimer_flutter/features/calculator/presentation/calculator_controller.dart';
import 'package:silvertimer_flutter/features/calculator/presentation/widgets/ppm_presets.dart';
import 'package:silvertimer_flutter/features/calculator/presentation/widgets/result_card.dart';
import 'package:silvertimer_flutter/features/calculator/presentation/widgets/volume_input.dart';
import 'package:silvertimer_flutter/features/timer/presentation/timer_controller.dart';

class CalculatorScreen extends ConsumerStatefulWidget {
  const CalculatorScreen({super.key});

  @override
  ConsumerState<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends ConsumerState<CalculatorScreen> {
  final _currentController = TextEditingController();
  final _ppmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _currentController.dispose();
    _ppmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(calculatorControllerProvider);
    final notifier = ref.read(calculatorControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SilverTimer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Volume input with unit toggle
              const VolumeInput(),
              const SizedBox(height: 20),

              // Current input
              Text('Electrolysis Current', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              TextFormField(
                controller: _currentController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                decoration: const InputDecoration(
                  hintText: '1.0',
                  suffixText: 'mA',
                  helperText: 'Typical range: 0.5–3 mA',
                ),
                onChanged: (v) {
                  final parsed = double.tryParse(v) ?? 0.0;
                  notifier.updateCurrent(parsed);
                },
              ),
              const SizedBox(height: 20),

              // Target PPM input
              Text('Target Concentration', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              TextFormField(
                controller: _ppmController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
                decoration: const InputDecoration(
                  hintText: '10',
                  suffixText: 'PPM',
                ),
                onChanged: (v) {
                  final parsed = double.tryParse(v) ?? 0.0;
                  notifier.updateTargetPpm(parsed);
                },
              ),
              const SizedBox(height: 8),

              // PPM preset chips
              PpmPresets(
                onSelected: (ppm) {
                  notifier.updateTargetPpm(ppm);
                  _ppmController.text = ppm.toInt().toString();
                },
              ),
              const SizedBox(height: 8),

              // Validation error
              if (state.validationError != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    state.validationError!,
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                ),

              const SizedBox(height: 8),

              // Calculate button
              FilledButton.icon(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  final result = notifier.calculate();
                  if (result != null) {
                    // Pre-load timer with result
                    ref.read(timerControllerProvider.notifier).loadCalculation(result);
                  }
                },
                icon: const Icon(Icons.calculate),
                label: const Text('Calculate Time'),
              ),

              // Result card (shown after successful calculation)
              if (state.lastResult != null) ...[
                const SizedBox(height: 24),
                ResultCard(
                  result: state.lastResult!,
                  onStartTimer: () {
                    ref
                        .read(timerControllerProvider.notifier)
                        .loadCalculation(state.lastResult!);
                    context.go('/timer');
                  },
                ),
              ],

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
