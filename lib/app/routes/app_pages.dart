import 'package:get/get.dart';

import 'package:ypb_photos/app/modules/editor/editor_binding.dart';
import 'package:ypb_photos/app/modules/editor/editor_view.dart';
import 'package:ypb_photos/app/modules/photos/photos_binding.dart';
import 'package:ypb_photos/app/modules/photos/photos_view.dart';
import 'package:ypb_photos/app/modules/photos_viewer/photos_viewer_binding.dart';
import 'package:ypb_photos/app/modules/photos_viewer/photos_viewer_view.dart';
import 'package:ypb_photos/app/modules/splash/splash_binding.dart';
import 'package:ypb_photos/app/modules/splash/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.EDITOR,
      page: () => EditorView(),
      binding: EditorBinding(),
    ),
    GetPage(
      name: _Paths.PHOTOS,
      page: () => PhotosView(),
      binding: PhotosBinding(),
    ),
    GetPage(
      name: _Paths.PHOTOS_VIEWER,
      page: () => PhotosViewerView(),
      binding: PhotosViewerBinding(),
    ),
  ];
}
