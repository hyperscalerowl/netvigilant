import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  static const String routeName = '/history';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.historyTitle)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.wifi_tethering),
            title: Text('Application #$index'),
            subtitle: const Text('Connected to 192.168.0.1 • 24 MB'),
            trailing: const Icon(Icons.chevron_right),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: 10,
      ),
    );
  }
}
