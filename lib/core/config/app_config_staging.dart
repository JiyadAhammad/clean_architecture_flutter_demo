import '../env/app_environment.dart';
import 'app_config.dart';

class StagingAppConfig implements AppConfig {
  @override
  AppEnvironment get environment => AppEnvironment.staging;

  String get baseUrl => 'https://staging-api.myapp.com';
  String get endpoint => 'api/development';

  @override
  String get authBaseUrl => '$baseUrl/$endpoint';

  @override
  String get userBaseUrl => '$baseUrl/$endpoint';

  @override
  String get paymentBaseUrl => '$baseUrl/$endpoint';

  @override
  bool get enableLogging => true;
}
