import 'package:get/get.dart';

import 'editor_controller.dart';

class EditorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorController>(
      () => EditorController(),
    );
  }
}
