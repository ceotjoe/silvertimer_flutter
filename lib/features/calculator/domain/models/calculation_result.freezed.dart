// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CalculationResult _$CalculationResultFromJson(Map<String, dynamic> json) {
  return _CalculationResult.fromJson(json);
}

/// @nodoc
mixin _$CalculationResult {
  CalculatorInput get input => throw _privateConstructorUsedError;
  Duration get calculatedDuration => throw _privateConstructorUsedError;
  DateTime get calculatedAt => throw _privateConstructorUsedError;

  /// Serializes this CalculationResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalculationResultCopyWith<CalculationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculationResultCopyWith<$Res> {
  factory $CalculationResultCopyWith(
    CalculationResult value,
    $Res Function(CalculationResult) then,
  ) = _$CalculationResultCopyWithImpl<$Res, CalculationResult>;
  @useResult
  $Res call({
    CalculatorInput input,
    Duration calculatedDuration,
    DateTime calculatedAt,
  });

  $CalculatorInputCopyWith<$Res> get input;
}

/// @nodoc
class _$CalculationResultCopyWithImpl<$Res, $Val extends CalculationResult>
    implements $CalculationResultCopyWith<$Res> {
  _$CalculationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? calculatedDuration = null,
    Object? calculatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            input: null == input
                ? _value.input
                : input // ignore: cast_nullable_to_non_nullable
                      as CalculatorInput,
            calculatedDuration: null == calculatedDuration
                ? _value.calculatedDuration
                : calculatedDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            calculatedAt: null == calculatedAt
                ? _value.calculatedAt
                : calculatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalculatorInputCopyWith<$Res> get input {
    return $CalculatorInputCopyWith<$Res>(_value.input, (value) {
      return _then(_value.copyWith(input: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CalculationResultImplCopyWith<$Res>
    implements $CalculationResultCopyWith<$Res> {
  factory _$$CalculationResultImplCopyWith(
    _$CalculationResultImpl value,
    $Res Function(_$CalculationResultImpl) then,
  ) = __$$CalculationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CalculatorInput input,
    Duration calculatedDuration,
    DateTime calculatedAt,
  });

  @override
  $CalculatorInputCopyWith<$Res> get input;
}

/// @nodoc
class __$$CalculationResultImplCopyWithImpl<$Res>
    extends _$CalculationResultCopyWithImpl<$Res, _$CalculationResultImpl>
    implements _$$CalculationResultImplCopyWith<$Res> {
  __$$CalculationResultImplCopyWithImpl(
    _$CalculationResultImpl _value,
    $Res Function(_$CalculationResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? calculatedDuration = null,
    Object? calculatedAt = null,
  }) {
    return _then(
      _$CalculationResultImpl(
        input: null == input
            ? _value.input
            : input // ignore: cast_nullable_to_non_nullable
                  as CalculatorInput,
        calculatedDuration: null == calculatedDuration
            ? _value.calculatedDuration
            : calculatedDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        calculatedAt: null == calculatedAt
            ? _value.calculatedAt
            : calculatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CalculationResultImpl implements _CalculationResult {
  const _$CalculationResultImpl({
    required this.input,
    required this.calculatedDuration,
    required this.calculatedAt,
  });

  factory _$CalculationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalculationResultImplFromJson(json);

  @override
  final CalculatorInput input;
  @override
  final Duration calculatedDuration;
  @override
  final DateTime calculatedAt;

  @override
  String toString() {
    return 'CalculationResult(input: $input, calculatedDuration: $calculatedDuration, calculatedAt: $calculatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculationResultImpl &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.calculatedDuration, calculatedDuration) ||
                other.calculatedDuration == calculatedDuration) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, input, calculatedDuration, calculatedAt);

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculationResultImplCopyWith<_$CalculationResultImpl> get copyWith =>
      __$$CalculationResultImplCopyWithImpl<_$CalculationResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CalculationResultImplToJson(this);
  }
}

abstract class _CalculationResult implements CalculationResult {
  const factory _CalculationResult({
    required final CalculatorInput input,
    required final Duration calculatedDuration,
    required final DateTime calculatedAt,
  }) = _$CalculationResultImpl;

  factory _CalculationResult.fromJson(Map<String, dynamic> json) =
      _$CalculationResultImpl.fromJson;

  @override
  CalculatorInput get input;
  @override
  Duration get calculatedDuration;
  @override
  DateTime get calculatedAt;

  /// Create a copy of CalculationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculationResultImplCopyWith<_$CalculationResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
