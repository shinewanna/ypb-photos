import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ypb_photos/app/modules/editor/editor_controller.dart';
import 'package:ypb_photos/app/modules/widgets/custom_textfield.dart';

class WidthHeightRow extends GetView<EditorController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Width'),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: CustomTextField(
            keyboardType: TextInputType.number,
          ),
        )),
        Text('Height'),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: CustomTextField(
            keyboardType: TextInputType.number,
          ),
        )),
      ],
    );
  }
}
