import 'package:flutter/material.dart';

ElevatedButtonThemeData primaryButtonTheme({
  required Color background,
  required Color foreground,
  required TextStyle textStyle,
}) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: background,
      foregroundColor: foreground,
      textStyle: textStyle,
      minimumSize: const Size(double.infinity, 52),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
