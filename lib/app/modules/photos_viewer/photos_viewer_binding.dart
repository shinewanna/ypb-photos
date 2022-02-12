import 'package:get/get.dart';

import 'photos_viewer_controller.dart';

class PhotosViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotosViewerController>(
      () => PhotosViewerController(),
    );
  }
}
