// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Device _$DeviceFromJson(Map<String, dynamic> json) => _Device(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  currentMilliamps: (json['currentMilliamps'] as num).toDouble(),
  supportsAutoPolarity: json['supportsAutoPolarity'] as bool? ?? false,
);

Map<String, dynamic> _$DeviceToJson(_Device instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'currentMilliamps': instance.currentMilliamps,
  'supportsAutoPolarity': instance.supportsAutoPolarity,
};
