// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silvertimer_flutter/core/extensions/l10n_extension.dart';
import 'package:silvertimer_flutter/features/devices/domain/models/device.dart';
import 'package:silvertimer_flutter/features/devices/presentation/devices_controller.dart';
import 'package:silvertimer_flutter/features/devices/presentation/widgets/device_edit_dialog.dart';
import 'package:silvertimer_flutter/shared/widgets/adaptive_app_bar.dart';

class ManageDevicesScreen extends ConsumerWidget {
  const ManageDevicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devicesAsync = ref.watch(devicesControllerProvider);
    final l10n = context.l10n;

    return Scaffold(
      appBar: adaptiveAppBar(
        title: l10n.manageDevicesTitle,
        trailingActions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: l10n.addDeviceTitle,
            onPressed: () => showDeviceEditDialog(context, ref),
          ),
        ],
      ),
      body: devicesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48),
              const SizedBox(height: 16),
              Text(l10n.historyLoadError(e.toString())),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => ref.invalidate(devicesControllerProvider),
                child: Text(l10n.retryButton),
              ),
            ],
          ),
        ),
        data: (devices) => devices.isEmpty
            ? _EmptyState()
            : ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, i) => _DeviceTile(
                  device: devices[i],
                  onTap: () => showDeviceEditDialog(context, ref, existing: devices[i]),
                  onDelete: () =>
                      ref.read(devicesControllerProvider.notifier).deleteDevice(devices[i].id),
                ),
              ),
      ),
    );
  }
}

class _DeviceTile extends StatelessWidget {
  const _DeviceTile({required this.device, required this.onTap, required this.onDelete});

  final Device device;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final currentText = device.currentMilliamps == device.currentMilliamps.truncateToDouble()
        ? device.currentMilliamps.truncate().toString()
        : device.currentMilliamps.toString();

    return Dismissible(
      key: ValueKey(device.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Theme.of(context).colorScheme.errorContainer,
        child: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
      ),
      onDismissed: (_) => onDelete(),
      child: ListTile(
        onTap: onTap,
        leading: const CircleAvatar(child: Icon(Icons.bolt, size: 20)),
        title: Text(device.name),
        subtitle: Text(
          device.supportsAutoPolarity
              ? '$currentText ${l10n.maSuffix}  •  ${l10n.autoPolarityLabel}'
              : '$currentText ${l10n.maSuffix}',
        ),
        trailing: const Icon(Icons.edit_outlined),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.bolt_outlined, size: 80, color: Theme.of(context).colorScheme.outline),
          const SizedBox(height: 16),
          Text(l10n.noDevicesYet, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            l10n.noDevicesSubtitle,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
