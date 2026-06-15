// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalculationResult {

 CalculatorInput get input; Duration get calculatedDuration; DateTime get calculatedAt;
/// Create a copy of CalculationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculationResultCopyWith<CalculationResult> get copyWith => _$CalculationResultCopyWithImpl<CalculationResult>(this as CalculationResult, _$identity);

  /// Serializes this CalculationResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculationResult&&(identical(other.input, input) || other.input == input)&&(identical(other.calculatedDuration, calculatedDuration) || other.calculatedDuration == calculatedDuration)&&(identical(other.calculatedAt, calculatedAt) || other.calculatedAt == calculatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,input,calculatedDuration,calculatedAt);

@override
String toString() {
  return 'CalculationResult(input: $input, calculatedDuration: $calculatedDuration, calculatedAt: $calculatedAt)';
}


}

/// @nodoc
abstract mixin class $CalculationResultCopyWith<$Res>  {
  factory $CalculationResultCopyWith(CalculationResult value, $Res Function(CalculationResult) _then) = _$CalculationResultCopyWithImpl;
@useResult
$Res call({
 CalculatorInput input, Duration calculatedDuration, DateTime calculatedAt
});


$CalculatorInputCopyWith<$Res> get input;

}
/// @nodoc
class _$CalculationResultCopyWithImpl<$Res>
    implements $CalculationResultCopyWith<$Res> {
  _$CalculationResultCopyWithImpl(this._self, this._then);

  final CalculationResult _self;
  final $Res Function(CalculationResult) _then;

/// Create a copy of CalculationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? input = null,Object? calculatedDuration = null,Object? calculatedAt = null,}) {
  return _then(_self.copyWith(
input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as CalculatorInput,calculatedDuration: null == calculatedDuration ? _self.calculatedDuration : calculatedDuration // ignore: cast_nullable_to_non_nullable
as Duration,calculatedAt: null == calculatedAt ? _self.calculatedAt : calculatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of CalculationResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalculatorInputCopyWith<$Res> get input {
  
  return $CalculatorInputCopyWith<$Res>(_self.input, (value) {
    return _then(_self.copyWith(input: value));
  });
}
}


/// Adds pattern-matching-related methods to [CalculationResult].
extension CalculationResultPatterns on CalculationResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalculationResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalculationResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalculationResult value)  $default,){
final _that = this;
switch (_that) {
case _CalculationResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalculationResult value)?  $default,){
final _that = this;
switch (_that) {
case _CalculationResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CalculatorInput input,  Duration calculatedDuration,  DateTime calculatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculationResult() when $default != null:
return $default(_that.input,_that.calculatedDuration,_that.calculatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CalculatorInput input,  Duration calculatedDuration,  DateTime calculatedAt)  $default,) {final _that = this;
switch (_that) {
case _CalculationResult():
return $default(_that.input,_that.calculatedDuration,_that.calculatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CalculatorInput input,  Duration calculatedDuration,  DateTime calculatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CalculationResult() when $default != null:
return $default(_that.input,_that.calculatedDuration,_that.calculatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalculationResult implements CalculationResult {
  const _CalculationResult({required this.input, required this.calculatedDuration, required this.calculatedAt});
  factory _CalculationResult.fromJson(Map<String, dynamic> json) => _$CalculationResultFromJson(json);

@override final  CalculatorInput input;
@override final  Duration calculatedDuration;
@override final  DateTime calculatedAt;

/// Create a copy of CalculationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculationResultCopyWith<_CalculationResult> get copyWith => __$CalculationResultCopyWithImpl<_CalculationResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalculationResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculationResult&&(identical(other.input, input) || other.input == input)&&(identical(other.calculatedDuration, calculatedDuration) || other.calculatedDuration == calculatedDuration)&&(identical(other.calculatedAt, calculatedAt) || other.calculatedAt == calculatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,input,calculatedDuration,calculatedAt);

@override
String toString() {
  return 'CalculationResult(input: $input, calculatedDuration: $calculatedDuration, calculatedAt: $calculatedAt)';
}


}

/// @nodoc
abstract mixin class _$CalculationResultCopyWith<$Res> implements $CalculationResultCopyWith<$Res> {
  factory _$CalculationResultCopyWith(_CalculationResult value, $Res Function(_CalculationResult) _then) = __$CalculationResultCopyWithImpl;
@override @useResult
$Res call({
 CalculatorInput input, Duration calculatedDuration, DateTime calculatedAt
});


@override $CalculatorInputCopyWith<$Res> get input;

}
/// @nodoc
class __$CalculationResultCopyWithImpl<$Res>
    implements _$CalculationResultCopyWith<$Res> {
  __$CalculationResultCopyWithImpl(this._self, this._then);

  final _CalculationResult _self;
  final $Res Function(_CalculationResult) _then;

/// Create a copy of CalculationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? input = null,Object? calculatedDuration = null,Object? calculatedAt = null,}) {
  return _then(_CalculationResult(
input: null == input ? _self.input : input // ignore: cast_nullable_to_non_nullable
as CalculatorInput,calculatedDuration: null == calculatedDuration ? _self.calculatedDuration : calculatedDuration // ignore: cast_nullable_to_non_nullable
as Duration,calculatedAt: null == calculatedAt ? _self.calculatedAt : calculatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of CalculationResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalculatorInputCopyWith<$Res> get input {
  
  return $CalculatorInputCopyWith<$Res>(_self.input, (value) {
    return _then(_self.copyWith(input: value));
  });
}
}

// dart format on
