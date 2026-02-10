import 'dart:convert';
import 'package:dio/dio.dart';
import '../../logger/app_logger.dart';

class LoggingInterceptor extends Interceptor {
  LoggingInterceptor(this.logger);

  final AppLogger logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.debug('➡️ API REQUEST');

    logger.debug('URL: ${options.method} ${options.baseUrl}${options.path}');

    if (options.headers.isNotEmpty) {
      final Map<String, dynamic> headers = Map<String, dynamic>.from(
        options.headers,
      );

      // Mask token for security
      if (headers.containsKey('Authorization')) {
        headers['Authorization'] = 'Bearer ****';
      }

      logger.debug('Headers: ${jsonEncode(headers)}');
    }

    if (options.queryParameters.isNotEmpty) {
      logger.debug('Query Params: ${jsonEncode(options.queryParameters)}');
    }

    if (options.data != null) {
      logger.debug('Body: ${_prettyJson(options.data)}');
    }

    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logger.success('✅ API RESPONSE');

    logger.success(
      'Status: ${response.statusCode} | ${response.requestOptions.path}',
    );

    if (response.data != null) {
      logger.success('Response: ${_prettyJson(response.data)}');
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.error('❌ API ERROR');

    logger.error('URL: ${err.requestOptions.path}');

    logger.error(
      'Message: ${err.message}',
      error: err,
      stackTrace: err.stackTrace,
    );

    if (err.response != null) {
      logger.error('Status: ${err.response?.statusCode}');

      if (err.response?.data != null) {
        logger.error('Error Response: ${_prettyJson(err.response?.data)}');
      }
    }

    handler.next(err);
  }

  String _prettyJson(dynamic data) {
    try {
      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(data);
    } catch (_) {
      return data.toString();
    }
  }
}
