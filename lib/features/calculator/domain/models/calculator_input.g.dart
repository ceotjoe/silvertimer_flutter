// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalculatorInputImpl _$$CalculatorInputImplFromJson(
  Map<String, dynamic> json,
) => _$CalculatorInputImpl(
  volumeValue: (json['volumeValue'] as num?)?.toDouble() ?? 0.0,
  volumeUnit:
      $enumDecodeNullable(_$VolumeUnitEnumMap, json['volumeUnit']) ??
      VolumeUnit.ml,
  currentMilliamps: (json['currentMilliamps'] as num?)?.toDouble() ?? 0.0,
  targetPpm: (json['targetPpm'] as num?)?.toDouble() ?? 10.0,
);

Map<String, dynamic> _$$CalculatorInputImplToJson(
  _$CalculatorInputImpl instance,
) => <String, dynamic>{
  'volumeValue': instance.volumeValue,
  'volumeUnit': _$VolumeUnitEnumMap[instance.volumeUnit]!,
  'currentMilliamps': instance.currentMilliamps,
  'targetPpm': instance.targetPpm,
};

const _$VolumeUnitEnumMap = {VolumeUnit.ml: 'ml', VolumeUnit.liters: 'liters'};
