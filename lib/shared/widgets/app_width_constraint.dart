// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Letterboxes the app to a phone-width column on web and macOS, so a wide
/// browser window or a resized macOS window doesn't stretch layouts that
/// were designed for a phone-width viewport.
class AppWidthConstraint extends StatelessWidget {
  const AppWidthConstraint({super.key, required this.child});

  final Widget? child;

  static const double _maxContentWidth = 480;

  @override
  Widget build(BuildContext context) {
    final shouldConstrain = kIsWeb || defaultTargetPlatform == TargetPlatform.macOS;
    if (!shouldConstrain || child == null) {
      return child ?? const SizedBox.shrink();
    }

    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxContentWidth),
          child: child,
        ),
      ),
    );
  }
}
