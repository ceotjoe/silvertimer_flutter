import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculator_input.dart';
import 'package:silvertimer_flutter/features/settings/presentation/settings_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsControllerProvider);
    final notifier = ref.read(settingsControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // Appearance section
          _SectionHeader('Appearance'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Theme', style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 8),
                SegmentedButton<ThemeMode>(
                  segments: const [
                    ButtonSegment(
                      value: ThemeMode.system,
                      label: Text('System'),
                      icon: Icon(Icons.brightness_auto),
                    ),
                    ButtonSegment(
                      value: ThemeMode.light,
                      label: Text('Light'),
                      icon: Icon(Icons.light_mode),
                    ),
                    ButtonSegment(
                      value: ThemeMode.dark,
                      label: Text('Dark'),
                      icon: Icon(Icons.dark_mode),
                    ),
                  ],
                  selected: {settings.themeMode},
                  onSelectionChanged: (s) => notifier.setThemeMode(s.first),
                ),
              ],
            ),
          ),

          const Divider(),

          // Defaults section
          _SectionHeader('Defaults'),
          ListTile(
            title: const Text('Volume Unit'),
            trailing: DropdownButton<VolumeUnit>(
              value: settings.defaultVolumeUnit,
              underline: const SizedBox.shrink(),
              items: const [
                DropdownMenuItem(value: VolumeUnit.ml, child: Text('mL')),
                DropdownMenuItem(value: VolumeUnit.liters, child: Text('Liters')),
              ],
              onChanged: (v) {
                if (v != null) notifier.setDefaultVolumeUnit(v);
              },
            ),
          ),
          ListTile(
            title: const Text('Default PPM'),
            trailing: SizedBox(
              width: 80,
              child: _PpmField(
                value: settings.defaultPpm,
                onChanged: notifier.setDefaultPpm,
              ),
            ),
          ),

          const Divider(),

          // Notifications section
          _SectionHeader('Notifications'),
          SwitchListTile(
            title: const Text('Enable Notifications'),
            subtitle: const Text('Alert when electrolysis is complete'),
            value: settings.notificationsEnabled,
            onChanged: notifier.setNotificationsEnabled,
          ),

          const Divider(),

          // About section
          _SectionHeader('About'),
          ExpansionTile(
            leading: const Icon(Icons.science_outlined),
            title: const Text('Calculation Formula'),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Based on Faraday\'s Law of Electrolysis:\n\n'
                  'time (s) = (PPM × Volume (L) × F) / (M_ag × I (A) × 1000)\n\n'
                  'where:\n'
                  '  F = 96,485 C/mol (Faraday constant)\n'
                  '  M_ag = 107.87 g/mol (molar mass of silver)\n'
                  '  I = current in amperes\n'
                  '  PPM = target concentration in mg/L',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Version'),
            trailing: const Text('1.0.0'),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

class _PpmField extends StatefulWidget {
  const _PpmField({required this.value, required this.onChanged});
  final double value;
  final void Function(double) onChanged;

  @override
  State<_PpmField> createState() => _PpmFieldState();
}

class _PpmFieldState extends State<_PpmField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toInt().toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(suffixText: 'PPM', isDense: true),
      onSubmitted: (v) {
        final parsed = double.tryParse(v);
        if (parsed != null && parsed > 0) widget.onChanged(parsed);
      },
    );
  }
}
