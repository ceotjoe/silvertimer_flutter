// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimerState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimerState()';
}


}

/// @nodoc
class $TimerStateCopyWith<$Res>  {
$TimerStateCopyWith(TimerState _, $Res Function(TimerState) __);
}


/// Adds pattern-matching-related methods to [TimerState].
extension TimerStatePatterns on TimerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TimerIdle value)?  idle,TResult Function( TimerRunning value)?  running,TResult Function( TimerPaused value)?  paused,TResult Function( TimerCompleted value)?  completed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TimerIdle() when idle != null:
return idle(_that);case TimerRunning() when running != null:
return running(_that);case TimerPaused() when paused != null:
return paused(_that);case TimerCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TimerIdle value)  idle,required TResult Function( TimerRunning value)  running,required TResult Function( TimerPaused value)  paused,required TResult Function( TimerCompleted value)  completed,}){
final _that = this;
switch (_that) {
case TimerIdle():
return idle(_that);case TimerRunning():
return running(_that);case TimerPaused():
return paused(_that);case TimerCompleted():
return completed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TimerIdle value)?  idle,TResult? Function( TimerRunning value)?  running,TResult? Function( TimerPaused value)?  paused,TResult? Function( TimerCompleted value)?  completed,}){
final _that = this;
switch (_that) {
case TimerIdle() when idle != null:
return idle(_that);case TimerRunning() when running != null:
return running(_that);case TimerPaused() when paused != null:
return paused(_that);case TimerCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( Duration totalDuration,  Duration elapsed,  DateTime startedAt)?  running,TResult Function( Duration totalDuration,  Duration elapsed)?  paused,TResult Function( Duration totalDuration)?  completed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TimerIdle() when idle != null:
return idle();case TimerRunning() when running != null:
return running(_that.totalDuration,_that.elapsed,_that.startedAt);case TimerPaused() when paused != null:
return paused(_that.totalDuration,_that.elapsed);case TimerCompleted() when completed != null:
return completed(_that.totalDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( Duration totalDuration,  Duration elapsed,  DateTime startedAt)  running,required TResult Function( Duration totalDuration,  Duration elapsed)  paused,required TResult Function( Duration totalDuration)  completed,}) {final _that = this;
switch (_that) {
case TimerIdle():
return idle();case TimerRunning():
return running(_that.totalDuration,_that.elapsed,_that.startedAt);case TimerPaused():
return paused(_that.totalDuration,_that.elapsed);case TimerCompleted():
return completed(_that.totalDuration);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( Duration totalDuration,  Duration elapsed,  DateTime startedAt)?  running,TResult? Function( Duration totalDuration,  Duration elapsed)?  paused,TResult? Function( Duration totalDuration)?  completed,}) {final _that = this;
switch (_that) {
case TimerIdle() when idle != null:
return idle();case TimerRunning() when running != null:
return running(_that.totalDuration,_that.elapsed,_that.startedAt);case TimerPaused() when paused != null:
return paused(_that.totalDuration,_that.elapsed);case TimerCompleted() when completed != null:
return completed(_that.totalDuration);case _:
  return null;

}
}

}

/// @nodoc


class TimerIdle implements TimerState {
  const TimerIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimerState.idle()';
}


}




/// @nodoc


class TimerRunning implements TimerState {
  const TimerRunning({required this.totalDuration, required this.elapsed, required this.startedAt});
  

 final  Duration totalDuration;
 final  Duration elapsed;
 final  DateTime startedAt;

/// Create a copy of TimerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerRunningCopyWith<TimerRunning> get copyWith => _$TimerRunningCopyWithImpl<TimerRunning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerRunning&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt));
}


@override
int get hashCode => Object.hash(runtimeType,totalDuration,elapsed,startedAt);

@override
String toString() {
  return 'TimerState.running(totalDuration: $totalDuration, elapsed: $elapsed, startedAt: $startedAt)';
}


}

/// @nodoc
abstract mixin class $TimerRunningCopyWith<$Res> implements $TimerStateCopyWith<$Res> {
  factory $TimerRunningCopyWith(TimerRunning value, $Res Function(TimerRunning) _then) = _$TimerRunningCopyWithImpl;
@useResult
$Res call({
 Duration totalDuration, Duration elapsed, DateTime startedAt
});




}
/// @nodoc
class _$TimerRunningCopyWithImpl<$Res>
    implements $TimerRunningCopyWith<$Res> {
  _$TimerRunningCopyWithImpl(this._self, this._then);

  final TimerRunning _self;
  final $Res Function(TimerRunning) _then;

/// Create a copy of TimerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? totalDuration = null,Object? elapsed = null,Object? startedAt = null,}) {
  return _then(TimerRunning(
totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as Duration,elapsed: null == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as Duration,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class TimerPaused implements TimerState {
  const TimerPaused({required this.totalDuration, required this.elapsed});
  

 final  Duration totalDuration;
 final  Duration elapsed;

/// Create a copy of TimerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerPausedCopyWith<TimerPaused> get copyWith => _$TimerPausedCopyWithImpl<TimerPaused>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerPaused&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed));
}


@override
int get hashCode => Object.hash(runtimeType,totalDuration,elapsed);

@override
String toString() {
  return 'TimerState.paused(totalDuration: $totalDuration, elapsed: $elapsed)';
}


}

/// @nodoc
abstract mixin class $TimerPausedCopyWith<$Res> implements $TimerStateCopyWith<$Res> {
  factory $TimerPausedCopyWith(TimerPaused value, $Res Function(TimerPaused) _then) = _$TimerPausedCopyWithImpl;
@useResult
$Res call({
 Duration totalDuration, Duration elapsed
});




}
/// @nodoc
class _$TimerPausedCopyWithImpl<$Res>
    implements $TimerPausedCopyWith<$Res> {
  _$TimerPausedCopyWithImpl(this._self, this._then);

  final TimerPaused _self;
  final $Res Function(TimerPaused) _then;

/// Create a copy of TimerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? totalDuration = null,Object? elapsed = null,}) {
  return _then(TimerPaused(
totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as Duration,elapsed: null == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class TimerCompleted implements TimerState {
  const TimerCompleted({required this.totalDuration});
  

 final  Duration totalDuration;

/// Create a copy of TimerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerCompletedCopyWith<TimerCompleted> get copyWith => _$TimerCompletedCopyWithImpl<TimerCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerCompleted&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration));
}


@override
int get hashCode => Object.hash(runtimeType,totalDuration);

@override
String toString() {
  return 'TimerState.completed(totalDuration: $totalDuration)';
}


}

/// @nodoc
abstract mixin class $TimerCompletedCopyWith<$Res> implements $TimerStateCopyWith<$Res> {
  factory $TimerCompletedCopyWith(TimerCompleted value, $Res Function(TimerCompleted) _then) = _$TimerCompletedCopyWithImpl;
@useResult
$Res call({
 Duration totalDuration
});




}
/// @nodoc
class _$TimerCompletedCopyWithImpl<$Res>
    implements $TimerCompletedCopyWith<$Res> {
  _$TimerCompletedCopyWithImpl(this._self, this._then);

  final TimerCompleted _self;
  final $Res Function(TimerCompleted) _then;

/// Create a copy of TimerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? totalDuration = null,}) {
  return _then(TimerCompleted(
totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
