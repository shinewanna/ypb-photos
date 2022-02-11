import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ypb_photos/app/core/configs/app_constant.dart';
import 'package:ypb_photos/app/modules/editor/editor_controller.dart';
import 'package:ypb_photos/app/modules/editor/widgets/widgets/photos_row.dart';
import 'package:ypb_photos/app/modules/editor/widgets/widgets/text_slider.dart';
import 'package:ypb_photos/app/modules/editor/widgets/widgets/width_height_row.dart';

class SettingPannel extends GetView<EditorController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      color: AppConstant.color.p,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextSlider(
            title: 'Exposure',
            slider: Obx(
              () => Slider(
                value: controller.exposure,
                min: 0.0,
                max: 2.0,
                divisions: 50,
                onChanged: controller.updateExposure,
              ),
            ),
          ),
          TextSlider(
            title: 'Brightness&Contrast',
            slider: Obx(
              () => Slider(
                value: controller.brightnessAndContrast,
                min: -1.0,
                max: 1.0,
                divisions: 50,
                onChanged: controller.updateBrightnessAndContrast,
              ),
            ),
          ),
          TextSlider(
            title: 'Saturation',
            slider: Obx(
              () => Slider(
                value: controller.saturation,
                min: 0.0,
                max: 2.0,
                divisions: 50,
                onChanged: controller.updateSaturation,
              ),
            ),
          ),
          TextSlider(
            title: 'Visibility',
            slider: Obx(
              () => Slider(
                value: controller.visibility,
                min: 0.0,
                max: 1.0,
                divisions: 50,
                onChanged: controller.updateVisibility,
              ),
            ),
          ),
          WidthHeightRow(),
          PhotosRow(),
        ],
      ),
    );
  }
}
