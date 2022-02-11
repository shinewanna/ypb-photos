import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ypb_photos/app/modules/editor/editor_controller.dart';

class TextSlider extends GetView<EditorController> {
  final String title;
  final Widget slider;

  TextSlider({
    required this.title,
    required this.slider,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title)),
        slider,
      ],
    );
  }
}
