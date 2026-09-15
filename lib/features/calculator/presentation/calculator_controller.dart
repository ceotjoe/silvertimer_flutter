// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silvertimer_flutter/core/utils/silver_calculator.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculation_result.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculator_input.dart';
import 'package:silvertimer_flutter/features/devices/domain/models/device.dart';
import 'package:silvertimer_flutter/features/devices/presentation/devices_controller.dart';
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

    // Devices load asynchronously; once they resolve, this rebuilds and
    // restores the last-selected device by id (or stays "Custom" if none
    // was saved, or the saved device was since deleted).
    final devices = ref.watch(devicesControllerProvider).value ?? const [];
    Device? selectedDevice;
    for (final device in devices) {
      if (device.id == last.lastDeviceId) {
        selectedDevice = device;
        break;
      }
    }

    return CalculatorState(
      input: CalculatorInput(
        volumeValue: last.volumeValue ?? 500.0,
        volumeUnit: last.volumeUnit ?? settings.defaultVolumeUnit,
        targetPpm: last.targetPpm ?? settings.defaultPpm,
        currentMilliamps: selectedDevice?.currentMilliamps ?? settings.defaultCurrentMa,
        selectedDevice: selectedDevice,
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

  /// Manual mA entry — switches the input back to "Custom" so the stored
  /// device selection never disagrees with the displayed/used mA value.
  void updateCurrent(double mA) {
    state = state.copyWith(
      input: state.input.copyWith(currentMilliamps: mA, selectedDevice: null),
      clearResult: true,
      clearError: true,
    );
    ref.read(settingsRepositoryProvider).saveLastDeviceId(null);
  }

  /// Selects a saved device, or clears back to "Custom" manual entry when null.
  void selectDevice(Device? device) {
    state = state.copyWith(
      input: state.input.copyWith(
        selectedDevice: device,
        currentMilliamps: device?.currentMilliamps ?? state.input.currentMilliamps,
      ),
      clearResult: true,
      clearError: true,
    );
    ref.read(settingsRepositoryProvider).saveLastDeviceId(device?.id);
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
