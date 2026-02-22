// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalculationResultImpl _$$CalculationResultImplFromJson(
  Map<String, dynamic> json,
) => _$CalculationResultImpl(
  input: CalculatorInput.fromJson(json['input'] as Map<String, dynamic>),
  calculatedDuration: Duration(
    microseconds: (json['calculatedDuration'] as num).toInt(),
  ),
  calculatedAt: DateTime.parse(json['calculatedAt'] as String),
);

Map<String, dynamic> _$$CalculationResultImplToJson(
  _$CalculationResultImpl instance,
) => <String, dynamic>{
  'input': instance.input,
  'calculatedDuration': instance.calculatedDuration.inMicroseconds,
  'calculatedAt': instance.calculatedAt.toIso8601String(),
};
