import 'package:flutter/material.dart';
import 'package:superformula_test/core/theme/app_colors.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.primary,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
