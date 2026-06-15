// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TimerController)
final timerControllerProvider = TimerControllerProvider._();

final class TimerControllerProvider
    extends $NotifierProvider<TimerController, TimerState> {
  TimerControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timerControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timerControllerHash();

  @$internal
  @override
  TimerController create() => TimerController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TimerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TimerState>(value),
    );
  }
}

String _$timerControllerHash() => r'4ffc5e8aea995aba73f2e623d0519d18d35698e6';

abstract class _$TimerController extends $Notifier<TimerState> {
  TimerState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TimerState, TimerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TimerState, TimerState>,
              TimerState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Public provider: the 1-based number of the most recently fired cleaning alarm
/// (0 = no alarm fired yet). TimerScreen listens to this to show the SnackBar.

@ProviderFor(cleaningAlarmCount)
final cleaningAlarmCountProvider = CleaningAlarmCountProvider._();

/// Public provider: the 1-based number of the most recently fired cleaning alarm
/// (0 = no alarm fired yet). TimerScreen listens to this to show the SnackBar.

final class CleaningAlarmCountProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  /// Public provider: the 1-based number of the most recently fired cleaning alarm
  /// (0 = no alarm fired yet). TimerScreen listens to this to show the SnackBar.
  CleaningAlarmCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cleaningAlarmCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cleaningAlarmCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return cleaningAlarmCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$cleaningAlarmCountHash() =>
    r'ec2b16b4fdf30a42219e188996c4e0965ea0118f';

/// Public provider: time remaining until the next electrode cleaning alarm,
/// or `null` when there is no schedule or all alarms have already fired.
/// Rebuilds every second because it watches timerControllerProvider.

@ProviderFor(nextCleaningIn)
final nextCleaningInProvider = NextCleaningInProvider._();

/// Public provider: time remaining until the next electrode cleaning alarm,
/// or `null` when there is no schedule or all alarms have already fired.
/// Rebuilds every second because it watches timerControllerProvider.

final class NextCleaningInProvider
    extends $FunctionalProvider<Duration?, Duration?, Duration?>
    with $Provider<Duration?> {
  /// Public provider: time remaining until the next electrode cleaning alarm,
  /// or `null` when there is no schedule or all alarms have already fired.
  /// Rebuilds every second because it watches timerControllerProvider.
  NextCleaningInProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nextCleaningInProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nextCleaningInHash();

  @$internal
  @override
  $ProviderElement<Duration?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Duration? create(Ref ref) {
    return nextCleaningIn(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Duration?>(value),
    );
  }
}

String _$nextCleaningInHash() => r'1f67edf77f420872923438ae70c26c697c3d7eda';

/// Public provider: normalized (0.0–1.0) ring positions for all cleaning alarm marks.
/// Returns `(pending: [...], passed: [...])` for the CircularTimer painter.
/// Rebuilds every second because it watches timerControllerProvider.

@ProviderFor(cleaningMarkers)
final cleaningMarkersProvider = CleaningMarkersProvider._();

/// Public provider: normalized (0.0–1.0) ring positions for all cleaning alarm marks.
/// Returns `(pending: [...], passed: [...])` for the CircularTimer painter.
/// Rebuilds every second because it watches timerControllerProvider.

final class CleaningMarkersProvider
    extends
        $FunctionalProvider<
          ({List<double> passed, List<double> pending}),
          ({List<double> passed, List<double> pending}),
          ({List<double> passed, List<double> pending})
        >
    with $Provider<({List<double> passed, List<double> pending})> {
  /// Public provider: normalized (0.0–1.0) ring positions for all cleaning alarm marks.
  /// Returns `(pending: [...], passed: [...])` for the CircularTimer painter.
  /// Rebuilds every second because it watches timerControllerProvider.
  CleaningMarkersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cleaningMarkersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cleaningMarkersHash();

  @$internal
  @override
  $ProviderElement<({List<double> passed, List<double> pending})>
  $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  ({List<double> passed, List<double> pending}) create(Ref ref) {
    return cleaningMarkers(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    ({List<double> passed, List<double> pending}) value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<({List<double> passed, List<double> pending})>(
            value,
          ),
    );
  }
}

String _$cleaningMarkersHash() => r'b09f5be2a694a2a04c2dd73fe7017fd548894d31';
