import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

class PlatformInfo {
  PlatformInfo._();

  static bool get isWeb => kIsWeb;

  static bool get isAndroid => !kIsWeb && Platform.isAndroid;

  static bool get isIOS => !kIsWeb && Platform.isIOS;

  static bool get isMobile => isAndroid || isIOS;

  static bool get isDesktop =>
      !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
}
