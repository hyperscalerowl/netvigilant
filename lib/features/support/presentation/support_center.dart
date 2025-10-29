import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';

class SupportCenterScreen extends StatelessWidget {
  const SupportCenterScreen({super.key});

  static const String routeName = '/support';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.supportTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.chat_bubble_outline),
            title: Text('Chatbot'),
            subtitle: Text('Get instant answers to common questions.'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.book_outlined),
            title: Text('Documentation'),
            subtitle: Text('Learn how to get the most out of NetGuard.'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.email_outlined),
            title: Text('Contact Support'),
            subtitle: Text('support@netguard.app'),
          ),
        ],
      ),
    );
  }
}
