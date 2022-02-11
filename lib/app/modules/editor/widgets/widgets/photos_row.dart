import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ypb_photos/app/modules/editor/editor_controller.dart';

class PhotosRow extends GetView<EditorController> {
  @override
  Widget build(BuildContext context) {
    final _defaultPhotosRange = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10'
    ];
    return Row(
      children: [
        SizedBox(
          width: Get.width / 2,
          child: Text('Photos'),
        ),
        VxTextDropDown(
          _defaultPhotosRange,
          selectedValue: '4',
          onChanged: (e) {},
        ).make(),
      ],
    );
  }
}
