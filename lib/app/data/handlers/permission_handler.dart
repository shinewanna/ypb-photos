import 'package:permission_handler/permission_handler.dart';
import 'package:ypb_photos/app/core/utils/app_util.dart';

class PermissionHandler {
  Future<bool> reqStorage() async {
    final req = await Permission.storage.request();
    if (!req.isGranted) {
      AppUtil.errSnack('Need storage permission to save image');
      return false;
    }
    return true;
  }
}
