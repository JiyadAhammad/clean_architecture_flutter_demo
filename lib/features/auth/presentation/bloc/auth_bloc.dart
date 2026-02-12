import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/logger/app_logger.dart';
import '../../domain/entities/auth_user_entity.dart';
import '../../domain/usecases/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(const _Initial()) {
    on<_LoginRequested>(_onLogin);
  }
  final LoginUseCase _loginUseCase;

  Future<void> _onLogin(_LoginRequested event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final Either<Failure, AuthUserEntity> result = await _loginUseCase.call(
      LoginRequestParam(username: event.username, password: event.password),
    );

    sl<AppLogger>().warning('${result.getRight()} right result bloc');

    result.fold(
      (Failure failure) => emit(AuthState.error(failure.message)),
      (AuthUserEntity user) => emit(AuthState.authenticated(user)),
    );
  }
}
