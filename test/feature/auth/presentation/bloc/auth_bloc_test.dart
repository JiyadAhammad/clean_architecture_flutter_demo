import 'package:bloc_test/bloc_test.dart';
import 'package:dummy_clean_architecture/core/error/failure.dart';
import 'package:dummy_clean_architecture/features/auth/domain/entities/auth_user_entity.dart';
import 'package:dummy_clean_architecture/features/auth/domain/usecases/login_usecase.dart';
import 'package:dummy_clean_architecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

void main() {
  late MockLoginUseCase mockLoginUseCase;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
  });

  setUpAll(() {
    registerFallbackValue(
      const LoginRequestParam(username: 'test@gmail.com', password: '123456'),
    );
  });

  blocTest<AuthBloc, AuthState>(
    'emits [loading, authenticated] on success',
    build: () {
      when(() => mockLoginUseCase(any())).thenAnswer(
        (_) async => const Right<Failure, AuthUserEntity>(
          AuthUserEntity(
            firstName: 'Test',
            lastName: 'val',
            token: 'token',
            userId: 1,
            fullName: 'Test val',
            email: 'test@gmail.com',
          ),
        ),
      );
      return AuthBloc(loginUseCase: mockLoginUseCase);
    },
    act: (AuthBloc bloc) => bloc.add(
      const AuthEvent.loginRequested(
        username: 'test@gmail.com',
        password: 'test val',
      ),
    ),
    expect: () => [
      const AuthState.loading(),
      predicate<AuthState>(
        (AuthState state) =>
            state.maybeWhen(authenticated: (_) => true, orElse: () => false),
      ),
    ],
  );

  blocTest<AuthBloc, AuthState>(
    'emits [loading, error] on failure',
    build: () {
      when(() => mockLoginUseCase(any())).thenAnswer(
        (_) async =>
            const Left<Failure, AuthUserEntity>(AuthFailure('Invalid')),
      );
      return AuthBloc(loginUseCase: mockLoginUseCase);
    },
    act: (AuthBloc bloc) => bloc.add(
      const AuthEvent.loginRequested(
        username: 'test@gmail.com',
        password: 'test val',
      ),
    ),
    expect: () => <AuthState>[
      const AuthState.loading(),
      const AuthState.error('Invalid'),
    ],
  );
}
