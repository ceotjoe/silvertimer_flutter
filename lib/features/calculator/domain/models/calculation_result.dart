// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';
import 'calculator_input.dart';

part 'calculation_result.freezed.dart';
part 'calculation_result.g.dart';

@freezed
abstract class CalculationResult with _$CalculationResult {
  const factory CalculationResult({
    required CalculatorInput input,
    required Duration calculatedDuration,
    required DateTime calculatedAt,
  }) = _CalculationResult;

  factory CalculationResult.fromJson(Map<String, dynamic> json) =>
      _$CalculationResultFromJson(json);
}
