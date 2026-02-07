import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'platform_info.dart';

abstract class DeviceInfoService {
  Future<Map<String, dynamic>> getDeviceInfo();
}

class DeviceInfoServiceImpl implements DeviceInfoService {
  DeviceInfoServiceImpl(this._deviceInfo);
  final DeviceInfoPlugin _deviceInfo;

  @override
  Future<Map<String, dynamic>> getDeviceInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    if (PlatformInfo.isAndroid) {
      final AndroidDeviceInfo android = await _deviceInfo.androidInfo;
      return <String, dynamic>{
        'platform': 'android',
        'device_model': android.model,
        'os_version': android.version.release,
        'app_version': packageInfo.version,
        'build_number': packageInfo.buildNumber,
      };
    }

    if (PlatformInfo.isIOS) {
      final IosDeviceInfo ios = await _deviceInfo.iosInfo;
      return <String, dynamic>{
        'platform': 'ios',
        'device_model': ios.utsname.machine,
        'os_version': ios.systemVersion,
        'app_version': packageInfo.version,
        'build_number': packageInfo.buildNumber,
      };
    }

    return <String, dynamic>{
      'platform': 'unknown',
      'app_version': packageInfo.version,
    };
  }
}
