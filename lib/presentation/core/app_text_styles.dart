import 'package:flutter/material.dart';

import 'app_colors.dart';

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
