// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DevicesController)
final devicesControllerProvider = DevicesControllerProvider._();

final class DevicesControllerProvider
    extends $AsyncNotifierProvider<DevicesController, List<Device>> {
  DevicesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'devicesControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$devicesControllerHash();

  @$internal
  @override
  DevicesController create() => DevicesController();
}

String _$devicesControllerHash() => r'53750b24e83ffa3d0cd0302da1aa8cfb6e221e4f';

abstract class _$DevicesController extends $AsyncNotifier<List<Device>> {
  FutureOr<List<Device>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Device>>, List<Device>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Device>>, List<Device>>,
              AsyncValue<List<Device>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
