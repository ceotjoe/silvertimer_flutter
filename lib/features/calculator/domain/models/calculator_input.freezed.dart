// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CalculatorInput _$CalculatorInputFromJson(Map<String, dynamic> json) {
  return _CalculatorInput.fromJson(json);
}

/// @nodoc
mixin _$CalculatorInput {
  double get volumeValue => throw _privateConstructorUsedError;
  VolumeUnit get volumeUnit => throw _privateConstructorUsedError;
  double get currentMilliamps => throw _privateConstructorUsedError;
  double get targetPpm => throw _privateConstructorUsedError;

  /// Serializes this CalculatorInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalculatorInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalculatorInputCopyWith<CalculatorInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatorInputCopyWith<$Res> {
  factory $CalculatorInputCopyWith(
    CalculatorInput value,
    $Res Function(CalculatorInput) then,
  ) = _$CalculatorInputCopyWithImpl<$Res, CalculatorInput>;
  @useResult
  $Res call({
    double volumeValue,
    VolumeUnit volumeUnit,
    double currentMilliamps,
    double targetPpm,
  });
}

/// @nodoc
class _$CalculatorInputCopyWithImpl<$Res, $Val extends CalculatorInput>
    implements $CalculatorInputCopyWith<$Res> {
  _$CalculatorInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalculatorInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? volumeValue = null,
    Object? volumeUnit = null,
    Object? currentMilliamps = null,
    Object? targetPpm = null,
  }) {
    return _then(
      _value.copyWith(
            volumeValue: null == volumeValue
                ? _value.volumeValue
                : volumeValue // ignore: cast_nullable_to_non_nullable
                      as double,
            volumeUnit: null == volumeUnit
                ? _value.volumeUnit
                : volumeUnit // ignore: cast_nullable_to_non_nullable
                      as VolumeUnit,
            currentMilliamps: null == currentMilliamps
                ? _value.currentMilliamps
                : currentMilliamps // ignore: cast_nullable_to_non_nullable
                      as double,
            targetPpm: null == targetPpm
                ? _value.targetPpm
                : targetPpm // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CalculatorInputImplCopyWith<$Res>
    implements $CalculatorInputCopyWith<$Res> {
  factory _$$CalculatorInputImplCopyWith(
    _$CalculatorInputImpl value,
    $Res Function(_$CalculatorInputImpl) then,
  ) = __$$CalculatorInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double volumeValue,
    VolumeUnit volumeUnit,
    double currentMilliamps,
    double targetPpm,
  });
}

/// @nodoc
class __$$CalculatorInputImplCopyWithImpl<$Res>
    extends _$CalculatorInputCopyWithImpl<$Res, _$CalculatorInputImpl>
    implements _$$CalculatorInputImplCopyWith<$Res> {
  __$$CalculatorInputImplCopyWithImpl(
    _$CalculatorInputImpl _value,
    $Res Function(_$CalculatorInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CalculatorInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? volumeValue = null,
    Object? volumeUnit = null,
    Object? currentMilliamps = null,
    Object? targetPpm = null,
  }) {
    return _then(
      _$CalculatorInputImpl(
        volumeValue: null == volumeValue
            ? _value.volumeValue
            : volumeValue // ignore: cast_nullable_to_non_nullable
                  as double,
        volumeUnit: null == volumeUnit
            ? _value.volumeUnit
            : volumeUnit // ignore: cast_nullable_to_non_nullable
                  as VolumeUnit,
        currentMilliamps: null == currentMilliamps
            ? _value.currentMilliamps
            : currentMilliamps // ignore: cast_nullable_to_non_nullable
                  as double,
        targetPpm: null == targetPpm
            ? _value.targetPpm
            : targetPpm // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CalculatorInputImpl extends _CalculatorInput {
  const _$CalculatorInputImpl({
    this.volumeValue = 0.0,
    this.volumeUnit = VolumeUnit.ml,
    this.currentMilliamps = 0.0,
    this.targetPpm = 10.0,
  }) : super._();

  factory _$CalculatorInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalculatorInputImplFromJson(json);

  @override
  @JsonKey()
  final double volumeValue;
  @override
  @JsonKey()
  final VolumeUnit volumeUnit;
  @override
  @JsonKey()
  final double currentMilliamps;
  @override
  @JsonKey()
  final double targetPpm;

  @override
  String toString() {
    return 'CalculatorInput(volumeValue: $volumeValue, volumeUnit: $volumeUnit, currentMilliamps: $currentMilliamps, targetPpm: $targetPpm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculatorInputImpl &&
            (identical(other.volumeValue, volumeValue) ||
                other.volumeValue == volumeValue) &&
            (identical(other.volumeUnit, volumeUnit) ||
                other.volumeUnit == volumeUnit) &&
            (identical(other.currentMilliamps, currentMilliamps) ||
                other.currentMilliamps == currentMilliamps) &&
            (identical(other.targetPpm, targetPpm) ||
                other.targetPpm == targetPpm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    volumeValue,
    volumeUnit,
    currentMilliamps,
    targetPpm,
  );

  /// Create a copy of CalculatorInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculatorInputImplCopyWith<_$CalculatorInputImpl> get copyWith =>
      __$$CalculatorInputImplCopyWithImpl<_$CalculatorInputImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CalculatorInputImplToJson(this);
  }
}

abstract class _CalculatorInput extends CalculatorInput {
  const factory _CalculatorInput({
    final double volumeValue,
    final VolumeUnit volumeUnit,
    final double currentMilliamps,
    final double targetPpm,
  }) = _$CalculatorInputImpl;
  const _CalculatorInput._() : super._();

  factory _CalculatorInput.fromJson(Map<String, dynamic> json) =
      _$CalculatorInputImpl.fromJson;

  @override
  double get volumeValue;
  @override
  VolumeUnit get volumeUnit;
  @override
  double get currentMilliamps;
  @override
  double get targetPpm;

  /// Create a copy of CalculatorInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculatorInputImplCopyWith<_$CalculatorInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
