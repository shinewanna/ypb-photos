import 'package:velocity_x/velocity_x.dart';

class AppConstant {
  AppConstant._();
  static final color = _ColorConstant();
  static final def = _DefaultConstant();
  static final file = _FileConstant();
}

class _ColorConstant {
  final p = Vx.blue300;
  final s = Vx.blue800;
  final g = Vx.gray700;
}

class _DefaultConstant {
  final appName = 'YPB Photos';
  final exposure = 0.0;
  final width = 640.0;
  final height = 480.0;
  final photosLimit = 3;
}

class _FileConstant {
  final imagePath = '/storage/emulated/0/Download/';
}
