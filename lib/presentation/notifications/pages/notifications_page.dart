import 'package:flutter/material.dart';

import '../../core/app_strings.dart';
import '../../core/app_top_bar.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppTopBar(title: AppStrings.notificationsPageTitle),
      body: Center(
        child: Text(AppStrings.notificationsPageContent, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
