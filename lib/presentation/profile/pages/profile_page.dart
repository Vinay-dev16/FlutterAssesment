import 'package:flutter/material.dart';

import '../../core/app_strings.dart';
import '../../core/app_top_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppTopBar(title: AppStrings.profilePageTitle),
      body: Center(child: Text(AppStrings.profilePageContent, style: TextStyle(fontSize: 18))),
    );
  }
}
