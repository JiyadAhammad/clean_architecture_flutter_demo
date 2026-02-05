abstract class SecureStorageService {
  Future<String?> getAccessToken();
  Future<void> saveAccessToken(String token);
  Future<void> saveRefreshToken(String token);
  Future<String?> getRefreshToken();
  Future<void> clearAll();
}
