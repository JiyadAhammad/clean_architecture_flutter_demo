import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/auth_user_entity.dart';
import '../repositories/i_auth_repository.dart';

class LoginUseCase implements UseCase<AuthUserEntity, LoginRequestParam> {
  LoginUseCase(this.repository);
  final IAuthRepository repository;

  @override
  Future<Either<Failure, AuthUserEntity>> call(LoginRequestParam request) {
    return repository.login(loginRequestParam: request);
  }
}

class LoginRequestParam {
  const LoginRequestParam({required this.username, required this.password});
  final String username;
  final String password;
}
