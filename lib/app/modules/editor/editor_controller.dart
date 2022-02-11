import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:print_color/print_color.dart';
import 'package:ypb_photos/app/data/enums/msg_state.dart';
import 'package:ypb_photos/app/data/handlers/camera_handler.dart';
import 'package:ypb_photos/app/data/models/resp_model.dart';

class EditorController extends GetxController {
  CameraController? _cameraController;
  final cameraResp = Resp().obs;
  final _exposure = 0.0.obs;
  final _brightnessAndContrast = 0.0.obs;
  final _saturation = 1.0.obs;
  final _visibility = 1.0.obs;

  double get exposure => _exposure.value;

  double get brightnessAndContrast => _brightnessAndContrast.value;

  double get saturation => _saturation.value;

  double get visibility => _visibility.value;

  updateExposure(double value) => _exposure.value = value;

  updateBrightnessAndContrast(double value) =>
      _brightnessAndContrast.value = value;

  updateSaturation(double value) => _saturation.value = value;

  updateVisibility(double value) => _visibility.value = value;

  @override
  void onInit() {
    super.onInit();
    _cameraController =
        CameraController(CameraHandler.cameras![0], ResolutionPreset.max);
    _cameraController!.initialize().then((_) {
      cameraResp.value = Resp(data: _cameraController, message: MsgState.data);
    });
  }
}
