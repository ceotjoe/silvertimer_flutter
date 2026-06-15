// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionRecord _$SessionRecordFromJson(Map<String, dynamic> json) =>
    _SessionRecord(
      id: (json['id'] as num).toInt(),
      volumeLiters: (json['volumeLiters'] as num).toDouble(),
      currentMilliamps: (json['currentMilliamps'] as num).toDouble(),
      targetPpm: (json['targetPpm'] as num).toDouble(),
      durationSeconds: (json['durationSeconds'] as num).toInt(),
      completedAt: DateTime.parse(json['completedAt'] as String),
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$SessionRecordToJson(_SessionRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'volumeLiters': instance.volumeLiters,
      'currentMilliamps': instance.currentMilliamps,
      'targetPpm': instance.targetPpm,
      'durationSeconds': instance.durationSeconds,
      'completedAt': instance.completedAt.toIso8601String(),
      'completed': instance.completed,
    };
