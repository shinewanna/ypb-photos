import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:ypb_photos/app/core/configs/app_constant.dart';

class Loading extends Container {
  final double size;

  Loading({this.size = 40});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingBouncingGrid.square(
        size: size,
        backgroundColor: AppConstant.color.p,
      ),
    );
  }
}
