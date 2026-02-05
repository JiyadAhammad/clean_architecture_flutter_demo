import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dummy_clean_architecture/core/network/api_endpoints.dart';

import '../../constants/api_headers.dart';
import '../../storage/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService storage;
  final Dio dio;

  AuthInterceptor(this.storage, this.dio);

  bool _isRefreshing = false;
  final _refreshQueue = <Completer<Response>>[];

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.getAccessToken();
    options.headers[ApiHeaders.apiKey] = ApiHeaders.apiKeyValue;
    if (token != null && token.isNotEmpty) {
      options.headers[ApiHeaders.authorization] = '${ApiHeaders.bearer} $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, handler) async {
    if (_shouldRefresh(err)) {
      return _handleRefresh(err, handler);
    }
    handler.next(err);
  }

  bool _shouldRefresh(DioException err) {
    return err.response?.statusCode == 401 &&
        err.requestOptions.extra['retry'] != true;
  }

  Future<void> _handleRefresh(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final completer = Completer<Response>();
    _refreshQueue.add(completer);

    if (!_isRefreshing) {
      _isRefreshing = true;

      try {
        final newToken = await _refreshToken();
        await storage.saveAccessToken(newToken);

        for (final c in _refreshQueue) {
          c.complete(await _retry(err.requestOptions));
        }
      } catch (_) {
        for (final c in _refreshQueue) {
          c.completeError(err);
        }
      } finally {
        _refreshQueue.clear();
        _isRefreshing = false;
      }
    }

    try {
      final response = await completer.future;
      handler.resolve(response);
    } catch (e) {
      handler.next(err);
    }
  }

  Future<String> _refreshToken() async {
    final refreshToken = await storage.getRefreshToken();

    final response = await dio.post(
      ApiEndpoints.refreshToken,
      data: {'refresh_token': refreshToken},
      options: Options(headers: {ApiHeaders.authorization: null}),
    );

    return response.data['access_token'];
  }

  Future<Response> _retry(RequestOptions requestOptions) {
    requestOptions.extra['retry'] = true;

    return dio.fetch(requestOptions);
  }
}
