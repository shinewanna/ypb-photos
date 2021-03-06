import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ypb_photos/app/modules/editor/editor_controller.dart';
import 'package:ypb_photos/app/modules/widgets/custom_textfield.dart';

class WidthHeightRow extends GetView<EditorController> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Width'),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: CustomTextField(
              value: controller.width.toString(),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              onChanged: controller.setWidth,
            ),
          )),
          Text('Height'),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: CustomTextField(
              value: controller.height.toString(),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              onChanged: controller.setHeight,
            ),
          )),
        ],
      ),
    );
  }
}
