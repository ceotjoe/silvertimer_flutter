// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'silver_calculator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(silverCalculator)
final silverCalculatorProvider = SilverCalculatorProvider._();

final class SilverCalculatorProvider
    extends
        $FunctionalProvider<
          SilverCalculator,
          SilverCalculator,
          SilverCalculator
        >
    with $Provider<SilverCalculator> {
  SilverCalculatorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'silverCalculatorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$silverCalculatorHash();

  @$internal
  @override
  $ProviderElement<SilverCalculator> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SilverCalculator create(Ref ref) {
    return silverCalculator(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SilverCalculator value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SilverCalculator>(value),
    );
  }
}

String _$silverCalculatorHash() => r'bc53ecb68a6123dfc879675c160d1f7dff811aa8';
