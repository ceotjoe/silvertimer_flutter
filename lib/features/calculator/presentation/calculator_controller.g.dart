// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CalculatorController)
final calculatorControllerProvider = CalculatorControllerProvider._();

final class CalculatorControllerProvider
    extends $NotifierProvider<CalculatorController, CalculatorState> {
  CalculatorControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calculatorControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calculatorControllerHash();

  @$internal
  @override
  CalculatorController create() => CalculatorController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CalculatorState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CalculatorState>(value),
    );
  }
}

String _$calculatorControllerHash() =>
    r'2a28616e98df90a2c80be32d28648bd9b417cac7';

abstract class _$CalculatorController extends $Notifier<CalculatorState> {
  CalculatorState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CalculatorState, CalculatorState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CalculatorState, CalculatorState>,
              CalculatorState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
