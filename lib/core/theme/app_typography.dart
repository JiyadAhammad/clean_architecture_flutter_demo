import 'package:flutter/material.dart';

class AppTypography {
  static const String fontFamily = 'GeneralSans';

  // ───────────────────────── Headings ─────────────────────────

  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 48,
    height: 64 / 48,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    height: 40 / 28,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 24 / 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle h6 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    height: 24 / 18,
    fontWeight: FontWeight.w500,
  );

  // ───────────────────────── Body ─────────────────────────

  static const TextStyle bodyLargeSemiBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyLargeMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyLargeRegular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodySmallMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 16 / 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodySmallRegular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 16 / 14,
    fontWeight: FontWeight.w400,
  );

  // ───────────────────────── Caption ─────────────────────────

  static const TextStyle captionMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle captionRegular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
  );

  // ───────────────────────── Button ─────────────────────────

  static const TextStyle labelLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
