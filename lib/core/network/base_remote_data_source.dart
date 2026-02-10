import 'package:dio/dio.dart';

import '../error/exceptions.dart';

abstract class BaseRemoteDataSource {
  Future<T> request<T>(Future<T> Function() call);
}

class BaseRemoteDataSourceImpl implements BaseRemoteDataSource {
  @override
  Future<T> request<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on DioException catch (e) {
      throw AppException.fromDio(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
