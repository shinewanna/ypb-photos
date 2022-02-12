import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ypb_photos/app/core/configs/app_constant.dart';
import 'package:ypb_photos/app/modules/editor/editor_controller.dart';
import 'package:ypb_photos/app/modules/editor/widgets/widgets/photos_row.dart';
import 'package:ypb_photos/app/modules/editor/widgets/widgets/exposure_row.dart';
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
          ExposureRow(),
          WidthHeightRow(),
          PhotosRow(),
        ],
      ),
    );
  }
}
