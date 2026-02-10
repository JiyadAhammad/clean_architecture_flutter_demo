import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/request_model/request_model.dart';
import '../entities/auth_user_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, AuthUserEntity>> login({
    required LoginRequestModel loginRequest,
  });
}
