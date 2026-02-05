import 'package:dummy_clean_architecture/core/storage/secure_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/storage_keys.dart';

class SecureStorageServiceImpl implements SecureStorageService {
  static const _tokenKey = StorageKeys.accessToken;
  static const _refreshTokenKey = StorageKeys.refreshToken;

  final FlutterSecureStorage _storage;

  SecureStorageServiceImpl(this._storage);

  @override
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getAccessToken() async {
    return _storage.read(key: _tokenKey);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  @override
  Future<String?> getRefreshToken() async {
    return _storage.read(key: _refreshTokenKey);
  }

  @override
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
