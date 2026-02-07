import 'package:flutter/material.dart';

import 'app_button_theme.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

ThemeData darkTheme() {
  final TextTheme textTheme = appTextTheme(Colors.white, AppColors.gray3);

  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.gray5,

    primaryColor: AppColors.yellowDark,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.yellowDark,
      secondary: AppColors.greenDark,
      error: AppColors.redDark,
    ),

    textTheme: textTheme,

    elevatedButtonTheme: primaryButtonTheme(
      background: AppColors.yellowDark,
      foreground: Colors.black,
      textStyle: textTheme.labelLarge!,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.gray5,
      elevation: 0,
    ),
  );
}
