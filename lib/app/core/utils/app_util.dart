import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtil {
  AppUtil._();

  static void removeFocus(context) => FocusScope.of(context).unfocus();

  static errSnack(String error, {String title = 'Sorry'}) {
    Get.snackbar(
      title,
      error,
      colorText: Colors.red,
      backgroundColor: Colors.black45,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static snack(String title, {String msg = '', textColor = Colors.green}) {
    Get.snackbar(
      title,
      msg,
      colorText: textColor,
      backgroundColor: Colors.black45,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
