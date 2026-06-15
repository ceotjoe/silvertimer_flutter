// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:ui';

import 'package:flutter/material.dart';

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
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    // Glass surface colours — subtle white/black tint over the blur.
    final fillColor = isDark
        ? const Color(0xFF1C1C1E).withValues(alpha: 0.72)
        : const Color(0xFFFFFFFF).withValues(alpha: 0.72);
    final borderColor = isDark
        ? const Color(0xFFFFFFFF).withValues(alpha: 0.12)
        : const Color(0xFF000000).withValues(alpha: 0.08);

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
                        isDark: isDark,
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
    required this.isDark,
  });

  final GlassNavDestination destination;
  final bool selected;
  final VoidCallback onTap;
  final bool isDark;

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
