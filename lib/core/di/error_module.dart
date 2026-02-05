import '../error/dio_error_mapper.dart';
import 'injection_container.dart';

void registerError() {
  sl.registerLazySingleton<DioErrorMapper>(() => DioErrorMapper());
}
