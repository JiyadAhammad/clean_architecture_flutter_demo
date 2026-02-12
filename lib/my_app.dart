import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import 'core/di/injection_container.dart';
import 'core/theme/app_theme.dart';
import 'core/ui/commands/app_commands.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<AuthBloc>(create: (_) => sl<AuthBloc>()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: AppCommands.messengerKey,
        navigatorKey: AppCommands.navigatorKey,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        title: 'Clean Architecture',
        home: const LoginPage(),
      ),
    );
  }
}
