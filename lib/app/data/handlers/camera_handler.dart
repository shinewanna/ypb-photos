import 'package:camera/camera.dart';

class CameraHandler {
  CameraController? controller;
  static List<CameraDescription>? cameras;

  CameraHandler.createController() {
    controller = CameraController(
      CameraHandler.cameras![0],
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
  }

  static Future<void> setCameras() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      throw Exception('[Error]CameraHandler: $e');
    }
  }

  Future<void> initialize() async {
    await controller!.initialize();
    controller!.setFlashMode(FlashMode.off);
  }
}
