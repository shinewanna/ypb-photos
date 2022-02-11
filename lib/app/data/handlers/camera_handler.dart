import 'package:camera/camera.dart';
import 'package:print_color/print_color.dart';

class CameraHandler {
  static List<CameraDescription>? cameras;

  static Future<void> setCameras() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      Print.red('Camera Not Found $e');
    }
  }
}
