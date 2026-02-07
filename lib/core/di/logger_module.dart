import '../config/app_config.dart';
import '../logger/app_logger.dart';
import '../logger/logger_service.dart';
import 'injection_container.dart';

void registerLogger() {
  final AppConfig config = sl<AppConfig>();

  sl.registerLazySingleton<AppLogger>(
    () => LoggerService(enableLogging: config.enableLogging),
  );
}
