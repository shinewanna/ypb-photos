import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_image_matrix/on_image_matrix.dart';
import 'package:print_color/print_color.dart';
import 'package:ypb_photos/app/core/configs/app_constant.dart';
import 'package:ypb_photos/app/core/utils/output.dart';
import 'package:ypb_photos/app/modules/editor/widgets/setting_panel.dart';

import 'editor_controller.dart';

class EditorView extends GetView<EditorController> {
  final _imageController = OnImageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditorView'),
        centerTitle: true,
      ),
      backgroundColor: AppConstant.color.g,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Obx(
                  () => OnImageMatrixWidget.builder(
                    controller: _imageController,
                    imageKey: GlobalKey(),
                    colorFilter: OnImageMatrix.matrix(
                      exposure: controller.exposure,
                      brightnessAndContrast: controller.brightnessAndContrast,
                      saturation: controller.saturation,
                      visibility: controller.visibility,
                    ),
                    imageFormat: ImageByteFormat.rawRgba,
                    child: Obx(
                      () => Output(
                        controller.cameraResp.value,
                        onData: (CameraController data) => CameraPreview(data),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: InkResponse(
                    onTap: () {
                      Print.green('Saved Image');
                    },
                    child: CircleAvatar(
                      radius: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SettingPannel(),
        ],
      ),
    );
  }
}
