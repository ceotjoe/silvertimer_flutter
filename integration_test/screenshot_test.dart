import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:silvertimer_flutter/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture app store screenshots', (tester) async {
    app.main();

    // Wait for app to fully initialise (fonts, providers, DB)
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // ── 1 · Calculator ──────────────────────────────────────────────────────
    // Use a stable Key so the finder is always unambiguous, regardless of
    // how many FilledButton ancestors the icon has in the widget tree.
    final calculateBtn = find.byKey(const Key('calculate_button'));
    if (calculateBtn.evaluate().isNotEmpty) {
      await tester.tap(calculateBtn);
      // Use pump instead of pumpAndSettle so the slide-in animation
      // has time to finish but we don't wait for ticker-driven frames.
      await tester.pump(const Duration(milliseconds: 600));
    }
    await binding.takeScreenshot('01_calculator');

    // ── 2 · Timer ───────────────────────────────────────────────────────────
    // The "Start Timer" button is inside the result card.
    final startTimerBtn = find.widgetWithIcon(FilledButton, Icons.timer);
    if (startTimerBtn.evaluate().isNotEmpty) {
      await tester.tap(startTimerBtn);
      // Give the timer screen time to paint its first frame; avoid
      // pumpAndSettle here because the running timer emits continuous frames.
      await tester.pump(const Duration(seconds: 1));
    }
    await binding.takeScreenshot('02_timer');

    // ── 3 · History ─────────────────────────────────────────────────────────
    // Tap the History tab in the bottom NavigationBar.
    final historyTab = find.byIcon(Icons.history_outlined);
    if (historyTab.evaluate().isNotEmpty) {
      await tester.tap(historyTab);
      await tester.pumpAndSettle(const Duration(seconds: 2));
    }
    await binding.takeScreenshot('03_history');

    // ── 4 · Settings ────────────────────────────────────────────────────────
    // Navigate back to Calculator first (settings icon lives in its AppBar).
    final calculatorTab = find.byIcon(Icons.calculate_outlined);
    if (calculatorTab.evaluate().isNotEmpty) {
      await tester.tap(calculatorTab);
      await tester.pumpAndSettle();
    }
    final settingsIcon = find.byIcon(Icons.settings_outlined);
    if (settingsIcon.evaluate().isNotEmpty) {
      await tester.tap(settingsIcon);
      await tester.pumpAndSettle(const Duration(seconds: 1));
    }
    await binding.takeScreenshot('04_settings');
  });
}
