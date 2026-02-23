import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silvertimer_flutter/core/extensions/l10n_extension.dart';
import 'package:silvertimer_flutter/features/calculator/presentation/calculator_controller.dart';

class PpmPresets extends ConsumerWidget {
  const PpmPresets({super.key, required this.onSelected});

  final void Function(double ppm) onSelected;

  static const _presets = [25.0, 50.0, 100.0];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPpm = ref.watch(
      calculatorControllerProvider.select((s) => s.input.targetPpm),
    );
    final l10n = context.l10n;

    return Wrap(
      spacing: 8,
      alignment: WrapAlignment.center,
      children: _presets.map((ppm) {
        return FilterChip(
          label: Text(l10n.ppmPresetLabel(ppm.toInt())),
          selected: currentPpm == ppm,
          onSelected: (_) => onSelected(ppm),
        );
      }).toList(),
    );
  }
}
