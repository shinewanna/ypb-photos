import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ypb_photos/app/core/configs/app_constant.dart';
import 'package:ypb_photos/app/data/handlers/camera_handler.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CameraHandler.setCameras();
  runApp(
    GetMaterialApp(
      title: AppConstant.def.appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
        primaryColor: AppConstant.color.p,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: AppConstant.color.p,
        )),
        appBarTheme: AppBarTheme(
          backgroundColor: AppConstant.color.p,
          centerTitle: true,
        ),
      ),
    ),
  );
}
