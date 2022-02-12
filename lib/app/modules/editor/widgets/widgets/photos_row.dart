import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ypb_photos/app/core/utils/app_util.dart';
import 'package:ypb_photos/app/modules/editor/editor_controller.dart';

class PhotosRow extends GetView<EditorController> {
  @override
  Widget build(BuildContext context) {
    final _defaultPhotosRange = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    return Row(
      children: [
        Text('Photos'),
        40.widthBox,
        Expanded(
          child: Obx(
            () => DropdownButton<int>(
              items: _defaultPhotosRange
                  .map((e) => DropdownMenuItem(
                        child: Text(e.toString()),
                        value: e,
                      ))
                  .toList(),
              value: controller.photosLimit,
              onChanged: controller.setPhotosLimit,
              onTap: () => AppUtil.removeFocus(context),
            ),
          ),
        ),
      ],
    );
  }
}
