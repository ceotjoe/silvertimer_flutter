// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silvertimer_flutter/core/utils/silver_calculator.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculation_result.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculator_input.dart';
import 'package:silvertimer_flutter/features/settings/data/settings_repository.dart';
import 'package:silvertimer_flutter/features/settings/presentation/settings_controller.dart';

part 'calculator_controller.g.dart';

class CalculatorState {
  const CalculatorState({
    this.input = const CalculatorInput(),
    this.lastResult,
    this.validationError,
  });

  final CalculatorInput input;
  final CalculationResult? lastResult;
  final String? validationError;

  CalculatorState copyWith({
    CalculatorInput? input,
    CalculationResult? lastResult,
    String? validationError,
    bool clearResult = false,
    bool clearError = false,
  }) {
    return CalculatorState(
      input: input ?? this.input,
      lastResult: clearResult ? null : lastResult ?? this.lastResult,
      validationError: clearError ? null : validationError ?? this.validationError,
    );
  }
}

@Riverpod(keepAlive: true)
class CalculatorController extends _$CalculatorController {
  @override
  CalculatorState build() {
    final settings = ref.watch(settingsControllerProvider);
    final repo = ref.read(settingsRepositoryProvider);
    final last = repo.loadLastCalculatorInput();

    return CalculatorState(
      input: CalculatorInput(
        volumeValue: last.volumeValue ?? 500.0,
        volumeUnit: last.volumeUnit ?? settings.defaultVolumeUnit,
        targetPpm: last.targetPpm ?? settings.defaultPpm,
        currentMilliamps: settings.defaultCurrentMa,
      ),
    );
  }

  void updateVolume(double value) {
    state = state.copyWith(
      input: state.input.copyWith(volumeValue: value),
      clearResult: true,
      clearError: true,
    );
    ref.read(settingsRepositoryProvider).saveLastVolumeValue(value);
  }

  void toggleVolumeUnit() {
    final currentUnit = state.input.volumeUnit;
    final newUnit = currentUnit == VolumeUnit.ml ? VolumeUnit.liters : VolumeUnit.ml;

    // Convert displayed value to the new unit
    double newValue = state.input.volumeValue;
    if (currentUnit == VolumeUnit.ml && newUnit == VolumeUnit.liters) {
      newValue = newValue / 1000.0;
    } else if (currentUnit == VolumeUnit.liters && newUnit == VolumeUnit.ml) {
      newValue = newValue * 1000.0;
    }

    state = state.copyWith(
      input: state.input.copyWith(volumeValue: newValue, volumeUnit: newUnit),
      clearResult: true,
      clearError: true,
    );
    final repo = ref.read(settingsRepositoryProvider);
    repo.saveLastVolumeValue(newValue);
    repo.saveLastVolumeUnit(newUnit);
  }

  void setVolumeUnit(VolumeUnit unit) {
    if (unit == state.input.volumeUnit) return;
    toggleVolumeUnit();
  }

  void updateCurrent(double mA) {
    state = state.copyWith(
      input: state.input.copyWith(currentMilliamps: mA),
      clearResult: true,
      clearError: true,
    );
  }

  void updateTargetPpm(double ppm) {
    state = state.copyWith(
      input: state.input.copyWith(targetPpm: ppm),
      clearResult: true,
      clearError: true,
    );
    ref.read(settingsRepositoryProvider).saveLastTargetPpm(ppm);
  }

  /// Validates inputs and calculates the result.
  /// Returns the [CalculationResult] on success, null on validation failure.
  CalculationResult? calculate() {
    final calculator = ref.read(silverCalculatorProvider);
    final error = calculator.validate(state.input);
    if (error != null) {
      state = state.copyWith(validationError: error, clearResult: true);
      return null;
    }

    final result = calculator.calculate(state.input);
    state = state.copyWith(lastResult: result, clearError: true);
    return result;
  }
}
