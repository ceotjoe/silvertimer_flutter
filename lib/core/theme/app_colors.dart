// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';

/// Silver/metallic color palette for SilverTimer.
class AppColors {
  AppColors._();

  // Primary - Silver tones
  static const Color silver = Color(0xFFC0C0C0);
  static const Color silverDark = Color(0xFF9E9E9E);
  static const Color silverLight = Color(0xFFE8E8E8);

  // Accent - Electric blue (electrolysis theme)
  static const Color electricBlue = Color(0xFF1976D2);
  static const Color electricBlueDark = Color(0xFF0D47A1);
  static const Color electricBlueLight = Color(0xFF42A5F5);

  // Semantic
  static const Color success = Color(0xFF43A047);
  static const Color warning = Color(0xFFFFA000);
  static const Color error = Color(0xFFD32F2F);

  // Timer progress
  static const Color progressBackground = Color(0xFFE0E0E0);
  static const Color progressForeground = electricBlue;
  static const Color progressComplete = success;

  // Surface
  static const Color cardLight = Color(0xFFF5F5F5);
  static const Color cardDark = Color(0xFF1E1E1E);
}
