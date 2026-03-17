// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cleaningAlarmCountHash() =>
    r'ec2b16b4fdf30a42219e188996c4e0965ea0118f';

/// Public provider: the 1-based number of the most recently fired cleaning alarm
/// (0 = no alarm fired yet). TimerScreen listens to this to show the SnackBar.
///
/// Copied from [cleaningAlarmCount].
@ProviderFor(cleaningAlarmCount)
final cleaningAlarmCountProvider = AutoDisposeProvider<int>.internal(
  cleaningAlarmCount,
  name: r'cleaningAlarmCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cleaningAlarmCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CleaningAlarmCountRef = AutoDisposeProviderRef<int>;
String _$nextCleaningInHash() => r'1f67edf77f420872923438ae70c26c697c3d7eda';

/// Public provider: time remaining until the next electrode cleaning alarm,
/// or `null` when there is no schedule or all alarms have already fired.
/// Rebuilds every second because it watches timerControllerProvider.
///
/// Copied from [nextCleaningIn].
@ProviderFor(nextCleaningIn)
final nextCleaningInProvider = AutoDisposeProvider<Duration?>.internal(
  nextCleaningIn,
  name: r'nextCleaningInProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nextCleaningInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NextCleaningInRef = AutoDisposeProviderRef<Duration?>;
String _$cleaningMarkersHash() => r'b09f5be2a694a2a04c2dd73fe7017fd548894d31';

/// Public provider: normalized (0.0–1.0) ring positions for all cleaning alarm marks.
/// Returns `(pending: [...], passed: [...])` for the CircularTimer painter.
/// Rebuilds every second because it watches timerControllerProvider.
///
/// Copied from [cleaningMarkers].
@ProviderFor(cleaningMarkers)
final cleaningMarkersProvider =
    AutoDisposeProvider<({List<double> pending, List<double> passed})>.internal(
      cleaningMarkers,
      name: r'cleaningMarkersProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$cleaningMarkersHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CleaningMarkersRef =
    AutoDisposeProviderRef<({List<double> pending, List<double> passed})>;
String _$timerControllerHash() => r'f6ffc39dfa6264639d1c469e4689ae94eaa79589';

/// See also [TimerController].
@ProviderFor(TimerController)
final timerControllerProvider =
    NotifierProvider<TimerController, TimerState>.internal(
      TimerController.new,
      name: r'timerControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$timerControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TimerController = Notifier<TimerState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
