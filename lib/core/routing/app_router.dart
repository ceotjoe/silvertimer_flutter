// Copyright (C) 2026 Jörg Holzapfel
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:silvertimer_flutter/features/calculator/presentation/calculator_controller.dart';
import 'package:silvertimer_flutter/features/calculator/presentation/calculator_screen.dart';
import 'package:silvertimer_flutter/features/history/presentation/history_screen.dart';
import 'package:silvertimer_flutter/features/info/presentation/info_screen.dart';
import 'package:silvertimer_flutter/features/settings/presentation/settings_screen.dart';
import 'package:silvertimer_flutter/features/timer/presentation/timer_screen.dart';
import 'package:silvertimer_flutter/shared/widgets/app_scaffold.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/calculator',
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppScaffold(child: child),
        routes: [
          GoRoute(
            path: '/calculator',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: CalculatorScreen(),
            ),
          ),
          GoRoute(
            path: '/timer',
            redirect: (context, state) {
              // Guard: must have a valid calculation result
              final container = ProviderScope.containerOf(context);
              final result = container.read(calculatorControllerProvider).lastResult;
              if (result == null) return '/calculator';
              return null;
            },
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TimerScreen(),
            ),
          ),
          GoRoute(
            path: '/history',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HistoryScreen(),
            ),
          ),
          GoRoute(
            path: '/info',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: InfoScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
