// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TimerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )
    running,
    required TResult Function(Duration totalDuration, Duration elapsed) paused,
    required TResult Function(Duration totalDuration) completed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )?
    running,
    TResult? Function(Duration totalDuration, Duration elapsed)? paused,
    TResult? Function(Duration totalDuration)? completed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )?
    running,
    TResult Function(Duration totalDuration, Duration elapsed)? paused,
    TResult Function(Duration totalDuration)? completed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerIdle value) idle,
    required TResult Function(TimerRunning value) running,
    required TResult Function(TimerPaused value) paused,
    required TResult Function(TimerCompleted value) completed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerIdle value)? idle,
    TResult? Function(TimerRunning value)? running,
    TResult? Function(TimerPaused value)? paused,
    TResult? Function(TimerCompleted value)? completed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerIdle value)? idle,
    TResult Function(TimerRunning value)? running,
    TResult Function(TimerPaused value)? paused,
    TResult Function(TimerCompleted value)? completed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
    TimerState value,
    $Res Function(TimerState) then,
  ) = _$TimerStateCopyWithImpl<$Res, TimerState>;
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TimerIdleImplCopyWith<$Res> {
  factory _$$TimerIdleImplCopyWith(
    _$TimerIdleImpl value,
    $Res Function(_$TimerIdleImpl) then,
  ) = __$$TimerIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerIdleImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerIdleImpl>
    implements _$$TimerIdleImplCopyWith<$Res> {
  __$$TimerIdleImplCopyWithImpl(
    _$TimerIdleImpl _value,
    $Res Function(_$TimerIdleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimerIdleImpl implements TimerIdle {
  const _$TimerIdleImpl();

  @override
  String toString() {
    return 'TimerState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )
    running,
    required TResult Function(Duration totalDuration, Duration elapsed) paused,
    required TResult Function(Duration totalDuration) completed,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )?
    running,
    TResult? Function(Duration totalDuration, Duration elapsed)? paused,
    TResult? Function(Duration totalDuration)? completed,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )?
    running,
    TResult Function(Duration totalDuration, Duration elapsed)? paused,
    TResult Function(Duration totalDuration)? completed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerIdle value) idle,
    required TResult Function(TimerRunning value) running,
    required TResult Function(TimerPaused value) paused,
    required TResult Function(TimerCompleted value) completed,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerIdle value)? idle,
    TResult? Function(TimerRunning value)? running,
    TResult? Function(TimerPaused value)? paused,
    TResult? Function(TimerCompleted value)? completed,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerIdle value)? idle,
    TResult Function(TimerRunning value)? running,
    TResult Function(TimerPaused value)? paused,
    TResult Function(TimerCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class TimerIdle implements TimerState {
  const factory TimerIdle() = _$TimerIdleImpl;
}

/// @nodoc
abstract class _$$TimerRunningImplCopyWith<$Res> {
  factory _$$TimerRunningImplCopyWith(
    _$TimerRunningImpl value,
    $Res Function(_$TimerRunningImpl) then,
  ) = __$$TimerRunningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration totalDuration, Duration elapsed, DateTime startedAt});
}

