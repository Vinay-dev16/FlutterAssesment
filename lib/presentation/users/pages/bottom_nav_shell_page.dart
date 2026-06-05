import 'package:flutter/material.dart';
import 'package:flutter_assesment/presentation/settings/pages/settings_page.dart';

import '../../core/app_bottom_nav.dart';
import '../../forms/pages/form_page.dart';
import '../../notifications/pages/notifications_page.dart';
import '../widgets/favorites_page.dart';
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
      const FavoritesPage(),
      const SettingsPage()
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          pages[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: AppBottomNav(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
