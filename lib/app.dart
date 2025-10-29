import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/app_strings.dart';
import 'core/theme/app_theme.dart';
import 'features/dashboard/presentation/dashboard_screen.dart';
import 'features/history/presentation/history_screen.dart';
import 'features/onboarding/presentation/onboarding_screen.dart';
import 'features/settings/presentation/settings_screen.dart';
import 'features/support/presentation/support_center.dart';

class NetGuardApp extends ConsumerWidget {
  const NetGuardApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      home: const OnboardingScreen(),
      routes: <String, WidgetBuilder>{
        DashboardScreen.routeName: (_) => const DashboardScreen(),
        HistoryScreen.routeName: (_) => const HistoryScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
        SupportCenterScreen.routeName: (_) => const SupportCenterScreen(),
      },
    );
  }
}
