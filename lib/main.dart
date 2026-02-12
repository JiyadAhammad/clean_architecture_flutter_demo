import 'package:flutter/material.dart';

import 'core/di/injection_container.dart';
import 'core/env/app_environment.dart'; 
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDI(AppEnvironment.dev);

  runApp(const MyApp());
}
