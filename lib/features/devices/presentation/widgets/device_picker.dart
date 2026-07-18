// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:silvertimer_flutter/core/extensions/l10n_extension.dart';
import 'package:silvertimer_flutter/features/calculator/presentation/calculator_controller.dart';
import 'package:silvertimer_flutter/features/devices/presentation/devices_controller.dart';

/// Dropdown to pick a saved device (feeding its mA into the calculator), or
/// "Custom" (`null`) to fall back to manual mA entry. Includes a shortcut to
/// the device management screen.
class DevicePicker extends ConsumerWidget {
  const DevicePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devicesAsync = ref.watch(devicesControllerProvider);
    final selectedDevice = ref.watch(
      calculatorControllerProvider.select((s) => s.input.selectedDevice),
    );
    final notifier = ref.read(calculatorControllerProvider.notifier);
    final l10n = context.l10n;

    return devicesAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
      data: (devices) {
        // If the previously selected device was deleted, fall back to Custom
        // for the dropdown's displayed value (the mA already entered stays).
        final selectedId =
            devices.any((d) => d.id == selectedDevice?.id) ? selectedDevice?.id : null;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: DropdownButtonFormField<int?>(
                initialValue: selectedId,
                decoration: InputDecoration(labelText: l10n.deviceLabel),
                items: [
                  DropdownMenuItem(value: null, child: Text(l10n.customDeviceOption)),
                  ...devices.map(
                    (d) => DropdownMenuItem(value: d.id, child: Text(d.name)),
                  ),
                ],
                onChanged: (id) {
                  final device = id == null ? null : devices.firstWhere((d) => d.id == id);
                  notifier.selectDevice(device);
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.tune),
              tooltip: l10n.manageDevicesTooltip,
              onPressed: () => context.push('/devices'),
            ),
          ],
        );
      },
    );
  }
}
