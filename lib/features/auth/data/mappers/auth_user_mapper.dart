import '../../domain/entities/auth_user_entity.dart';
import '../models/response_model/auth_user_model.dart';

extension AuthUserMapper on AuthUserResponseModel {
  AuthUserEntity toEntity() {
    return AuthUserEntity(
      token: token ?? '',
      userId: userId ?? 0,
      fullName: fullName ?? '',
      email: email ?? '',
      mobile: mobile,
    );
  }
}
