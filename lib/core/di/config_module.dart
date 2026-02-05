import '../config/app_config.dart';
import '../config/app_config_dev.dart';
import '../config/app_config_prod.dart';
import '../config/app_config_staging.dart';
import '../env/app_environment.dart';
import 'injection_container.dart';

void registerConfig() {
  final env = sl<AppEnvironment>();

  late final AppConfig config;

  switch (env) {
    case AppEnvironment.dev:
      config = DevAppConfig();
      break;
    case AppEnvironment.staging:
      config = StagingAppConfig();
      break;
    case AppEnvironment.prod:
      config = ProdAppConfig();
      break;
  }

  sl.registerSingleton<AppConfig>(config);
}
