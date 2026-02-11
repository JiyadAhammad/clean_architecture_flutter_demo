import '../env/app_environment.dart';
import 'app_config.dart';

class ProdAppConfig implements AppConfig {
  @override
  AppEnvironment get environment => AppEnvironment.prod;

  String get baseUrl => 'https://api.myapp.com';
  String get endpoint => 'api/development';

  @override
  String get authBaseUrl => '$baseUrl/$endpoint';

  @override
  String get userBaseUrl => '$baseUrl/$endpoint';

  @override
  String get paymentBaseUrl => '$baseUrl/$endpoint';

  @override
  bool get enableLogging => false;
}
