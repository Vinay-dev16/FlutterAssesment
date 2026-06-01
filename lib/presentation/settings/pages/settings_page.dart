import 'package:flutter/material.dart';

import '../../core/app_strings.dart';
import '../../core/app_top_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppTopBar(title: AppStrings.settingsPageTitle),
      body: Center(
        child: Text(AppStrings.settingsPageContent, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
