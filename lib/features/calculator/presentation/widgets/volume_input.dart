import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculator_input.dart';
import 'package:silvertimer_flutter/features/calculator/presentation/calculator_controller.dart';

class VolumeInput extends ConsumerStatefulWidget {
  const VolumeInput({super.key});

  @override
  ConsumerState<VolumeInput> createState() => _VolumeInputState();
}

class _VolumeInputState extends ConsumerState<VolumeInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(calculatorControllerProvider);
    final notifier = ref.read(calculatorControllerProvider.notifier);
    final unit = state.input.volumeUnit;

    // Sync controller text when unit changes (value is converted)
    final value = state.input.volumeValue;
    final displayText = value == 0.0 ? '' : _formatValue(value);
    if (_controller.text != displayText && !_controller.selection.isCollapsed) {
      // Only update if user is not actively editing
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Water Volume', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                decoration: InputDecoration(
                  hintText: '0',
                  suffixText: unit == VolumeUnit.ml ? 'mL' : 'L',
                ),
                onChanged: (v) {
                  final parsed = double.tryParse(v) ?? 0.0;
                  notifier.updateVolume(parsed);
                },
              ),
            ),
            const SizedBox(width: 12),
            SegmentedButton<VolumeUnit>(
              segments: const [
                ButtonSegment(value: VolumeUnit.ml, label: Text('mL')),
                ButtonSegment(value: VolumeUnit.liters, label: Text('L')),
              ],
              selected: {unit},
              onSelectionChanged: (s) {
                notifier.setVolumeUnit(s.first);
                // Update displayed text after unit toggle
                final newValue = ref.read(calculatorControllerProvider).input.volumeValue;
                _controller.text = newValue == 0.0 ? '' : _formatValue(newValue);
              },
            ),
          ],
        ),
      ],
    );
  }

  String _formatValue(double v) {
    if (v == v.truncateToDouble()) return v.truncate().toString();
    return v.toStringAsFixed(3).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
  }
}
