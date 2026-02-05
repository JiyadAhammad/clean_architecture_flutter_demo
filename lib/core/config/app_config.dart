import '../env/app_environment.dart';

abstract class AppConfig {
  AppEnvironment get environment;

  // Microservice Base URLs
  String get authBaseUrl;
  String get userBaseUrl;
  String get paymentBaseUrl;

  // App behavior flags
  bool get enableLogging;
}
