import '../env/app_environment.dart';
import 'app_config.dart';

class DevAppConfig implements AppConfig {
  @override
  AppEnvironment get environment => AppEnvironment.dev;

  String get baseUrl => 'https://new.tradiify.com';

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
