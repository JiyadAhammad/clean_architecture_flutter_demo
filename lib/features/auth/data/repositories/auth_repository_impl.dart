import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/api_response.dart';
import '../../../../core/storage/secure_storage_service_impl.dart';
import '../../domain/entities/auth_user_entity.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../mappers/auth_user_mapper.dart';
import '../models/request_model/request_model.dart';
import '../models/response_model/auth_user_model.dart';

class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl(this._dataSource, this.local);
  final AuthRemoteDataSource _dataSource;
  final SecureStorageServiceImpl local;
  @override
  Future<Either<Failure, AuthUserEntity>> login({
    required LoginRequestModel loginRequest,
  }) async {
    final ApiResponse<AuthUserResponseModel> response = await _dataSource.login(
      loginRequest: loginRequest,
    );
    if (response.data == null) {
      return left(AuthFailure(response.message ?? 'Login failed'));
    }
    if (response.data?.token != null) {
      // Save token
      await local.saveUserData(response.data!);
    }

    final AuthUserEntity userEntity = response.data!.toEntity();

    return right(userEntity);
  }
}
