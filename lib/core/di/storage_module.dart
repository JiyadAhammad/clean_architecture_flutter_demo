import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../storage/secure_storage_service.dart';
import '../storage/secure_storage_service_impl.dart';
import 'injection_container.dart';

Future<void> registerStorage() async {
  sl.registerLazySingleton<SecureStorageService>(
    () => SecureStorageServiceImpl(const FlutterSecureStorage()),
  );
}
