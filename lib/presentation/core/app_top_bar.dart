import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onProfileTap;
  final VoidCallback? onMenuTap;

  const AppTopBar({
    super.key,
    required this.title,
    this.onBack,
    this.onProfileTap,
    this.onMenuTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.lightBlue),
        onPressed: onBack ?? () => Navigator.of(context).maybePop(),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.lightBlue,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.person_outline, color: Colors.lightBlue),
                  onPressed: onProfileTap,
                ),
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.lightBlue),
                  onPressed: onMenuTap,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
