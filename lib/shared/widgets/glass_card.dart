// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:silvertimer_flutter/core/utils/platform_utils.dart';

/// A card that renders with a frosted-glass blur effect on iOS/macOS and
/// falls back to the standard Material [Card] on other platforms.
///
/// [tintColor] is blended at low opacity over the blur layer to give the card
/// a coloured identity (e.g. primaryContainer). Defaults to a neutral white/
/// black tint that matches the surface colour.
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.tintColor,
    this.tintOpacity = 0.35,
    this.blurSigma = 20.0,
    this.borderRadius = 16.0,
    this.padding = const EdgeInsets.all(20),
  });

  final Widget child;

  /// Overlay tint blended on top of the blur. Defaults to the theme's
  /// primaryContainer colour when null.
  final Color? tintColor;

  /// Opacity of [tintColor] over the blur layer (0–1).
  final double tintOpacity;

  /// Gaussian blur radius applied behind the card.
  final double blurSigma;

  /// Corner radius of the card.
  final double borderRadius;

  /// Inner padding around [child].
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    if (!isApplePlatform) {
      return Card(
        color: tintColor ?? Theme.of(context).colorScheme.primaryContainer,
        child: Padding(padding: padding, child: child),
      );
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final resolvedTint = tintColor ?? Theme.of(context).colorScheme.primaryContainer;

    final borderColor = isDark
        ? const Color(0xFFFFFFFF).withValues(alpha: 0.15)
        : const Color(0xFF000000).withValues(alpha: 0.08);

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          decoration: BoxDecoration(
            color: resolvedTint.withValues(alpha: tintOpacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor, width: 0.5),
          ),
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
