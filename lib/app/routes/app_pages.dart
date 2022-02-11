import 'package:get/get.dart';

import 'package:ypb_photos/app/modules/editor/editor_binding.dart';
import 'package:ypb_photos/app/modules/editor/editor_view.dart';
import 'package:ypb_photos/app/modules/splash/splash_binding.dart';
import 'package:ypb_photos/app/modules/splash/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.EDITOR;

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
  ];
}
