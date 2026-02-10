import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/auth/data/models/response_model/auth_user_model.dart';
import '../constants/storage_keys.dart';
import 'secure_storage_service.dart';

class SecureStorageServiceImpl implements SecureStorageService {
  SecureStorageServiceImpl(this._storage);
  static const String _tokenKey = StorageKeys.accessToken;
  static const String _refreshTokenKey = StorageKeys.refreshToken;

  final FlutterSecureStorage _storage;

  @override
  Future<void> saveUserData(AuthUserResponseModel authResponse) async {
    await _storage.write(key: _tokenKey, value: jsonEncode(authResponse));
  }

  @override
  Future<AuthUserResponseModel?> getUserData() async {
    final String? userData = await _storage.read(key: _tokenKey);
    if (userData == null) {
      return null;
    }
    final dynamic result = jsonDecode(userData);
    return AuthUserResponseModel.fromJson(result as Map<String, dynamic>);
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
