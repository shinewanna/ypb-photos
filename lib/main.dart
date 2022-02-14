import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ypb_photos/app/core/configs/app_constant.dart';
import 'package:ypb_photos/app/core/utils/dependency_injection.dart';
import 'package:ypb_photos/app/data/handlers/camera_handler.dart';
import 'package:ypb_photos/app/data/handlers/file_handler.dart';
import 'package:ypb_photos/app/data/providers/cache_provider.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CameraHandler.setCameras();
  DependencyInjection.inject();
  final fileHandler = Get.find<FileHandler>();
  final path = await fileHandler.getDbPath;
  Hive.init(path);
  await CacheProvider.open();
  runApp(PrePage());
}

class PrePage extends StatelessWidget {
  const PrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstant.def.appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
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
    );
  }
}
