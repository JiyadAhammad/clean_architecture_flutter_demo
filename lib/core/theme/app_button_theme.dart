import 'package:flutter/material.dart';

ElevatedButtonThemeData primaryButtonTheme({
  required Color background,
  required Color foreground,
}) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: background,
      foregroundColor: foreground,
      textStyle: const TextStyle(color: Colors.white),
      minimumSize: const Size(double.infinity, 52),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
