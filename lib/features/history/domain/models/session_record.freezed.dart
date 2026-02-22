// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SessionRecord _$SessionRecordFromJson(Map<String, dynamic> json) {
  return _SessionRecord.fromJson(json);
}

/// @nodoc
mixin _$SessionRecord {
  int get id => throw _privateConstructorUsedError;
  double get volumeLiters => throw _privateConstructorUsedError;
  double get currentMilliamps => throw _privateConstructorUsedError;
  double get targetPpm => throw _privateConstructorUsedError;
  int get durationSeconds => throw _privateConstructorUsedError;
  DateTime get completedAt => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  /// Serializes this SessionRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionRecordCopyWith<SessionRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionRecordCopyWith<$Res> {
  factory $SessionRecordCopyWith(
    SessionRecord value,
    $Res Function(SessionRecord) then,
  ) = _$SessionRecordCopyWithImpl<$Res, SessionRecord>;
  @useResult
  $Res call({
    int id,
    double volumeLiters,
    double currentMilliamps,
    double targetPpm,
    int durationSeconds,
    DateTime completedAt,
    bool completed,
  });
}

/// @nodoc
class _$SessionRecordCopyWithImpl<$Res, $Val extends SessionRecord>
    implements $SessionRecordCopyWith<$Res> {
  _$SessionRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? volumeLiters = null,
    Object? currentMilliamps = null,
    Object? targetPpm = null,
    Object? durationSeconds = null,
    Object? completedAt = null,
    Object? completed = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            volumeLiters: null == volumeLiters
                ? _value.volumeLiters
                : volumeLiters // ignore: cast_nullable_to_non_nullable
                      as double,
            currentMilliamps: null == currentMilliamps
                ? _value.currentMilliamps
                : currentMilliamps // ignore: cast_nullable_to_non_nullable
                      as double,
            targetPpm: null == targetPpm
                ? _value.targetPpm
                : targetPpm // ignore: cast_nullable_to_non_nullable
                      as double,
            durationSeconds: null == durationSeconds
                ? _value.durationSeconds
                : durationSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            completedAt: null == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completed: null == completed
                ? _value.completed
                : completed // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SessionRecordImplCopyWith<$Res>
    implements $SessionRecordCopyWith<$Res> {
  factory _$$SessionRecordImplCopyWith(
    _$SessionRecordImpl value,
    $Res Function(_$SessionRecordImpl) then,
  ) = __$$SessionRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    double volumeLiters,
    double currentMilliamps,
    double targetPpm,
    int durationSeconds,
    DateTime completedAt,
    bool completed,
  });
}

/// @nodoc
class __$$SessionRecordImplCopyWithImpl<$Res>
    extends _$SessionRecordCopyWithImpl<$Res, _$SessionRecordImpl>
    implements _$$SessionRecordImplCopyWith<$Res> {
  __$$SessionRecordImplCopyWithImpl(
    _$SessionRecordImpl _value,
    $Res Function(_$SessionRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SessionRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? volumeLiters = null,
    Object? currentMilliamps = null,
    Object? targetPpm = null,
    Object? durationSeconds = null,
    Object? completedAt = null,
    Object? completed = null,
  }) {
    return _then(
      _$SessionRecordImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        volumeLiters: null == volumeLiters
            ? _value.volumeLiters
            : volumeLiters // ignore: cast_nullable_to_non_nullable
                  as double,
        currentMilliamps: null == currentMilliamps
            ? _value.currentMilliamps
            : currentMilliamps // ignore: cast_nullable_to_non_nullable
                  as double,
        targetPpm: null == targetPpm
            ? _value.targetPpm
            : targetPpm // ignore: cast_nullable_to_non_nullable
                  as double,
        durationSeconds: null == durationSeconds
            ? _value.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        completedAt: null == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completed: null == completed
            ? _value.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionRecordImpl implements _SessionRecord {
  const _$SessionRecordImpl({
    required this.id,
    required this.volumeLiters,
    required this.currentMilliamps,
    required this.targetPpm,
    required this.durationSeconds,
    required this.completedAt,
    this.completed = false,
  });

  factory _$SessionRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionRecordImplFromJson(json);

  @override
  final int id;
  @override
  final double volumeLiters;
  @override
  final double currentMilliamps;
  @override
  final double targetPpm;
  @override
  final int durationSeconds;
  @override
  final DateTime completedAt;
  @override
  @JsonKey()
  final bool completed;

  @override
  String toString() {
    return 'SessionRecord(id: $id, volumeLiters: $volumeLiters, currentMilliamps: $currentMilliamps, targetPpm: $targetPpm, durationSeconds: $durationSeconds, completedAt: $completedAt, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.volumeLiters, volumeLiters) ||
                other.volumeLiters == volumeLiters) &&
            (identical(other.currentMilliamps, currentMilliamps) ||
                other.currentMilliamps == currentMilliamps) &&
            (identical(other.targetPpm, targetPpm) ||
                other.targetPpm == targetPpm) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    volumeLiters,
    currentMilliamps,
    targetPpm,
    durationSeconds,
    completedAt,
    completed,
  );

  /// Create a copy of SessionRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionRecordImplCopyWith<_$SessionRecordImpl> get copyWith =>
      __$$SessionRecordImplCopyWithImpl<_$SessionRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionRecordImplToJson(this);
  }
}

abstract class _SessionRecord implements SessionRecord {
  const factory _SessionRecord({
    required final int id,
    required final double volumeLiters,
    required final double currentMilliamps,
    required final double targetPpm,
    required final int durationSeconds,
    required final DateTime completedAt,
    final bool completed,
  }) = _$SessionRecordImpl;

  factory _SessionRecord.fromJson(Map<String, dynamic> json) =
      _$SessionRecordImpl.fromJson;

  @override
  int get id;
  @override
  double get volumeLiters;
  @override
  double get currentMilliamps;
  @override
  double get targetPpm;
  @override
  int get durationSeconds;
  @override
  DateTime get completedAt;
  @override
  bool get completed;

  /// Create a copy of SessionRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionRecordImplCopyWith<_$SessionRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
