import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static showSnackbar(String? message, {Color? backgroundColor}) {
    if (message == null || message.isEmpty) {
      return;
    } else {
      return Get.showSnackbar(
        GetSnackBar(
          message: message,
          margin: EdgeInsets.all(16),
          borderRadius: 8,
          duration: Duration(seconds: 3),
          backgroundColor: backgroundColor ?? Colors.black,
        ),
      );
    }
  }
}
