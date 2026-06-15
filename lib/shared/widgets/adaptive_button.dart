// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silvertimer_flutter/core/utils/platform_utils.dart';

/// A primary action button. Renders [CupertinoButton.filled] on iOS/macOS
/// and [FilledButton] on all other platforms.
class AdaptiveFilledButton extends StatelessWidget {
  const AdaptiveFilledButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    if (isApplePlatform) {
      return CupertinoButton.filled(
        onPressed: onPressed,
        child: _Row(icon: icon, label: label),
      );
    }

    if (icon != null) {
      return FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      );
    }
    return FilledButton(onPressed: onPressed, child: Text(label));
  }
}

/// A secondary action button. Renders a plain [CupertinoButton] on iOS/macOS
/// and [OutlinedButton] on all other platforms.
class AdaptiveOutlinedButton extends StatelessWidget {
  const AdaptiveOutlinedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    if (isApplePlatform) {
      return CupertinoButton(
        onPressed: onPressed,
        color: color.withValues(alpha: 0.12),
        child: _Row(icon: icon, label: label, color: color),
      );
    }

    if (icon != null) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      );
    }
    return OutlinedButton(onPressed: onPressed, child: Text(label));
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, this.icon, this.color});

  final String label;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (icon == null) return Text(label);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}
