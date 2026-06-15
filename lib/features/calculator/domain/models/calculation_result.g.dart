// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalculationResult _$CalculationResultFromJson(Map<String, dynamic> json) =>
    _CalculationResult(
      input: CalculatorInput.fromJson(json['input'] as Map<String, dynamic>),
      calculatedDuration: Duration(
        microseconds: (json['calculatedDuration'] as num).toInt(),
      ),
      calculatedAt: DateTime.parse(json['calculatedAt'] as String),
    );

Map<String, dynamic> _$CalculationResultToJson(_CalculationResult instance) =>
    <String, dynamic>{
      'input': instance.input,
      'calculatedDuration': instance.calculatedDuration.inMicroseconds,
      'calculatedAt': instance.calculatedAt.toIso8601String(),
    };
