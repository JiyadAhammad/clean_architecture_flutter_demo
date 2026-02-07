import 'dart:async';

import 'package:dio/dio.dart';

import '../../constants/api_headers.dart';
import '../../storage/secure_storage_service.dart';
import '../api_endpoints.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.storage, this.dio);
  final SecureStorageService storage;
  final Dio dio;

  bool _isRefreshing = false;
  final List<Completer<Response<dynamic>>> _refreshQueue =
      <Completer<Response<dynamic>>>[];

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await storage.getAccessToken();
    options.headers[ApiHeaders.apiKey] = ApiHeaders.apiKeyValue;
    if (token != null && token.isNotEmpty) {
      options.headers[ApiHeaders.authorization] = '${ApiHeaders.bearer} $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
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
    final Completer<Response<dynamic>> completer =
        Completer<Response<dynamic>>();
    _refreshQueue.add(completer);

    if (!_isRefreshing) {
      _isRefreshing = true;

      try {
        final String newToken = await _refreshToken();
        await storage.saveAccessToken(newToken);

        for (final Completer<Response<dynamic>> c in _refreshQueue) {
          c.complete(await _retry(err.requestOptions));
        }
      } catch (_) {
        for (final Completer<Response<dynamic>> c in _refreshQueue) {
          c.completeError(err);
        }
      } finally {
        _refreshQueue.clear();
        _isRefreshing = false;
      }
    }

    try {
      final Response<dynamic> response = await completer.future;
      handler.resolve(response);
    } catch (e) {
      handler.next(err);
    }
  }

  Future<String> _refreshToken() async {
    final String? refreshToken = await storage.getRefreshToken();

    final Response<dynamic> response = await dio.post(
      ApiEndpoints.refreshToken,
      data: <String, String?>{'refresh_token': refreshToken},
      options: Options(
        headers: <String, dynamic>{ApiHeaders.authorization: null},
      ),
    );

    return response.data['access_token'] as String;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    requestOptions.extra['retry'] = true;

    return dio.fetch(requestOptions);
  }
}
