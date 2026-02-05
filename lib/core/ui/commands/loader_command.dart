import 'package:flutter/material.dart';
import 'app_commands.dart';

class LoaderCommand {
  static bool _isShowing = false;

  static void show() {
    if (_isShowing) return;
    final context = AppCommands.navigatorKey.currentContext;
    if (context == null) return;

    _isShowing = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }

  static void hide() {
    if (!_isShowing) return;
    final context = AppCommands.navigatorKey.currentContext;
    if (context == null) return;

    _isShowing = false;
    Navigator.pop(context);
  }
}
