import 'package:dio/dio.dart';

import '../../logger/app_logger.dart';

class RetryInterceptor extends Interceptor {
  RetryInterceptor(this.dio, this.logger);
  final Dio dio;
  final AppLogger logger;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_shouldRetry(err)) {
      logger.warning('Retrying request...');
      await Future<Duration>.delayed(const Duration(seconds: 2));
      handler.resolve(await dio.fetch(err.requestOptions));
    } else {
      handler.next(err);
    }
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout;
  }
}
