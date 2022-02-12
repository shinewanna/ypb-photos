import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ypb_photos/app/core/configs/app_constant.dart';
import 'package:ypb_photos/app/core/utils/output.dart';
import 'package:ypb_photos/app/modules/editor/widgets/setting_panel.dart';

import 'editor_controller.dart';

class EditorView extends GetView<EditorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstant.def.appName),
        centerTitle: true,
      ),
      backgroundColor: AppConstant.color.g,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Obx(
                  () => Output(
                    controller.cameraResp.value,
                    onData: (CameraController data) => CameraPreview(data),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: ElevatedButton(
                      onPressed: controller.saveImage,
                      child: const Text(''),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: const EdgeInsets.all(20),
                      ),
                    )),
              ],
            ),
          ),
          SettingPannel(),
        ],
      ),
    );
  }
}
