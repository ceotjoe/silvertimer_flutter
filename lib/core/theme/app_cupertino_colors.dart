// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/cupertino.dart';

/// Semantic dynamic colors for Apple platforms.
///
/// Each constant is a [CupertinoDynamicColor] that resolves to the correct
/// value for light/dark mode via [CupertinoDynamicColor.resolve] or
/// [CupertinoDynamicColor.resolveFrom]. This replaces manual `isDark` checks
/// in every widget and ensures colours follow the system automatically.
abstract final class AppCupertinoColors {
  /// Frosted-glass surface fill — the semi-transparent tint behind blur layers.
  /// Light: 72 % white  •  Dark: 72 % iOS systemGray6 (#1C1C1E)
  static const glassFill = CupertinoDynamicColor.withBrightness(
    color: Color(0xB8FFFFFF),
    darkColor: Color(0xB81C1C1E),
  );

  /// Hairline border drawn on top of glass surfaces.
  /// Light: 8 % black  •  Dark: 12 % white
  static const glassBorder = CupertinoDynamicColor.withBrightness(
    color: Color(0x14000000),
    darkColor: Color(0x1EFFFFFF),
  );

  /// Glass card border — slightly more visible than the nav-bar border.
  /// Light: 8 % black  •  Dark: 15 % white
  static const glassCardBorder = CupertinoDynamicColor.withBrightness(
    color: Color(0x14000000),
    darkColor: Color(0x26FFFFFF),
  );

  /// Filled text-field background (mirrors iOS system secondarySystemFill).
  /// Light: #EFEFEF0  •  Dark: #2C2C2E
  static const inputFill = CupertinoDynamicColor.withBrightness(
    color: Color(0xFFEFEFF0),
    darkColor: Color(0xFF2C2C2E),
  );
}
