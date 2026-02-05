import '../env/app_environment.dart';
import 'app_config.dart';

class ProdAppConfig implements AppConfig {
  @override
  AppEnvironment get environment => AppEnvironment.prod;

  String get baseUrl => 'https://api.myapp.com';

  @override
  String get authBaseUrl => baseUrl;

  @override
  String get userBaseUrl => baseUrl;

  @override
  String get paymentBaseUrl => baseUrl;

  @override
  bool get enableLogging => false;
}
