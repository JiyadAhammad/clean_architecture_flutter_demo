import 'package:flutter/material.dart';
import 'app_typography.dart';

TextTheme appTextTheme(Color primaryText, Color secondaryText) {
  return TextTheme(
    displayLarge: AppTypography.h1.copyWith(color: primaryText),
    displayMedium: AppTypography.h2.copyWith(color: primaryText),
    displaySmall: AppTypography.h3.copyWith(color: primaryText),

    headlineMedium: AppTypography.h4.copyWith(color: primaryText),
    headlineSmall: AppTypography.h5.copyWith(color: primaryText),

    titleLarge: AppTypography.h6.copyWith(color: primaryText),

    bodyLarge: AppTypography.bodyLargeRegular.copyWith(color: secondaryText),
    bodyMedium: AppTypography.bodySmallRegular.copyWith(color: secondaryText),

    labelLarge: AppTypography.captionMedium.copyWith(color: secondaryText),
    labelSmall: AppTypography.captionRegular.copyWith(color: secondaryText),
  );
}
