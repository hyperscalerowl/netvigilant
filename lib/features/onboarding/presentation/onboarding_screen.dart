import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../dashboard/presentation/dashboard_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Spacer(flex: 2),
              Text(
                AppStrings.onboardingTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                AppStrings.onboardingDescription,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(flex: 3),
              Align(
                alignment: Alignment.bottomRight,
                child: FilledButton.icon(
                  onPressed: () => Navigator.of(context).pushReplacementNamed(
                    DashboardScreen.routeName,
                  ),
                  icon: const Icon(Icons.shield_outlined),
                  label: const Text(AppStrings.getStarted),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
