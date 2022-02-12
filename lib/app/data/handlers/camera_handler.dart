import 'package:camera/camera.dart';

class CameraHandler {
  static List<CameraDescription>? cameras;

  static Future<void> setCameras() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      throw Exception('[Error]CameraHandler: $e');
    }
  }
}
