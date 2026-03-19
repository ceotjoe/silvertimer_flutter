// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silvertimer_flutter/core/extensions/l10n_extension.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _locationToIndex(location),
        onDestinationSelected: (index) => _indexToLocation(context, index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.calculate_outlined),
            selectedIcon: const Icon(Icons.calculate),
            label: context.l10n.navCalculator,
          ),
          NavigationDestination(
            icon: const Icon(Icons.timer_outlined),
            selectedIcon: const Icon(Icons.timer),
            label: context.l10n.navTimer,
          ),
          NavigationDestination(
            icon: const Icon(Icons.history_outlined),
            selectedIcon: const Icon(Icons.history),
            label: context.l10n.navHistory,
          ),
          NavigationDestination(
            icon: const Icon(Icons.info_outline),
            selectedIcon: const Icon(Icons.info),
            label: context.l10n.navInfo,
          ),
        ],
      ),
    );
  }

  int _locationToIndex(String location) {
    if (location.startsWith('/timer')) return 1;
    if (location.startsWith('/history')) return 2;
    if (location.startsWith('/info')) return 3;
    return 0;
  }

  void _indexToLocation(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/calculator');
      case 1:
        context.go('/timer');
      case 2:
        context.go('/history');
      case 3:
        context.go('/info');
    }
  }
}
