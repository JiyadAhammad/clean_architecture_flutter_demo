part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = _LoginRequested;
}
