import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.settingsTitle)),
      body: ListView(
        children: const <Widget>[
          _SettingsTile(title: 'Theme', subtitle: 'Light / Dark / System'),
          _SettingsTile(title: 'Data Retention', subtitle: 'Store 30 days of history'),
          _SettingsTile(title: 'Notifications', subtitle: 'Weekly summaries'),
          _SettingsTile(title: 'Privacy Controls', subtitle: 'Anonymise sensitive fields'),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.tune),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
