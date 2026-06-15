// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:silvertimer_flutter/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture app store screenshots', (tester) async {
    // Make every AnimationController finish near-instantly so pumpAndSettle
    // always returns a fully settled frame with no mid-animation content.
    // This does not affect wall-clock based logic (e.g. the timer countdown).
    timeDilation = 0.01;

    app.main();

    // Wait for app to fully initialise (fonts, providers, DB).
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Android requires the Flutter surface to be converted to an image
    // before any screenshot can be taken. iOS does not need this call.
    if (defaultTargetPlatform == TargetPlatform.android) {
      await binding.convertFlutterSurfaceToImage();
      await tester.pump();
    }

    // ── 1 · Calculator ──────────────────────────────────────────────────────
    final calculateBtn = find.byKey(const Key('calculate_button'));
    if (calculateBtn.evaluate().isNotEmpty) {
      await tester.tap(calculateBtn);
      // pumpAndSettle is safe here — flutter_animate controllers stop after
      // their duration completes and timeDilation makes them finish instantly.
      await tester.pumpAndSettle();
    }
    await binding.takeScreenshot('01_calculator');

    // ── 2 · Timer ───────────────────────────────────────────────────────────
    // Find by Key so this works on both Material (FilledButton) and Cupertino
    // (CupertinoButton) — AdaptiveFilledButton uses the platform widget.
    final startTimerBtn = find.byKey(const Key('start_timer_button'));
    if (startTimerBtn.evaluate().isNotEmpty) {
      await tester.tap(startTimerBtn);
      // Cannot use pumpAndSettle here: the running timer's Ticker emits
      // frames continuously and would cause a timeout. Pump enough time for
      // the go_router navigation animation to complete instead.
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 400));
    }
    await binding.takeScreenshot('02_timer');

    // ── 3 · History ─────────────────────────────────────────────────────────
    final historyTab = find.byIcon(Icons.history_outlined);
    if (historyTab.evaluate().isNotEmpty) {
      await tester.tap(historyTab);
      await tester.pumpAndSettle();
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
      await tester.pumpAndSettle();
    }
    await binding.takeScreenshot('04_settings');
  });
}
