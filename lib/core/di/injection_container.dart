import 'package:get_it/get_it.dart';

import '../env/app_environment.dart';
import 'config_module.dart';
import 'env_module.dart';
import 'error_module.dart';
import 'logger_module.dart';
import 'network_module.dart';
import 'platform_module.dart';
import 'storage_module.dart';

final GetIt sl = GetIt.instance;

Future<void> initDI(AppEnvironment env) async {
  registerEnv(env);
  registerConfig();
  registerLogger();
  await registerStorage();
  registerNetwork();
  registerError();
  registerPlatform();
}
