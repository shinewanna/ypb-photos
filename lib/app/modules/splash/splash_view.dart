import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ypb_photos/app/core/configs/app_constant.dart';
import 'package:ypb_photos/app/routes/app_pages.dart';

import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppConstant.def.appName,
            style: TextStyle(fontSize: 34, color: AppConstant.color.p),
            textAlign: TextAlign.center,
          ),
          FlutterLogo(
            size: 150,
          ),
          Text(
            'Directly Preview the Edit View from Camera, Capture photo and Save it.',
            style: TextStyle(color: AppConstant.color.g),
            textAlign: TextAlign.center,
          ),
          20.heightBox,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
              onPressed: () => Get.offAllNamed(Routes.EDITOR),
              icon: Icon(Icons.camera_alt),
              label: Text('Start'),
            ),
          ),
        ],
      ),
    );
  }
}
