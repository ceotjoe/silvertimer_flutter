// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalculatorInput {

 double get volumeValue; VolumeUnit get volumeUnit; double get currentMilliamps; double get targetPpm;
/// Create a copy of CalculatorInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculatorInputCopyWith<CalculatorInput> get copyWith => _$CalculatorInputCopyWithImpl<CalculatorInput>(this as CalculatorInput, _$identity);

  /// Serializes this CalculatorInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculatorInput&&(identical(other.volumeValue, volumeValue) || other.volumeValue == volumeValue)&&(identical(other.volumeUnit, volumeUnit) || other.volumeUnit == volumeUnit)&&(identical(other.currentMilliamps, currentMilliamps) || other.currentMilliamps == currentMilliamps)&&(identical(other.targetPpm, targetPpm) || other.targetPpm == targetPpm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,volumeValue,volumeUnit,currentMilliamps,targetPpm);

@override
String toString() {
  return 'CalculatorInput(volumeValue: $volumeValue, volumeUnit: $volumeUnit, currentMilliamps: $currentMilliamps, targetPpm: $targetPpm)';
}


}

/// @nodoc
abstract mixin class $CalculatorInputCopyWith<$Res>  {
  factory $CalculatorInputCopyWith(CalculatorInput value, $Res Function(CalculatorInput) _then) = _$CalculatorInputCopyWithImpl;
@useResult
$Res call({
 double volumeValue, VolumeUnit volumeUnit, double currentMilliamps, double targetPpm
});




}
/// @nodoc
class _$CalculatorInputCopyWithImpl<$Res>
    implements $CalculatorInputCopyWith<$Res> {
  _$CalculatorInputCopyWithImpl(this._self, this._then);

  final CalculatorInput _self;
  final $Res Function(CalculatorInput) _then;

/// Create a copy of CalculatorInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? volumeValue = null,Object? volumeUnit = null,Object? currentMilliamps = null,Object? targetPpm = null,}) {
  return _then(_self.copyWith(
volumeValue: null == volumeValue ? _self.volumeValue : volumeValue // ignore: cast_nullable_to_non_nullable
as double,volumeUnit: null == volumeUnit ? _self.volumeUnit : volumeUnit // ignore: cast_nullable_to_non_nullable
as VolumeUnit,currentMilliamps: null == currentMilliamps ? _self.currentMilliamps : currentMilliamps // ignore: cast_nullable_to_non_nullable
as double,targetPpm: null == targetPpm ? _self.targetPpm : targetPpm // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CalculatorInput].
extension CalculatorInputPatterns on CalculatorInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalculatorInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalculatorInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalculatorInput value)  $default,){
final _that = this;
switch (_that) {
case _CalculatorInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalculatorInput value)?  $default,){
final _that = this;
switch (_that) {
case _CalculatorInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double volumeValue,  VolumeUnit volumeUnit,  double currentMilliamps,  double targetPpm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculatorInput() when $default != null:
return $default(_that.volumeValue,_that.volumeUnit,_that.currentMilliamps,_that.targetPpm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double volumeValue,  VolumeUnit volumeUnit,  double currentMilliamps,  double targetPpm)  $default,) {final _that = this;
switch (_that) {
case _CalculatorInput():
return $default(_that.volumeValue,_that.volumeUnit,_that.currentMilliamps,_that.targetPpm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double volumeValue,  VolumeUnit volumeUnit,  double currentMilliamps,  double targetPpm)?  $default,) {final _that = this;
switch (_that) {
case _CalculatorInput() when $default != null:
return $default(_that.volumeValue,_that.volumeUnit,_that.currentMilliamps,_that.targetPpm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalculatorInput extends CalculatorInput {
  const _CalculatorInput({this.volumeValue = 500.0, this.volumeUnit = VolumeUnit.ml, this.currentMilliamps = 0.0, this.targetPpm = 25.0}): super._();
  factory _CalculatorInput.fromJson(Map<String, dynamic> json) => _$CalculatorInputFromJson(json);

@override@JsonKey() final  double volumeValue;
@override@JsonKey() final  VolumeUnit volumeUnit;
@override@JsonKey() final  double currentMilliamps;
@override@JsonKey() final  double targetPpm;

/// Create a copy of CalculatorInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculatorInputCopyWith<_CalculatorInput> get copyWith => __$CalculatorInputCopyWithImpl<_CalculatorInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalculatorInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculatorInput&&(identical(other.volumeValue, volumeValue) || other.volumeValue == volumeValue)&&(identical(other.volumeUnit, volumeUnit) || other.volumeUnit == volumeUnit)&&(identical(other.currentMilliamps, currentMilliamps) || other.currentMilliamps == currentMilliamps)&&(identical(other.targetPpm, targetPpm) || other.targetPpm == targetPpm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,volumeValue,volumeUnit,currentMilliamps,targetPpm);

@override
String toString() {
  return 'CalculatorInput(volumeValue: $volumeValue, volumeUnit: $volumeUnit, currentMilliamps: $currentMilliamps, targetPpm: $targetPpm)';
}


}

/// @nodoc
abstract mixin class _$CalculatorInputCopyWith<$Res> implements $CalculatorInputCopyWith<$Res> {
  factory _$CalculatorInputCopyWith(_CalculatorInput value, $Res Function(_CalculatorInput) _then) = __$CalculatorInputCopyWithImpl;
@override @useResult
$Res call({
 double volumeValue, VolumeUnit volumeUnit, double currentMilliamps, double targetPpm
});




}
/// @nodoc
class __$CalculatorInputCopyWithImpl<$Res>
    implements _$CalculatorInputCopyWith<$Res> {
  __$CalculatorInputCopyWithImpl(this._self, this._then);

  final _CalculatorInput _self;
  final $Res Function(_CalculatorInput) _then;

/// Create a copy of CalculatorInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? volumeValue = null,Object? volumeUnit = null,Object? currentMilliamps = null,Object? targetPpm = null,}) {
  return _then(_CalculatorInput(
volumeValue: null == volumeValue ? _self.volumeValue : volumeValue // ignore: cast_nullable_to_non_nullable
as double,volumeUnit: null == volumeUnit ? _self.volumeUnit : volumeUnit // ignore: cast_nullable_to_non_nullable
as VolumeUnit,currentMilliamps: null == currentMilliamps ? _self.currentMilliamps : currentMilliamps // ignore: cast_nullable_to_non_nullable
as double,targetPpm: null == targetPpm ? _self.targetPpm : targetPpm // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
