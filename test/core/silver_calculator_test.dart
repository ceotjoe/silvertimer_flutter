import 'package:flutter_test/flutter_test.dart';
import 'package:silvertimer_flutter/core/utils/silver_calculator.dart';
import 'package:silvertimer_flutter/features/calculator/domain/models/calculator_input.dart';

void main() {
  const calculator = SilverCalculator();

  group('SilverCalculator.calculate', () {
    test('returns correct duration for known inputs', () {
      // 500 mL water, 1 mA, 10 PPM
      // time = (10 * 0.5 * 96485) / (107.87 * 0.001 * 1000)
      //      = 482425 / 107.87 ≈ 4472 seconds
      const input = CalculatorInput(
        volumeValue: 500,
        volumeUnit: VolumeUnit.ml,
        currentMilliamps: 1,
        targetPpm: 10,
      );
      final result = calculator.calculate(input);
      // Allow ±1 second for rounding
      expect(result.calculatedDuration.inSeconds, closeTo(4473, 1));
    });

    test('1 L water == 1000 mL water produces identical result', () {
      const inputMl = CalculatorInput(
        volumeValue: 1000,
        volumeUnit: VolumeUnit.ml,
        currentMilliamps: 2,
        targetPpm: 15,
      );
      const inputL = CalculatorInput(
        volumeValue: 1,
        volumeUnit: VolumeUnit.liters,
        currentMilliamps: 2,
        targetPpm: 15,
      );
      expect(
        calculator.calculate(inputMl).calculatedDuration.inSeconds,
        calculator.calculate(inputL).calculatedDuration.inSeconds,
      );
    });

    test('doubling current halves the time', () {
      const input1 = CalculatorInput(
        volumeValue: 1,
        volumeUnit: VolumeUnit.liters,
        currentMilliamps: 1,
        targetPpm: 10,
      );
      const input2 = CalculatorInput(
        volumeValue: 1,
        volumeUnit: VolumeUnit.liters,
        currentMilliamps: 2,
        targetPpm: 10,
      );
      final t1 = calculator.calculate(input1).calculatedDuration.inSeconds;
      final t2 = calculator.calculate(input2).calculatedDuration.inSeconds;
      expect(t1, closeTo(t2 * 2, 2));
    });

    test('doubling volume doubles the time', () {
      const input1 = CalculatorInput(
        volumeValue: 500,
        volumeUnit: VolumeUnit.ml,
        currentMilliamps: 1,
        targetPpm: 10,
      );
      const input2 = CalculatorInput(
        volumeValue: 1000,
        volumeUnit: VolumeUnit.ml,
        currentMilliamps: 1,
        targetPpm: 10,
      );
      final t1 = calculator.calculate(input1).calculatedDuration.inSeconds;
      final t2 = calculator.calculate(input2).calculatedDuration.inSeconds;
      expect(t2, closeTo(t1 * 2, 2));
    });
  });

  group('SilverCalculator.validate', () {
    test('returns null for valid inputs', () {
      const input = CalculatorInput(
        volumeValue: 500,
        volumeUnit: VolumeUnit.ml,
        currentMilliamps: 1,
        targetPpm: 10,
      );
      expect(calculator.validate(input), isNull);
    });

    test('returns error for zero volume', () {
      const input = CalculatorInput(
        volumeValue: 0,
        volumeUnit: VolumeUnit.ml,
        currentMilliamps: 1,
        targetPpm: 10,
      );
      expect(calculator.validate(input), isNotNull);
    });

    test('returns error for zero current', () {
      const input = CalculatorInput(
        volumeValue: 500,
        volumeUnit: VolumeUnit.ml,
        currentMilliamps: 0,
        targetPpm: 10,
      );
      expect(calculator.validate(input), isNotNull);
    });

    test('returns error for zero PPM', () {
      const input = CalculatorInput(
        volumeValue: 500,
        volumeUnit: VolumeUnit.ml,
        currentMilliamps: 1,
        targetPpm: 0,
      );
      expect(calculator.validate(input), isNotNull);
    });

    test('returns error for current exceeding 5000 mA', () {
      const input = CalculatorInput(
        volumeValue: 500,
        volumeUnit: VolumeUnit.ml,
        currentMilliamps: 5001,
        targetPpm: 10,
      );
      expect(calculator.validate(input), isNotNull);
    });

    test('accepts exactly 5000 mA', () {
      const input = CalculatorInput(
        volumeValue: 500,
        volumeUnit: VolumeUnit.ml,
        currentMilliamps: 5000,
        targetPpm: 10,
      );
      expect(calculator.validate(input), isNull);
    });
  });

  group('CalculatorInput.volumeInLiters', () {
    test('converts ml to liters correctly', () {
      const input = CalculatorInput(
        volumeValue: 250,
        volumeUnit: VolumeUnit.ml,
      );
      expect(input.volumeInLiters, equals(0.25));
    });

    test('returns value unchanged for liters', () {
      const input = CalculatorInput(
        volumeValue: 1.5,
        volumeUnit: VolumeUnit.liters,
      );
      expect(input.volumeInLiters, equals(1.5));
    });
  });
}
