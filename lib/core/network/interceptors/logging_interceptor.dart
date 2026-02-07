import 'package:dio/dio.dart';

import '../../logger/app_logger.dart';

class LoggingInterceptor extends Interceptor {
  LoggingInterceptor(this.logger);
  final AppLogger logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.debug('➡️ ${options.method} ${options.baseUrl}${options.path}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logger.success('✅ ${response.statusCode} ${response.requestOptions.path}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.error(
      '❌ ${err.requestOptions.path}',
      error: err,
      stackTrace: err.stackTrace,
    );
    handler.next(err);
  }
}
