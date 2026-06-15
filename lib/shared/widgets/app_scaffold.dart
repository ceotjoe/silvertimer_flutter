// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silvertimer_flutter/core/extensions/l10n_extension.dart';
import 'package:silvertimer_flutter/core/utils/platform_utils.dart';
import 'package:silvertimer_flutter/shared/widgets/glass_navigation_bar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final index = _locationToIndex(location);

    if (isApplePlatform) {
      return _AppleScaffold(selectedIndex: index, onSelect: (i) => _indexToLocation(context, i), child: child);
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => _indexToLocation(context, i),
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
      case 0: context.go('/calculator');
      case 1: context.go('/timer');
      case 2: context.go('/history');
      case 3: context.go('/info');
    }
  }
}

/// Scaffold variant for iOS/macOS: body extends to the bottom edge so content
/// can scroll under the glass bar, which floats on top via a Stack.
class _AppleScaffold extends StatelessWidget {
  const _AppleScaffold({
    required this.child,
    required this.selectedIndex,
    required this.onSelect,
  });

  final Widget child;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Content fills the whole screen including under the glass bar.
          child,
          // Glass bar pinned to the bottom.
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildGlassBar(context),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassBar(BuildContext context) {
    final l10n = context.l10n;
    return GlassNavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onSelect,
      destinations: [
        glassDestination(
          icon: Icons.calculate_outlined,
          selectedIcon: Icons.calculate,
          label: l10n.navCalculator,
        ),
        glassDestination(
          icon: Icons.timer_outlined,
          selectedIcon: Icons.timer,
          label: l10n.navTimer,
        ),
        glassDestination(
          icon: Icons.history_outlined,
          selectedIcon: Icons.history,
          label: l10n.navHistory,
        ),
        glassDestination(
          icon: Icons.info_outline,
          selectedIcon: Icons.info,
          label: l10n.navInfo,
        ),
      ],
    );
  }
}
