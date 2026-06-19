import 'package:flutter/material.dart';
import 'app_colors.dart';


class AppTextStyles {

  static const TextStyle teamName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle score = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle liveScore = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.liveMatch,
  );

  static const TextStyle timeRemaining = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );
}