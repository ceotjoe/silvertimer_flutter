# 5. Calculation logic is a pure, stateless class

- Status: accepted
- Date: 2026-10-24

## Context
The one thing the app must get right is the electrolysis time. It follows from Faraday's law: `t = (ppm × V × F) / (M_Ag × I × 1000)`
for a target concentration in ppm, water volume `V` in litres and electrode current `I`.

## Decision
`SilverCalculator.calculate(CalculatorInput) → CalculationResult` in `lib/core/utils/silver_calculator.dart` is a pure, stateless class
with no Flutter dependencies. Constants live in `PhysicsConstants`. UI and controllers only call it; they do not contain the formula.

## Consequences
- The formula is unit-tested without widgets (`test/core/silver_calculator_test.dart`).
- Any change to the physics or its assumptions is a change to this class and its tests, and should come with a CHANGELOG entry.
