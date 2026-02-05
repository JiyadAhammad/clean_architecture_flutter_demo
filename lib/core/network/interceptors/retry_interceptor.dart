import 'package:dio/dio.dart';

import '../../logger/app_logger.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final AppLogger logger;

  RetryInterceptor(this.dio, this.logger);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_shouldRetry(err)) {
      logger.warning('Retrying request...');
      await Future.delayed(const Duration(seconds: 2));
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
