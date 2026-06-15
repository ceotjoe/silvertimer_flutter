// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:silvertimer_flutter/core/theme/app_cupertino_colors.dart';

/// A bottom navigation bar with a Liquid Glass–style frosted glass effect.
/// Used on iOS and macOS in place of the standard Material NavigationBar.
class GlassNavigationBar extends StatelessWidget {
  const GlassNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<GlassNavDestination> destinations;

  @override
  Widget build(BuildContext context) {
    final fillColor = AppCupertinoColors.glassFill.resolveFrom(context);
    final borderColor = AppCupertinoColors.glassBorder.resolveFrom(context);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          decoration: BoxDecoration(
            color: fillColor,
            border: Border(top: BorderSide(color: borderColor, width: 0.5)),
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: 56,
              child: Row(
                children: [
                  for (int i = 0; i < destinations.length; i++)
                    Expanded(
                      child: _GlassNavItem(
                        destination: destinations[i],
                        selected: i == selectedIndex,
                        onTap: () => onDestinationSelected(i),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassNavItem extends StatelessWidget {
  const _GlassNavItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final GlassNavDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = selected ? colorScheme.primary : colorScheme.onSurfaceVariant;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                selected ? destination.selectedIcon : destination.icon,
                key: ValueKey(selected),
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              destination.label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Data class for a single tab destination.
class GlassNavDestination {
  const GlassNavDestination({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}

/// Convenience constructor matching [NavigationDestination] shape.
GlassNavDestination glassDestination({
  required IconData icon,
  required IconData selectedIcon,
  required String label,
}) =>
    GlassNavDestination(icon: icon, selectedIcon: selectedIcon, label: label);
