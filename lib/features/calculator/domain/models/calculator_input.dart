import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculator_input.freezed.dart';
part 'calculator_input.g.dart';

enum VolumeUnit { ml, liters }

@freezed
abstract class CalculatorInput with _$CalculatorInput {
  const CalculatorInput._();

  const factory CalculatorInput({
    @Default(0.0) double volumeValue,
    @Default(VolumeUnit.ml) VolumeUnit volumeUnit,
    @Default(0.0) double currentMilliamps,
    @Default(10.0) double targetPpm,
  }) = _CalculatorInput;

  factory CalculatorInput.fromJson(Map<String, dynamic> json) =>
      _$CalculatorInputFromJson(json);

  /// Volume normalized to liters for calculation.
  double get volumeInLiters =>
      volumeUnit == VolumeUnit.ml ? volumeValue / 1000.0 : volumeValue;
}
