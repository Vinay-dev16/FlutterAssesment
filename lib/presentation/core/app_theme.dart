import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryDark = Color(0xFF2D0C6A);
  static const Color primary = Color(0xFF3B0FA3);
  static const Color logoBackground = Colors.white;
  static const Color logoText = primary;
  static const Color textPrimaryOnPrimary = Colors.white;
  static const Color textSecondaryOnPrimary = Colors.white70;
  static const Color cardBackground = Colors.white;
  static const Color deleteIcon = Colors.red;
}

class AppDimens {
  static const double screenPaddingH = 24;
  static const double screenPaddingV = 16;

  static const double logoSize = 72;
  static const double logoBorderRadius = 24;

  static const double splashLogoSize = 96;
  static const double splashLogoBorderRadius = 28;

  static const double cardRadius = 24;
  static const double cardPaddingH = 20;
  static const double cardPaddingV = 24;

  static const double spacingXS = 4;
  static const double spacingS = 8;
  static const double spacingM = 16;
  static const double spacingL = 24;
  static const double spacingXL = 32;

  static const double listHorizontalPadding = 12;
  static const double listVerticalPadding = 8;

  static const double indicatorDotSize = 8;
}

class AppTextStyles {
  static const TextStyle splashTitle = TextStyle(
    color: AppColors.textPrimaryOnPrimary,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
  );

  static const TextStyle splashSubtitle = TextStyle(
    color: AppColors.textSecondaryOnPrimary,
    fontSize: 16,
  );

  static const TextStyle loginTitle = TextStyle(
    color: AppColors.textPrimaryOnPrimary,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle loginSubtitle = TextStyle(
    color: AppColors.textSecondaryOnPrimary,
    fontSize: 14,
  );

  static const TextStyle appBarTitle = TextStyle(
    color: AppColors.textPrimaryOnPrimary,
    fontWeight: FontWeight.w600,
  );
}

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.primary,
      AppColors.primaryDark,
    ],
  );
}
