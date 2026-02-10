import '../../features/auth/data/models/response_model/auth_user_model.dart';

abstract class SecureStorageService {
  Future<AuthUserResponseModel?> getUserData();
  Future<void> saveUserData(AuthUserResponseModel token);
  Future<void> saveRefreshToken(String token);
  Future<String?> getRefreshToken();
  Future<void> clearAll();
}
