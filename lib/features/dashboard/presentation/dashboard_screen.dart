import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../widgets/stat_card.dart';
import '../../history/presentation/history_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.dashboardTitle),
      ),
      body: RefreshIndicator(
        onRefresh: () async => Future<void>.delayed(const Duration(milliseconds: 350)),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: <Widget>[
            Text(AppStrings.liveTraffic, style: theme.textTheme.headlineSmall),
            const SizedBox(height: 12),
            const StatCard(
              title: AppStrings.todayUsage,
              value: '1.2 GB',
              icon: Icons.data_usage,
            ),
            const StatCard(
              title: 'Active Connections',
              value: '12',
              icon: Icons.device_hub,
            ),
            const StatCard(
              title: AppStrings.securityInsights,
              value: 'No alerts',
              icon: Icons.shield_moon,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).pushNamed(HistoryScreen.routeName),
        icon: const Icon(Icons.history),
        label: const Text(AppStrings.historyTitle),
      ),
    );
  }
}
