import 'dart:io';

import 'package:integration_test/integration_test_driver.dart';
import 'package:path/path.dart';
import 'package:print_color/print_color.dart';

void main() async {
  final envVars = Platform.environment;
  Print.green(envVars);
  final adbPath = join(
    envVars['ANDROID_SDK_ROOT'] ?? envVars['ANDROID_HOME']!,
    'platform-tools',
    Platform.isWindows ? 'adb.exe' : 'adb',
  );
  await Process.run(adbPath, [
    'shell',
    'pm',
    'grant',
    'com.swn.ypb_photos',
    'android.permission.CAMERA'
  ]);
  await Process.run(adbPath, [
    'shell',
    'pm',
    'grant',
    'com.swn.ypb_photos',
    'android.permission.WRITE_EXTERNAL_STORAGE'
  ]);

  await integrationDriver();
}
