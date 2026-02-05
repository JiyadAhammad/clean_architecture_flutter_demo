import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.gray1,

    primaryColor: AppColors.yellow,

    colorScheme: const ColorScheme.light(
      primary: AppColors.yellow,
      secondary: AppColors.green,
      error: AppColors.red,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: AppColors.gray5,
    ),

    textTheme: appTextTheme(AppColors.gray5, AppColors.gray4),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
