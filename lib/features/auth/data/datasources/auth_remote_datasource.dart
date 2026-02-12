import 'package:dio/dio.dart';

import '../../../../core/models/api_response.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/api_response_mapper.dart';
import '../../../../core/network/base_remote_data_source.dart';
import '../models/request_model/login_request_model.dart';
import '../models/response_model/auth_user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<ApiResponse<AuthUserResponseModel>> login({
    required LoginRequestModel loginRequest,
  });
  // Future<ApiResponse<AuthUserResponseModel>> register({
  //   required String name,
  //   required String email,
  //   required String password,
  // });
  // Future<void> logout();
}

class AuthRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.dio);
  final Dio dio;

  @override
  Future<ApiResponse<AuthUserResponseModel>> login({
    required LoginRequestModel loginRequest,
  }) {
    return request(() async {
      final Response<dynamic> res = await dio.post(
        ApiEndpoints.login,
        data: loginRequest.toJson(),
      );

      return ApiResponseMapper.fromJson(
        res.data as Map<String, dynamic>,
        AuthUserResponseModel.fromJson,
      );
    });
  }

  // @override
  // Future<ApiResponse<AuthUserResponseModel>> register({
  //   required String name,
  //   required String email,
  //   required String password,
  // }) async {
  //   final res = await dio.post(
  //     ApiEndpoints.register,
  //     data: {'name': name, 'email': email, 'password': password},
  //   );
  //   return ApiResponseMapper.fromJson(res.data, AuthUserResponseModel.fromJson);
  // }

  // @override
  // Future<void> logout() async {
  //   await dio.post(ApiEndpoints.logout);
  // }
}
