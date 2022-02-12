import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ypb_photos/app/modules/widgets/loading.dart';

class AppUtil {
  AppUtil._();

  static void removeFocus(context) => FocusScope.of(context).unfocus();

  static Future<void> showLoading({String text = 'Loading...'}) {
    return Get.dialog(
      Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Loading(),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void stopLoading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

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
