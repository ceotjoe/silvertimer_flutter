// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppSettings {

 ThemeMode get themeMode; VolumeUnit get defaultVolumeUnit; bool get notificationsEnabled; double get defaultPpm; double get defaultCurrentMa; bool get cleaningAlarmsEnabled; int get cleaningIntervalMinutes;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.defaultVolumeUnit, defaultVolumeUnit) || other.defaultVolumeUnit == defaultVolumeUnit)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.defaultPpm, defaultPpm) || other.defaultPpm == defaultPpm)&&(identical(other.defaultCurrentMa, defaultCurrentMa) || other.defaultCurrentMa == defaultCurrentMa)&&(identical(other.cleaningAlarmsEnabled, cleaningAlarmsEnabled) || other.cleaningAlarmsEnabled == cleaningAlarmsEnabled)&&(identical(other.cleaningIntervalMinutes, cleaningIntervalMinutes) || other.cleaningIntervalMinutes == cleaningIntervalMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode,defaultVolumeUnit,notificationsEnabled,defaultPpm,defaultCurrentMa,cleaningAlarmsEnabled,cleaningIntervalMinutes);

@override
String toString() {
  return 'AppSettings(themeMode: $themeMode, defaultVolumeUnit: $defaultVolumeUnit, notificationsEnabled: $notificationsEnabled, defaultPpm: $defaultPpm, defaultCurrentMa: $defaultCurrentMa, cleaningAlarmsEnabled: $cleaningAlarmsEnabled, cleaningIntervalMinutes: $cleaningIntervalMinutes)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode, VolumeUnit defaultVolumeUnit, bool notificationsEnabled, double defaultPpm, double defaultCurrentMa, bool cleaningAlarmsEnabled, int cleaningIntervalMinutes
});




}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? defaultVolumeUnit = null,Object? notificationsEnabled = null,Object? defaultPpm = null,Object? defaultCurrentMa = null,Object? cleaningAlarmsEnabled = null,Object? cleaningIntervalMinutes = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,defaultVolumeUnit: null == defaultVolumeUnit ? _self.defaultVolumeUnit : defaultVolumeUnit // ignore: cast_nullable_to_non_nullable
as VolumeUnit,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,defaultPpm: null == defaultPpm ? _self.defaultPpm : defaultPpm // ignore: cast_nullable_to_non_nullable
as double,defaultCurrentMa: null == defaultCurrentMa ? _self.defaultCurrentMa : defaultCurrentMa // ignore: cast_nullable_to_non_nullable
as double,cleaningAlarmsEnabled: null == cleaningAlarmsEnabled ? _self.cleaningAlarmsEnabled : cleaningAlarmsEnabled // ignore: cast_nullable_to_non_nullable
as bool,cleaningIntervalMinutes: null == cleaningIntervalMinutes ? _self.cleaningIntervalMinutes : cleaningIntervalMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode themeMode,  VolumeUnit defaultVolumeUnit,  bool notificationsEnabled,  double defaultPpm,  double defaultCurrentMa,  bool cleaningAlarmsEnabled,  int cleaningIntervalMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.themeMode,_that.defaultVolumeUnit,_that.notificationsEnabled,_that.defaultPpm,_that.defaultCurrentMa,_that.cleaningAlarmsEnabled,_that.cleaningIntervalMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode themeMode,  VolumeUnit defaultVolumeUnit,  bool notificationsEnabled,  double defaultPpm,  double defaultCurrentMa,  bool cleaningAlarmsEnabled,  int cleaningIntervalMinutes)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.themeMode,_that.defaultVolumeUnit,_that.notificationsEnabled,_that.defaultPpm,_that.defaultCurrentMa,_that.cleaningAlarmsEnabled,_that.cleaningIntervalMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode themeMode,  VolumeUnit defaultVolumeUnit,  bool notificationsEnabled,  double defaultPpm,  double defaultCurrentMa,  bool cleaningAlarmsEnabled,  int cleaningIntervalMinutes)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.themeMode,_that.defaultVolumeUnit,_that.notificationsEnabled,_that.defaultPpm,_that.defaultCurrentMa,_that.cleaningAlarmsEnabled,_that.cleaningIntervalMinutes);case _:
  return null;

}
}

}

/// @nodoc


class _AppSettings implements AppSettings {
  const _AppSettings({this.themeMode = ThemeMode.system, this.defaultVolumeUnit = VolumeUnit.ml, this.notificationsEnabled = true, this.defaultPpm = 25.0, this.defaultCurrentMa = 10.0, this.cleaningAlarmsEnabled = true, this.cleaningIntervalMinutes = 10});
  

@override@JsonKey() final  ThemeMode themeMode;
@override@JsonKey() final  VolumeUnit defaultVolumeUnit;
@override@JsonKey() final  bool notificationsEnabled;
@override@JsonKey() final  double defaultPpm;
@override@JsonKey() final  double defaultCurrentMa;
@override@JsonKey() final  bool cleaningAlarmsEnabled;
@override@JsonKey() final  int cleaningIntervalMinutes;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.defaultVolumeUnit, defaultVolumeUnit) || other.defaultVolumeUnit == defaultVolumeUnit)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.defaultPpm, defaultPpm) || other.defaultPpm == defaultPpm)&&(identical(other.defaultCurrentMa, defaultCurrentMa) || other.defaultCurrentMa == defaultCurrentMa)&&(identical(other.cleaningAlarmsEnabled, cleaningAlarmsEnabled) || other.cleaningAlarmsEnabled == cleaningAlarmsEnabled)&&(identical(other.cleaningIntervalMinutes, cleaningIntervalMinutes) || other.cleaningIntervalMinutes == cleaningIntervalMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode,defaultVolumeUnit,notificationsEnabled,defaultPpm,defaultCurrentMa,cleaningAlarmsEnabled,cleaningIntervalMinutes);

@override
String toString() {
  return 'AppSettings(themeMode: $themeMode, defaultVolumeUnit: $defaultVolumeUnit, notificationsEnabled: $notificationsEnabled, defaultPpm: $defaultPpm, defaultCurrentMa: $defaultCurrentMa, cleaningAlarmsEnabled: $cleaningAlarmsEnabled, cleaningIntervalMinutes: $cleaningIntervalMinutes)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode themeMode, VolumeUnit defaultVolumeUnit, bool notificationsEnabled, double defaultPpm, double defaultCurrentMa, bool cleaningAlarmsEnabled, int cleaningIntervalMinutes
});




}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? defaultVolumeUnit = null,Object? notificationsEnabled = null,Object? defaultPpm = null,Object? defaultCurrentMa = null,Object? cleaningAlarmsEnabled = null,Object? cleaningIntervalMinutes = null,}) {
  return _then(_AppSettings(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,defaultVolumeUnit: null == defaultVolumeUnit ? _self.defaultVolumeUnit : defaultVolumeUnit // ignore: cast_nullable_to_non_nullable
as VolumeUnit,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,defaultPpm: null == defaultPpm ? _self.defaultPpm : defaultPpm // ignore: cast_nullable_to_non_nullable
as double,defaultCurrentMa: null == defaultCurrentMa ? _self.defaultCurrentMa : defaultCurrentMa // ignore: cast_nullable_to_non_nullable
as double,cleaningAlarmsEnabled: null == cleaningAlarmsEnabled ? _self.cleaningAlarmsEnabled : cleaningAlarmsEnabled // ignore: cast_nullable_to_non_nullable
as bool,cleaningIntervalMinutes: null == cleaningIntervalMinutes ? _self.cleaningIntervalMinutes : cleaningIntervalMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
