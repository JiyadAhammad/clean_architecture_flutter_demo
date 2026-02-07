import 'package:dio/dio.dart';

import '../config/app_config.dart';
import '../constants/app_constants.dart';
import '../logger/app_logger.dart';
import '../network/interceptors/auth_interceptor.dart';
import '../network/interceptors/cache_interceptor.dart';
import '../network/interceptors/error_interceptor.dart';
import '../network/interceptors/logging_interceptor.dart';
import '../network/interceptors/retry_interceptor.dart';
import '../storage/secure_storage_service.dart';
import 'injection_container.dart';

void registerNetwork() {
  final AppConfig config = sl<AppConfig>();
  final AppLogger logger = sl<AppLogger>();
  final SecureStorageService storage = sl<SecureStorageService>();

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: config.authBaseUrl,
      connectTimeout: const Duration(
        seconds: AppConstants.connectTimeoutSeconds,
      ),
      receiveTimeout: const Duration(
        seconds: AppConstants.receiveTimeoutSeconds,
      ),
    ),
  );

  dio.interceptors.addAll(<Interceptor>[
    AuthInterceptor(storage, dio),
    CacheInterceptor(),
    RetryInterceptor(dio, logger),
    LoggingInterceptor(logger),
    ErrorInterceptor(logger),
  ]);

  sl.registerLazySingleton<Dio>(() => dio);
}
