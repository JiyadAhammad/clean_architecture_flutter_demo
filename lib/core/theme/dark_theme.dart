import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.gray5,

    primaryColor: AppColors.yellowDark,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.yellowDark,
      secondary: AppColors.greenDark,
      error: AppColors.redDark,
    ),

    textTheme: appTextTheme(Colors.white, AppColors.gray3),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.gray5,
      elevation: 0,
    ),
  );
}
