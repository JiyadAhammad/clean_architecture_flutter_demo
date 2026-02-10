part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  /// Initial idle state
  const factory AuthState.initial() = _Initial;

  /// API call in progress
  const factory AuthState.loading() = _Loading;

  /// Login success
  const factory AuthState.authenticated(AuthUserEntity user) = _Authenticated;

  /// Login failed
  const factory AuthState.error(String message) = _Error;
}
