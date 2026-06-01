import 'package:flutter/material.dart';

import '../../core/app_bottom_nav.dart';
import '../../forms/pages/form_page.dart';
import '../../notifications/pages/notifications_page.dart';
import '../../profile/pages/profile_page.dart';
import '../../settings/pages/settings_page.dart';
import 'user_list_page.dart';

class BottomNavShellPage extends StatefulWidget {
  final int initialIndex;

  const BottomNavShellPage({super.key, this.initialIndex = 0});

  @override
  State<BottomNavShellPage> createState() => _BottomNavShellPageState();
}

class _BottomNavShellPageState extends State<BottomNavShellPage> {
  late int _currentIndex = widget.initialIndex;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const UserListPage(),
      const FormPage(),
      const NotificationsPage(),
      const ProfilePage(),
      const SettingsPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_currentIndex],
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
