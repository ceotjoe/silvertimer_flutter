// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silvertimer_flutter/core/extensions/l10n_extension.dart';
import 'package:silvertimer_flutter/features/devices/domain/models/device.dart';
import 'package:silvertimer_flutter/features/devices/presentation/devices_controller.dart';
import 'package:silvertimer_flutter/shared/widgets/adaptive_text_field.dart';

/// Shows a dialog to add a new device, or edit an [existing] one.
Future<void> showDeviceEditDialog(BuildContext context, WidgetRef ref, {Device? existing}) {
  return showDialog<void>(
    context: context,
    builder: (ctx) => _DeviceEditDialogContent(existing: existing, ref: ref),
  );
}

class _DeviceEditDialogContent extends StatefulWidget {
  const _DeviceEditDialogContent({required this.existing, required this.ref});

  final Device? existing;
  final WidgetRef ref;

  @override
  State<_DeviceEditDialogContent> createState() => _DeviceEditDialogContentState();
}

class _DeviceEditDialogContentState extends State<_DeviceEditDialogContent> {
  late final TextEditingController _nameController;
  late final TextEditingController _currentController;
  late bool _supportsAutoPolarity;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.existing?.name ?? '');
    _currentController = TextEditingController(
      text: widget.existing != null ? _formatCurrent(widget.existing!.currentMilliamps) : '',
    );
    _supportsAutoPolarity = widget.existing?.supportsAutoPolarity ?? false;
  }

  String _formatCurrent(double value) =>
      value == value.truncateToDouble() ? value.truncate().toString() : value.toString();

  @override
  void dispose() {
    _nameController.dispose();
    _currentController.dispose();
    super.dispose();
  }

  void _save() {
    final name = _nameController.text.trim();
    final currentMilliamps = double.tryParse(_currentController.text);
    if (name.isEmpty || currentMilliamps == null || currentMilliamps <= 0) return;

    final notifier = widget.ref.read(devicesControllerProvider.notifier);
    final existing = widget.existing;
    if (existing != null) {
      notifier.updateDevice(
        existing.copyWith(
          name: name,
          currentMilliamps: currentMilliamps,
          supportsAutoPolarity: _supportsAutoPolarity,
        ),
      );
    } else {
      notifier.addDevice(
        Device(
          id: 0,
          name: name,
          currentMilliamps: currentMilliamps,
          supportsAutoPolarity: _supportsAutoPolarity,
        ),
      );
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isEditing = widget.existing != null;

    return AlertDialog(
      title: Text(isEditing ? l10n.editDeviceTitle : l10n.addDeviceTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AdaptiveTextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: l10n.deviceNameLabel),
          ),
          const SizedBox(height: 12),
          AdaptiveTextField(
            controller: _currentController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
            decoration: InputDecoration(
              hintText: l10n.deviceCurrentLabel,
              suffixText: l10n.maSuffix,
            ),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.autoPolarityLabel),
            subtitle: Text(l10n.autoPolaritySubtitle),
            value: _supportsAutoPolarity,
            onChanged: (v) => setState(() => _supportsAutoPolarity = v),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.cancelButton)),
        FilledButton(onPressed: _save, child: Text(l10n.saveButton)),
      ],
    );
  }
}
