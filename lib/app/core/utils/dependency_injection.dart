import 'package:get/instance_manager.dart';
import 'package:ypb_photos/app/data/handlers/file_handler.dart';

class DependencyInjection {
  DependencyInjection.inject() {
    Get.put(FileHandler(), permanent: true);
  }
}
