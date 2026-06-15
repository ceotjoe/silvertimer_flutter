// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionRecord {

 int get id; double get volumeLiters; double get currentMilliamps; double get targetPpm; int get durationSeconds; DateTime get completedAt; bool get completed;
/// Create a copy of SessionRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionRecordCopyWith<SessionRecord> get copyWith => _$SessionRecordCopyWithImpl<SessionRecord>(this as SessionRecord, _$identity);

  /// Serializes this SessionRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.volumeLiters, volumeLiters) || other.volumeLiters == volumeLiters)&&(identical(other.currentMilliamps, currentMilliamps) || other.currentMilliamps == currentMilliamps)&&(identical(other.targetPpm, targetPpm) || other.targetPpm == targetPpm)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,volumeLiters,currentMilliamps,targetPpm,durationSeconds,completedAt,completed);

@override
String toString() {
  return 'SessionRecord(id: $id, volumeLiters: $volumeLiters, currentMilliamps: $currentMilliamps, targetPpm: $targetPpm, durationSeconds: $durationSeconds, completedAt: $completedAt, completed: $completed)';
}


}

/// @nodoc
abstract mixin class $SessionRecordCopyWith<$Res>  {
  factory $SessionRecordCopyWith(SessionRecord value, $Res Function(SessionRecord) _then) = _$SessionRecordCopyWithImpl;
@useResult
$Res call({
 int id, double volumeLiters, double currentMilliamps, double targetPpm, int durationSeconds, DateTime completedAt, bool completed
});




}
/// @nodoc
class _$SessionRecordCopyWithImpl<$Res>
    implements $SessionRecordCopyWith<$Res> {
  _$SessionRecordCopyWithImpl(this._self, this._then);

  final SessionRecord _self;
  final $Res Function(SessionRecord) _then;

/// Create a copy of SessionRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? volumeLiters = null,Object? currentMilliamps = null,Object? targetPpm = null,Object? durationSeconds = null,Object? completedAt = null,Object? completed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,volumeLiters: null == volumeLiters ? _self.volumeLiters : volumeLiters // ignore: cast_nullable_to_non_nullable
as double,currentMilliamps: null == currentMilliamps ? _self.currentMilliamps : currentMilliamps // ignore: cast_nullable_to_non_nullable
as double,targetPpm: null == targetPpm ? _self.targetPpm : targetPpm // ignore: cast_nullable_to_non_nullable
as double,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionRecord].
extension SessionRecordPatterns on SessionRecord {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionRecord() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionRecord value)  $default,){
final _that = this;
switch (_that) {
case _SessionRecord():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionRecord value)?  $default,){
final _that = this;
switch (_that) {
case _SessionRecord() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  double volumeLiters,  double currentMilliamps,  double targetPpm,  int durationSeconds,  DateTime completedAt,  bool completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionRecord() when $default != null:
return $default(_that.id,_that.volumeLiters,_that.currentMilliamps,_that.targetPpm,_that.durationSeconds,_that.completedAt,_that.completed);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  double volumeLiters,  double currentMilliamps,  double targetPpm,  int durationSeconds,  DateTime completedAt,  bool completed)  $default,) {final _that = this;
switch (_that) {
case _SessionRecord():
return $default(_that.id,_that.volumeLiters,_that.currentMilliamps,_that.targetPpm,_that.durationSeconds,_that.completedAt,_that.completed);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  double volumeLiters,  double currentMilliamps,  double targetPpm,  int durationSeconds,  DateTime completedAt,  bool completed)?  $default,) {final _that = this;
switch (_that) {
case _SessionRecord() when $default != null:
return $default(_that.id,_that.volumeLiters,_that.currentMilliamps,_that.targetPpm,_that.durationSeconds,_that.completedAt,_that.completed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionRecord implements SessionRecord {
  const _SessionRecord({required this.id, required this.volumeLiters, required this.currentMilliamps, required this.targetPpm, required this.durationSeconds, required this.completedAt, this.completed = false});
  factory _SessionRecord.fromJson(Map<String, dynamic> json) => _$SessionRecordFromJson(json);

@override final  int id;
@override final  double volumeLiters;
@override final  double currentMilliamps;
@override final  double targetPpm;
@override final  int durationSeconds;
@override final  DateTime completedAt;
@override@JsonKey() final  bool completed;

/// Create a copy of SessionRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionRecordCopyWith<_SessionRecord> get copyWith => __$SessionRecordCopyWithImpl<_SessionRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.volumeLiters, volumeLiters) || other.volumeLiters == volumeLiters)&&(identical(other.currentMilliamps, currentMilliamps) || other.currentMilliamps == currentMilliamps)&&(identical(other.targetPpm, targetPpm) || other.targetPpm == targetPpm)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,volumeLiters,currentMilliamps,targetPpm,durationSeconds,completedAt,completed);

@override
String toString() {
  return 'SessionRecord(id: $id, volumeLiters: $volumeLiters, currentMilliamps: $currentMilliamps, targetPpm: $targetPpm, durationSeconds: $durationSeconds, completedAt: $completedAt, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$SessionRecordCopyWith<$Res> implements $SessionRecordCopyWith<$Res> {
  factory _$SessionRecordCopyWith(_SessionRecord value, $Res Function(_SessionRecord) _then) = __$SessionRecordCopyWithImpl;
@override @useResult
$Res call({
 int id, double volumeLiters, double currentMilliamps, double targetPpm, int durationSeconds, DateTime completedAt, bool completed
});




}
/// @nodoc
class __$SessionRecordCopyWithImpl<$Res>
    implements _$SessionRecordCopyWith<$Res> {
  __$SessionRecordCopyWithImpl(this._self, this._then);

  final _SessionRecord _self;
  final $Res Function(_SessionRecord) _then;

/// Create a copy of SessionRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? volumeLiters = null,Object? currentMilliamps = null,Object? targetPpm = null,Object? durationSeconds = null,Object? completedAt = null,Object? completed = null,}) {
  return _then(_SessionRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,volumeLiters: null == volumeLiters ? _self.volumeLiters : volumeLiters // ignore: cast_nullable_to_non_nullable
as double,currentMilliamps: null == currentMilliamps ? _self.currentMilliamps : currentMilliamps // ignore: cast_nullable_to_non_nullable
as double,targetPpm: null == targetPpm ? _self.targetPpm : targetPpm // ignore: cast_nullable_to_non_nullable
as double,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
