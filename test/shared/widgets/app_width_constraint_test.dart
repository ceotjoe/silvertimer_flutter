// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:silvertimer_flutter/shared/widgets/app_width_constraint.dart';

void main() {
  testWidgets('constrains width on macOS', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    try {
      await tester.pumpWidget(
        const MaterialApp(home: AppWidthConstraint(child: Text('content'))),
      );

      expect(
        find.byWidgetPredicate((w) => w is ConstrainedBox && w.constraints.maxWidth == 480),
        findsOneWidget,
      );
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('does not constrain width on other native platforms', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    try {
      await tester.pumpWidget(
        const MaterialApp(home: AppWidthConstraint(child: Text('content'))),
      );

      expect(
        find.byWidgetPredicate((w) => w is ConstrainedBox && w.constraints.maxWidth == 480),
        findsNothing,
      );
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });
}
