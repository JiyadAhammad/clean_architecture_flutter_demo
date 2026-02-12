import 'package:dio/dio.dart';

import '../../core/di/injection_container.dart';
import '../../core/storage/secure_storage_service.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/i_auth_repository.dart';
import 'domain/usecases/login_usecase.dart';
import 'presentation/bloc/auth_bloc.dart';

void registerAuthFeature() {
  /// Data source
  sl.registerLazySingleton<IAuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<Dio>()),
  );

  /// Repository
  sl.registerLazySingleton<IAuthRepository>(
    () => AuthRepositoryImpl(
      sl<IAuthRemoteDataSource>(),
      sl<SecureStorageService>(),
    ),
  );

  /// Use case
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(sl<IAuthRepository>()),
  );

  /// Bloc (factory because UI lifecycle)
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(loginUseCase: sl<LoginUseCase>()),
  );
}
