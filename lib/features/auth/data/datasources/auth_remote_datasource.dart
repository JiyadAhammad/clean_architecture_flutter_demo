import 'package:dio/dio.dart';
import 'package:dummy_clean_architecture/core/models/api_response.dart';
import 'package:dummy_clean_architecture/core/network/api_endpoints.dart';
import 'package:dummy_clean_architecture/features/auth/data/models/request_model/request_model.dart';
import 'package:dummy_clean_architecture/features/auth/data/models/response_model/auth_user_model.dart';

import '../../../../core/network/api_response_mapper.dart';
import '../../../../core/network/base_remote_data_source.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResponse<AuthUserResponseModel>> login({
    required LoginRequestModel loginRequest,
  });
  Future<ApiResponse<AuthUserResponseModel>> register({
    required String name,
    required String email,
    required String password,
  });
  Future<void> logout();
}

class AuthRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<ApiResponse<AuthUserResponseModel>> login({
    required LoginRequestModel loginRequest,
  }) {
    return request(() async {
      final res = await dio.post(
        ApiEndpoints.login,
        data: loginRequest.toJson(),
      );

      return ApiResponseMapper.fromJson(
        res.data,
        AuthUserResponseModel.fromJson,
      );
    });
  }

  @override
  Future<ApiResponse<AuthUserResponseModel>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final res = await dio.post(
      ApiEndpoints.register,
      data: {'name': name, 'email': email, 'password': password},
    );
    return ApiResponseMapper.fromJson(res.data, AuthUserResponseModel.fromJson);
  }

  @override
  Future<void> logout() async {
    await dio.post(ApiEndpoints.logout);
  }
}
