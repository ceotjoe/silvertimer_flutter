// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silvertimer_flutter/core/constants/physics_constants.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculation_result.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculator_input.dart';

part 'silver_calculator.g.dart';

/// Pure calculation service for colloidal silver electrolysis timing.
///
/// Formula (Faraday's Law of Electrolysis):
///   mass_needed_g  = ppm_mg_per_L × volume_L / 1000
///   moles_needed   = mass_needed_g / M_ag
///   charge_needed  = moles_needed × F
///   time_s         = charge_needed / I_amps
///
/// Simplified:
///   time_s = (ppm × volume_L × F) / (M_ag × I_amps × 1000)
class SilverCalculator {
  const SilverCalculator();

  /// Returns a [CalculationResult] for the given [input].
  CalculationResult calculate(CalculatorInput input) {
    final currentAmps = input.currentMilliamps / 1000.0;
    final timeSeconds =
        (input.targetPpm * input.volumeInLiters * PhysicsConstants.faradayConstant) /
            (PhysicsConstants.silverMolarMass * currentAmps * 1000.0);

    return CalculationResult(
      input: input,
      calculatedDuration: Duration(seconds: timeSeconds.round()),
      calculatedAt: DateTime.now(),
    );
  }

  /// Returns an error message string if inputs are invalid, null if valid.
  String? validate(CalculatorInput input) {
    if (input.volumeValue <= 0) {
      return 'Volume must be greater than 0';
    }
    if (input.currentMilliamps <= 0) {
      return 'Current must be greater than 0 mA';
    }
    if (input.targetPpm <= 0) {
      return 'Target PPM must be greater than 0';
    }
    if (input.currentMilliamps > 5000) {
      return 'Current exceeds safe limit (5000 mA)';
    }
    return null;
  }
}

@riverpod
SilverCalculator silverCalculator(Ref ref) => const SilverCalculator();
