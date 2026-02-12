import 'package:dummy_clean_architecture/core/error/failure.dart';
import 'package:dummy_clean_architecture/core/models/api_response.dart';
import 'package:dummy_clean_architecture/core/storage/secure_storage_service.dart';
import 'package:dummy_clean_architecture/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:dummy_clean_architecture/features/auth/data/models/request_model/login_request_model.dart';
import 'package:dummy_clean_architecture/features/auth/data/models/response_model/auth_user_model.dart';
import 'package:dummy_clean_architecture/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:dummy_clean_architecture/features/auth/domain/entities/auth_user_entity.dart';
import 'package:dummy_clean_architecture/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements IAuthRemoteDataSource {}

class MockSecureStorageService extends Mock implements SecureStorageService {}

void main() {
  late AuthRepositoryImpl authRepository;
  late MockSecureStorageService mockSecureStorageService;
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockSecureStorageService = MockSecureStorageService();
    authRepository = AuthRepositoryImpl(
      mockAuthRemoteDataSource,
      mockSecureStorageService,
    );
  });

  setUpAll(() {
    registerFallbackValue(
      const LoginRequestModel(username: 'test@gmail.com', password: '123456'),
    );
  });

  group('Auth Repository', () {
    const LoginRequestParam request = LoginRequestParam(
      username: 'test@gmail.com',
      password: '123456',
    );
    const AuthUserResponseModel responseModel = AuthUserResponseModel(
      token: 'token',
      userId: 1746,
      fullName: 'Dheeraj Student Student',
      firstName: 'Dheeraj Student',
      lastName: 'Student',
      email: 'dheerajpalbmu@gmail.com',
      mobile: '918853825654',
    );
    test('returns AuthUser and saves token when login succeeds', () async {
      // Arrange

      when(
        () => mockAuthRemoteDataSource.login(
          loginRequest: LoginRequestModel(
            username: request.username,
            password: request.password,
          ),
        ),
      ).thenAnswer(
        (_) async => const ApiResponse<AuthUserResponseModel>(
          data: responseModel,
          message: 'success',
          success: true,
        ),
      );

      when(
        () => mockSecureStorageService.saveUserData(responseModel),
      ).thenAnswer((_) async {});

      // Act
      final Either<Failure, AuthUserEntity> result = await authRepository.login(
        loginRequestParam: request,
      );

      // Assert
      expect(result.isRight(), true);

      verify(
        () => mockAuthRemoteDataSource.login(
          loginRequest: LoginRequestModel(
            username: request.username,
            password: request.password,
          ),
        ),
      ).called(1);
      verify(
        () => mockSecureStorageService.saveUserData(responseModel),
      ).called(1);
    });

    test('returns Failure when remote throws error', () async {
      when(
        () => mockAuthRemoteDataSource.login(
          loginRequest: LoginRequestModel(
            username: request.username,
            password: request.password,
          ),
        ),
      ).thenThrow(Exception('API Error'));

      final Either<Failure, AuthUserEntity> result = await authRepository.login(
        loginRequestParam: request,
      );

      expect(result.isLeft(), true);

      verifyNever(
        () => mockSecureStorageService.saveUserData(responseModel),
      ).called(0);
    });
  });
}
