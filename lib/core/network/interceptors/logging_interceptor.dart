import 'package:dio/dio.dart';

import '../../logger/app_logger.dart';

class LoggingInterceptor extends Interceptor {
  final AppLogger logger;

  LoggingInterceptor(this.logger);

  @override
  void onRequest(RequestOptions options, handler) {
    logger.debug('➡️ ${options.method} ${options.baseUrl}${options.path}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, handler) {
    logger.success('✅ ${response.statusCode} ${response.requestOptions.path}');
    handler.next(response);
  }

  @override
  void onError(DioException err, handler) {
    logger.error(
      '❌ ${err.requestOptions.path}',
      error: err,
      stackTrace: err.stackTrace,
    );
    handler.next(err);
  }
}