/// @nodoc
class __$$TimerRunningImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerRunningImpl>
    implements _$$TimerRunningImplCopyWith<$Res> {
  __$$TimerRunningImplCopyWithImpl(
    _$TimerRunningImpl _value,
    $Res Function(_$TimerRunningImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDuration = null,
    Object? elapsed = null,
    Object? startedAt = null,
  }) {
    return _then(
      _$TimerRunningImpl(
        totalDuration: null == totalDuration
            ? _value.totalDuration
            : totalDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        elapsed: null == elapsed
            ? _value.elapsed
            : elapsed // ignore: cast_nullable_to_non_nullable
                  as Duration,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$TimerRunningImpl implements TimerRunning {
  const _$TimerRunningImpl({
    required this.totalDuration,
    required this.elapsed,
    required this.startedAt,
  });

  @override
  final Duration totalDuration;
  @override
  final Duration elapsed;
  @override
  final DateTime startedAt;

  @override
  String toString() {
    return 'TimerState.running(totalDuration: $totalDuration, elapsed: $elapsed, startedAt: $startedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerRunningImpl &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.elapsed, elapsed) || other.elapsed == elapsed) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, totalDuration, elapsed, startedAt);

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerRunningImplCopyWith<_$TimerRunningImpl> get copyWith =>
      __$$TimerRunningImplCopyWithImpl<_$TimerRunningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )
    running,
    required TResult Function(Duration totalDuration, Duration elapsed) paused,
    required TResult Function(Duration totalDuration) completed,
  }) {
    return running(totalDuration, elapsed, startedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )?
    running,
    TResult? Function(Duration totalDuration, Duration elapsed)? paused,
    TResult? Function(Duration totalDuration)? completed,
  }) {
    return running?.call(totalDuration, elapsed, startedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )?
    running,
    TResult Function(Duration totalDuration, Duration elapsed)? paused,
    TResult Function(Duration totalDuration)? completed,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(totalDuration, elapsed, startedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerIdle value) idle,
    required TResult Function(TimerRunning value) running,
    required TResult Function(TimerPaused value) paused,
    required TResult Function(TimerCompleted value) completed,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerIdle value)? idle,
    TResult? Function(TimerRunning value)? running,
    TResult? Function(TimerPaused value)? paused,
    TResult? Function(TimerCompleted value)? completed,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerIdle value)? idle,
    TResult Function(TimerRunning value)? running,
    TResult Function(TimerPaused value)? paused,
    TResult Function(TimerCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class TimerRunning implements TimerState {
  const factory TimerRunning({
    required final Duration totalDuration,
    required final Duration elapsed,
    required final DateTime startedAt,
  }) = _$TimerRunningImpl;

  Duration get totalDuration;
  Duration get elapsed;
  DateTime get startedAt;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerRunningImplCopyWith<_$TimerRunningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerPausedImplCopyWith<$Res> {
  factory _$$TimerPausedImplCopyWith(
    _$TimerPausedImpl value,
    $Res Function(_$TimerPausedImpl) then,
  ) = __$$TimerPausedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration totalDuration, Duration elapsed});
}

/// @nodoc
class __$$TimerPausedImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerPausedImpl>
    implements _$$TimerPausedImplCopyWith<$Res> {
  __$$TimerPausedImplCopyWithImpl(
    _$TimerPausedImpl _value,
    $Res Function(_$TimerPausedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? totalDuration = null, Object? elapsed = null}) {
    return _then(
      _$TimerPausedImpl(
        totalDuration: null == totalDuration
            ? _value.totalDuration
            : totalDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        elapsed: null == elapsed
            ? _value.elapsed
            : elapsed // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc

class _$TimerPausedImpl implements TimerPaused {
  const _$TimerPausedImpl({required this.totalDuration, required this.elapsed});

  @override
  final Duration totalDuration;
  @override
  final Duration elapsed;

  @override
  String toString() {
    return 'TimerState.paused(totalDuration: $totalDuration, elapsed: $elapsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerPausedImpl &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.elapsed, elapsed) || other.elapsed == elapsed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalDuration, elapsed);

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerPausedImplCopyWith<_$TimerPausedImpl> get copyWith =>
      __$$TimerPausedImplCopyWithImpl<_$TimerPausedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )
    running,
    required TResult Function(Duration totalDuration, Duration elapsed) paused,
    required TResult Function(Duration totalDuration) completed,
  }) {
    return paused(totalDuration, elapsed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )?
    running,
    TResult? Function(Duration totalDuration, Duration elapsed)? paused,
    TResult? Function(Duration totalDuration)? completed,
  }) {
    return paused?.call(totalDuration, elapsed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )?
    running,
    TResult Function(Duration totalDuration, Duration elapsed)? paused,
    TResult Function(Duration totalDuration)? completed,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(totalDuration, elapsed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerIdle value) idle,
    required TResult Function(TimerRunning value) running,
    required TResult Function(TimerPaused value) paused,
    required TResult Function(TimerCompleted value) completed,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerIdle value)? idle,
    TResult? Function(TimerRunning value)? running,
    TResult? Function(TimerPaused value)? paused,
    TResult? Function(TimerCompleted value)? completed,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerIdle value)? idle,
    TResult Function(TimerRunning value)? running,
    TResult Function(TimerPaused value)? paused,
    TResult Function(TimerCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class TimerPaused implements TimerState {
  const factory TimerPaused({
    required final Duration totalDuration,
    required final Duration elapsed,
  }) = _$TimerPausedImpl;

  Duration get totalDuration;
  Duration get elapsed;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerPausedImplCopyWith<_$TimerPausedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerCompletedImplCopyWith<$Res> {
  factory _$$TimerCompletedImplCopyWith(
    _$TimerCompletedImpl value,
    $Res Function(_$TimerCompletedImpl) then,
  ) = __$$TimerCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration totalDuration});
}

/// @nodoc
class __$$TimerCompletedImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerCompletedImpl>
    implements _$$TimerCompletedImplCopyWith<$Res> {
  __$$TimerCompletedImplCopyWithImpl(
    _$TimerCompletedImpl _value,
    $Res Function(_$TimerCompletedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? totalDuration = null}) {
    return _then(
      _$TimerCompletedImpl(
        totalDuration: null == totalDuration
            ? _value.totalDuration
            : totalDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc

class _$TimerCompletedImpl implements TimerCompleted {
  const _$TimerCompletedImpl({required this.totalDuration});

  @override
  final Duration totalDuration;

  @override
  String toString() {
    return 'TimerState.completed(totalDuration: $totalDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerCompletedImpl &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalDuration);

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerCompletedImplCopyWith<_$TimerCompletedImpl> get copyWith =>
      __$$TimerCompletedImplCopyWithImpl<_$TimerCompletedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )
    running,
    required TResult Function(Duration totalDuration, Duration elapsed) paused,
    required TResult Function(Duration totalDuration) completed,
  }) {
    return completed(totalDuration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )?
    running,
    TResult? Function(Duration totalDuration, Duration elapsed)? paused,
    TResult? Function(Duration totalDuration)? completed,
  }) {
    return completed?.call(totalDuration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
      Duration totalDuration,
      Duration elapsed,
      DateTime startedAt,
    )?
    running,
    TResult Function(Duration totalDuration, Duration elapsed)? paused,
    TResult Function(Duration totalDuration)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(totalDuration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerIdle value) idle,
    required TResult Function(TimerRunning value) running,
    required TResult Function(TimerPaused value) paused,
    required TResult Function(TimerCompleted value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerIdle value)? idle,
    TResult? Function(TimerRunning value)? running,
    TResult? Function(TimerPaused value)? paused,
    TResult? Function(TimerCompleted value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerIdle value)? idle,
    TResult Function(TimerRunning value)? running,
    TResult Function(TimerPaused value)? paused,
    TResult Function(TimerCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class TimerCompleted implements TimerState {
  const factory TimerCompleted({required final Duration totalDuration}) =
      _$TimerCompletedImpl;

  Duration get totalDuration;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerCompletedImplCopyWith<_$TimerCompletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
