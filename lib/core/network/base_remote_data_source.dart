import 'package:dio/dio.dart';

abstract class BaseRemoteDataSource {
  Future<T> request<T>(Future<T> Function() call);
}

class BaseRemoteDataSourceImpl implements BaseRemoteDataSource {
  @override
  Future<T> request<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on DioException {
      rethrow;
    }
  }
}
