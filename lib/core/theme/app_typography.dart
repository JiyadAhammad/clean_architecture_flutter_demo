import 'package:flutter/material.dart';

class AppTypography {
  static const String fontFamily = 'GeneralSans';

  // ───────────────────────── Headings ─────────────────────────

  static const h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 48,
    height: 64 / 48,
    fontWeight: FontWeight.w500,
  );

  static const h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w500,
  );

  static const h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    height: 40 / 28,
    fontWeight: FontWeight.w500,
  );

  static const h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w500,
  );

  static const h5 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 24 / 20,
    fontWeight: FontWeight.w500,
  );

  static const h6 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    height: 24 / 18,
    fontWeight: FontWeight.w500,
  );

  // ───────────────────────── Body ─────────────────────────

  static const bodyLargeSemiBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w600,
  );

  static const bodyLargeMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w500,
  );

  static const bodyLargeRegular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
  );

  static const bodySmallMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 16 / 14,
    fontWeight: FontWeight.w500,
  );

  static const bodySmallRegular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 16 / 14,
    fontWeight: FontWeight.w400,
  );

  // ───────────────────────── Caption ─────────────────────────

  static const captionMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
  );

  static const captionRegular = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
  );
}
