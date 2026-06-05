import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_strings.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool hasNotification;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.hasNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(0, Icons.home_outlined, Icons.home, AppStrings.home),
              _buildNavItem(1, Icons.edit_outlined, Icons.edit, AppStrings.form),
              _buildNotificationItem(),
              _buildNavItem(3, Icons.star_outline, Icons.star, AppStrings.form),
              _buildNavItem(4, Icons.settings_rounded, Icons.settings_sharp, AppStrings.settings),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, IconData activeIcon, String label) {
    final isActive = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive ? AppColors.bottomNavPink : Colors.grey,
              size: 28,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: isActive ? AppColors.bottomNavPink : Colors.grey,
                height: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem() {
    final isActive = currentIndex == 2;
    return GestureDetector(
      onTap: () => onTap(2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                isActive ? Icons.notifications : Icons.notifications_none,
                color: isActive ? AppColors.bottomNavPink : Colors.grey,
                size: 28,
              ),
              if (hasNotification)
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            AppStrings.notifications,
            style: TextStyle(
              fontSize: 13,
              color: isActive ? AppColors.bottomNavPink : Colors.grey,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

