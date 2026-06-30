import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        elevation: 0,//for shadow
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ),

      textTheme: const TextTheme(
        bodyLarge: AppTextStyles.teamName,
        bodyMedium: TextStyle(color: AppColors.textPrimary, fontSize: 14),
        bodySmall: AppTextStyles.timeRemaining,
      ),
    );
  }
}