import 'package:dummy_clean_architecture/core/error/failure.dart';
import 'package:dummy_clean_architecture/features/auth/domain/entities/auth_user_entity.dart';
import 'package:dummy_clean_architecture/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:dummy_clean_architecture/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late LoginUseCase loginUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(mockAuthRepository);
  });

  setUpAll(() {
    registerFallbackValue(
      const LoginRequestParam(
        username: 'dheerajpalbmu@gmail.com',
        password: '12345678',
      ),
    );
  });

  // const String username = ;
  // const String password = ;

  const LoginRequestParam loginRequest = LoginRequestParam(
    username: 'dheerajpalbmu@gmail.com',
    password: '12345678',
  );

  group('Auth :-', () {
    group('login :-', () {
      test('returns AuthUserEntity when login succeeds', () async {
        // Arrange
        const AuthUserEntity response = AuthUserEntity(
          token: 'token',
          userId: 1746,
          fullName: 'Dheeraj Student Student',
          firstName: 'Dheeraj Student',
          lastName: 'Student',
          email: 'dheerajpalbmu@gmail.com',
          mobile: '918853825654',
        );
        when(
          () => mockAuthRepository.login(loginRequestParam: loginRequest),
        ).thenAnswer(
          (_) async => const Right<Failure, AuthUserEntity>(response),
        );
        // Act
        final Either<Failure, AuthUserEntity> result = await loginUseCase(
          loginRequest,
        );
        // Assert
        expect(result, const Right<Failure, AuthUserEntity>(response));
        verify(
          () => mockAuthRepository.login(loginRequestParam: loginRequest),
        ).called(1);
        verifyNoMoreInteractions(mockAuthRepository);
      });

      test('returns AuthFailure when login fails', () async {
        const AuthFailure failure = AuthFailure('Invalid credentials');
        when(
          () => mockAuthRepository.login(loginRequestParam: loginRequest),
        ).thenAnswer((_) async => const Left<Failure, AuthUserEntity>(failure));

        final Either<Failure, AuthUserEntity> result = await loginUseCase(
          loginRequest,
        );

        expect(result, const Left<Failure, AuthUserEntity>(failure));
        verify(
          () => mockAuthRepository.login(loginRequestParam: loginRequest),
        ).called(1);
      });
    });
  });
}
