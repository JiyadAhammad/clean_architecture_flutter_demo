import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/auth_user_entity.dart';
import '../usecases/login_usecase.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, AuthUserEntity>> login({
    required LoginRequestParam loginRequestParam,
  });
}
