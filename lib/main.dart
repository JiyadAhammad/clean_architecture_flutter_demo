import 'package:flutter/material.dart';

import 'core/di/injection_container.dart';
import 'core/env/app_environment.dart';
import 'core/theme/app_theme.dart';
import 'core/ui/commands/app_commands.dart';
import 'features/auth/presentation/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDI(AppEnvironment.dev);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: AppCommands.messengerKey,
      navigatorKey: AppCommands.navigatorKey,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      title: 'Clean Architecture',

      home: const LoginPage(),
    );
  }
}
