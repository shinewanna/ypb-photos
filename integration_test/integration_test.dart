import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path/path.dart';
import 'package:print_color/print_color.dart';
import 'package:ypb_photos/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Full app test', (tester) async {
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
    app.main();
    await tester.pumpAndSettle(Duration(seconds: 1));
    final startBtn = find.text('Start');
    await tester.tap(startBtn);
    await tester.pumpAndSettle(Duration(seconds: 1));
  });
}
