import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ypb_photos/app/core/configs/app_constant.dart';
import 'package:ypb_photos/app/core/utils/app_util.dart';
import 'package:ypb_photos/app/core/utils/output.dart';
import 'package:ypb_photos/app/modules/editor/widgets/setting_panel.dart';
import 'package:ypb_photos/app/modules/widgets/nth.dart';

import 'editor_controller.dart';

class EditorView extends GetView<EditorController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppUtil.removeFocus(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppConstant.def.appName),
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
                      onData: (CameraController data) => SizedBox(
                        height: double.infinity,
                        child: CameraPreview(data),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: ElevatedButton(
                        onPressed: () {
                          AppUtil.removeFocus(context);
                          controller.saveImage();
                        },
                        child: Nth(),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: const EdgeInsets.all(30),
                          enableFeedback: true,
                          elevation: 1.0,
                        ),
                      )),
                ],
              ),
            ),
            SettingPannel(),
          ],
        ),
      ),
    );
  }
}
