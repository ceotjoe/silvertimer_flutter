// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:silvertimer_flutter/core/extensions/l10n_extension.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculator_input.dart';
import 'package:silvertimer_flutter/features/settings/presentation/settings_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsControllerProvider);
    final notifier = ref.read(settingsControllerProvider.notifier);
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        children: [
          // Appearance section
          _SectionHeader(l10n.appearanceSection),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(l10n.themeLabel, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 8),
                SegmentedButton<ThemeMode>(
                  segments: [
                    ButtonSegment(
                      value: ThemeMode.system,
                      label: Text(l10n.themeSystem),
                      icon: const Icon(Icons.brightness_auto),
                    ),
                    ButtonSegment(
                      value: ThemeMode.light,
                      label: Text(l10n.themeLight),
                      icon: const Icon(Icons.light_mode),
                    ),
                    ButtonSegment(
                      value: ThemeMode.dark,
                      label: Text(l10n.themeDark),
                      icon: const Icon(Icons.dark_mode),
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
          _SectionHeader(l10n.defaultsSection),
          ListTile(
            title: Text(l10n.volumeUnitLabel),
            trailing: DropdownButton<VolumeUnit>(
              value: settings.defaultVolumeUnit,
              underline: const SizedBox.shrink(),
              items: [
                DropdownMenuItem(value: VolumeUnit.ml, child: Text(l10n.volumeUnitMl)),
                DropdownMenuItem(value: VolumeUnit.liters, child: Text(l10n.volumeUnitLiters)),
              ],
              onChanged: (v) {
                if (v != null) notifier.setDefaultVolumeUnit(v);
              },
            ),
          ),
          ListTile(
            title: Text(l10n.defaultPpmLabel),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 40,
                  child: Text(l10n.ppmSuffix, style: Theme.of(context).textTheme.bodyMedium),
                ),
                SizedBox(
                  width: 80,
                  child: _PpmField(
                    value: settings.defaultPpm,
                    onChanged: notifier.setDefaultPpm,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(l10n.defaultCurrentLabel),
            subtitle: Text(l10n.typicalCurrentRange),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 40,
                  child: Text(l10n.maSuffix, style: Theme.of(context).textTheme.bodyMedium),
                ),
                SizedBox(
                  width: 80,
                  child: _CurrentMaField(
                    value: settings.defaultCurrentMa,
                    onChanged: notifier.setDefaultCurrentMa,
                  ),
                ),
              ],
            ),
          ),

          const Divider(indent: 16, endIndent: 16),

          // Electrode cleaning alarm section
          _SectionHeader(l10n.electrodeCleaningSection),
          SwitchListTile(
            title: Text(l10n.enableCleaningAlarmLabel),
            subtitle: Text(l10n.enableCleaningAlarmSubtitle),
            value: settings.cleaningAlarmsEnabled,
            onChanged: notifier.setCleaningAlarmsEnabled,
          ),
          ListTile(
            title: Text(l10n.cleaningIntervalLabel),
            subtitle: Text(l10n.cleaningIntervalSubtitle),
            enabled: settings.cleaningAlarmsEnabled,
            trailing: DropdownButton<int>(
              value: settings.cleaningIntervalMinutes,
              underline: const SizedBox.shrink(),
              onChanged: settings.cleaningAlarmsEnabled
                  ? (v) {
                      if (v != null) notifier.setCleaningIntervalMinutes(v);
                    }
                  : null,
              items: [
                DropdownMenuItem(value: 5, child: Text(l10n.interval5min)),
                DropdownMenuItem(value: 10, child: Text(l10n.interval10min)),
                DropdownMenuItem(value: 15, child: Text(l10n.interval15min)),
                DropdownMenuItem(value: 20, child: Text(l10n.interval20min)),
                DropdownMenuItem(value: 30, child: Text(l10n.interval30min)),
              ],
            ),
          ),

          const Divider(),

          // Notifications section
          _SectionHeader(l10n.notificationsSection),
          SwitchListTile(
            title: Text(l10n.enableNotificationsLabel),
            subtitle: Text(l10n.enableNotificationsSubtitle),
            value: settings.notificationsEnabled,
            onChanged: notifier.setNotificationsEnabled,
          ),

          const Divider(),

          // About section
          _SectionHeader(l10n.aboutSection),
          ExpansionTile(
            leading: const Icon(Icons.science_outlined),
            title: Text(l10n.calculationFormulaTitle),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  l10n.calculationFormulaBody,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) => ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(l10n.versionLabel),
              trailing: Text(snapshot.data?.version ?? '—'),
            ),
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
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toInt().toString());
    _focusNode = FocusNode()..addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) _save(_controller.text);
  }

  void _save(String v) {
    final parsed = double.tryParse(v);
    if (parsed != null && parsed > 0) widget.onChanged(parsed);
  }

  @override
  void dispose() {
    _save(_controller.text);
    _focusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(isDense: true),
      onSubmitted: _save,
    );
  }
}

class _CurrentMaField extends StatefulWidget {
  const _CurrentMaField({required this.value, required this.onChanged});
  final double value;
  final void Function(double) onChanged;

  @override
  State<_CurrentMaField> createState() => _CurrentMaFieldState();
}

class _CurrentMaFieldState extends State<_CurrentMaField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toInt().toString());
    _focusNode = FocusNode()..addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) _save(_controller.text);
  }

  void _save(String v) {
    final parsed = double.tryParse(v);
    if (parsed != null && parsed > 0) widget.onChanged(parsed);
  }

  @override
  void dispose() {
    _save(_controller.text);
    _focusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(isDense: true),
      onSubmitted: _save,
    );
  }
}
