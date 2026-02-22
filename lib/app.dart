import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:silvertimer_flutter/core/routing/app_router.dart';
import 'package:silvertimer_flutter/core/theme/app_theme.dart';
import 'package:silvertimer_flutter/features/settings/presentation/settings_controller.dart';

class SilverTimerApp extends ConsumerWidget {
  const SilverTimerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'SilverTimer',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
