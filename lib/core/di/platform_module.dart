import 'package:device_info_plus/device_info_plus.dart';

import '../platform/device_info_service.dart';
import 'injection_container.dart';

void registerPlatform() {
  sl.registerLazySingleton<DeviceInfoPlugin>(() => DeviceInfoPlugin());

  sl.registerLazySingleton<DeviceInfoService>(
    () => DeviceInfoServiceImpl(sl()),
  );
}
