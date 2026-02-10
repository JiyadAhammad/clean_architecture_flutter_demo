import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/request_model/request_model.dart';
import '../entities/auth_user_entity.dart';
import '../repositories/i_auth_repository.dart';

class LoginUseCase {
  LoginUseCase(this.repository);
  final IAuthRepository repository;

  Future<Either<Failure, AuthUserEntity>> call(LoginRequestModel request) {
    return repository.login(loginRequest: request);
  }
}
