import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ypb_photos/app/modules/editor/editor_controller.dart';

class ExposureRow extends GetView<EditorController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Exposure'),
        Expanded(
          child: Obx(
            () => Slider(
              value: controller.exposure,
              min: -2.0,
              max: 2.0,
              divisions: 50,
              onChanged: controller.setExposure,
            ),
          ),
        ),
      ],
    );
  }
}
