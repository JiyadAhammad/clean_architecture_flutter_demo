import '../env/app_environment.dart';
import 'app_config.dart';

class StagingAppConfig implements AppConfig {
  @override
  AppEnvironment get environment => AppEnvironment.staging;

  String get baseUrl => 'https://staging-api.myapp.com';

  @override
  String get authBaseUrl => baseUrl;

  @override
  String get userBaseUrl => baseUrl;

  @override
  String get paymentBaseUrl => baseUrl;

  @override
  bool get enableLogging => true;
}
