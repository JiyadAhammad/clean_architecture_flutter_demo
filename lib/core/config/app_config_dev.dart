import '../env/app_environment.dart';
import 'app_config.dart';

class DevAppConfig implements AppConfig {
  @override
  AppEnvironment get environment => AppEnvironment.dev;

  String get baseUrl => 'https://dev-api.myapp.com';

  @override
  String get authBaseUrl => baseUrl;

  @override
  String get userBaseUrl => baseUrl;

  @override
  String get paymentBaseUrl => baseUrl;

  @override
  bool get enableLogging => true;
}
