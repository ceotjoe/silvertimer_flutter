// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppSettings {
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  VolumeUnit get defaultVolumeUnit => throw _privateConstructorUsedError;
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  double get defaultPpm => throw _privateConstructorUsedError;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
    AppSettings value,
    $Res Function(AppSettings) then,
  ) = _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call({
    ThemeMode themeMode,
    VolumeUnit defaultVolumeUnit,
    bool notificationsEnabled,
    double defaultPpm,
  });
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? defaultVolumeUnit = null,
    Object? notificationsEnabled = null,
    Object? defaultPpm = null,
  }) {
    return _then(
      _value.copyWith(
            themeMode: null == themeMode
                ? _value.themeMode
                : themeMode // ignore: cast_nullable_to_non_nullable
                      as ThemeMode,
            defaultVolumeUnit: null == defaultVolumeUnit
                ? _value.defaultVolumeUnit
                : defaultVolumeUnit // ignore: cast_nullable_to_non_nullable
                      as VolumeUnit,
            notificationsEnabled: null == notificationsEnabled
                ? _value.notificationsEnabled
                : notificationsEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            defaultPpm: null == defaultPpm
                ? _value.defaultPpm
                : defaultPpm // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppSettingsImplCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$AppSettingsImplCopyWith(
    _$AppSettingsImpl value,
    $Res Function(_$AppSettingsImpl) then,
  ) = __$$AppSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ThemeMode themeMode,
    VolumeUnit defaultVolumeUnit,
    bool notificationsEnabled,
    double defaultPpm,
  });
}

/// @nodoc
class __$$AppSettingsImplCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$AppSettingsImpl>
    implements _$$AppSettingsImplCopyWith<$Res> {
  __$$AppSettingsImplCopyWithImpl(
    _$AppSettingsImpl _value,
    $Res Function(_$AppSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? defaultVolumeUnit = null,
    Object? notificationsEnabled = null,
    Object? defaultPpm = null,
  }) {
    return _then(
      _$AppSettingsImpl(
        themeMode: null == themeMode
            ? _value.themeMode
            : themeMode // ignore: cast_nullable_to_non_nullable
                  as ThemeMode,
        defaultVolumeUnit: null == defaultVolumeUnit
            ? _value.defaultVolumeUnit
            : defaultVolumeUnit // ignore: cast_nullable_to_non_nullable
                  as VolumeUnit,
        notificationsEnabled: null == notificationsEnabled
            ? _value.notificationsEnabled
            : notificationsEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        defaultPpm: null == defaultPpm
            ? _value.defaultPpm
            : defaultPpm // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$AppSettingsImpl implements _AppSettings {
  const _$AppSettingsImpl({
    this.themeMode = ThemeMode.system,
    this.defaultVolumeUnit = VolumeUnit.ml,
    this.notificationsEnabled = true,
    this.defaultPpm = 10.0,
  });

  @override
  @JsonKey()
  final ThemeMode themeMode;
  @override
  @JsonKey()
  final VolumeUnit defaultVolumeUnit;
  @override
  @JsonKey()
  final bool notificationsEnabled;
  @override
  @JsonKey()
  final double defaultPpm;

  @override
  String toString() {
    return 'AppSettings(themeMode: $themeMode, defaultVolumeUnit: $defaultVolumeUnit, notificationsEnabled: $notificationsEnabled, defaultPpm: $defaultPpm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.defaultVolumeUnit, defaultVolumeUnit) ||
                other.defaultVolumeUnit == defaultVolumeUnit) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(other.defaultPpm, defaultPpm) ||
                other.defaultPpm == defaultPpm));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    themeMode,
    defaultVolumeUnit,
    notificationsEnabled,
    defaultPpm,
  );

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      __$$AppSettingsImplCopyWithImpl<_$AppSettingsImpl>(this, _$identity);
}

abstract class _AppSettings implements AppSettings {
  const factory _AppSettings({
    final ThemeMode themeMode,
    final VolumeUnit defaultVolumeUnit,
    final bool notificationsEnabled,
    final double defaultPpm,
  }) = _$AppSettingsImpl;

  @override
  ThemeMode get themeMode;
  @override
  VolumeUnit get defaultVolumeUnit;
  @override
  bool get notificationsEnabled;
  @override
  double get defaultPpm;

  /// Create a copy of AppSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
