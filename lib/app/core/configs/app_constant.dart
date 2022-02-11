import 'package:velocity_x/velocity_x.dart';

class AppConstant {
  AppConstant._();
  static final color = _ColorConstant();
  static final def = _DefaultConstant();
}

class _ColorConstant {
  final p = Vx.blue300;
  final s = Vx.blue800;
  final g = Vx.gray700;
}

class _DefaultConstant {
  final appName = 'YBP Photos';
}
