import 'package:flutter/material.dart';
import 'app_commands.dart';

class DialogCommand {
  static Future<void> showAlert({
    required String title,
    required String message,
    String okText = 'OK',
  }) async {
    final context = AppCommands.navigatorKey.currentContext;
    if (context == null) return;

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(okText),
          ),
        ],
      ),
    );
  }
}
