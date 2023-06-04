import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilFunctions {
  static void displayErrorBox(String message) {
    Get.snackbar('Error!', message.toString(),
        barBlur: 0,
        dismissDirection: DismissDirection.vertical,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        overlayBlur: 0,
        animationDuration: const Duration(milliseconds: 500),
        duration: const Duration(seconds: 3));
    debugPrint(message);
  }

  static void displaySuccessBox(String heading, String message) {
    Get.snackbar('', '',
        barBlur: 0,
        icon: const Icon(Icons.check),
        dismissDirection: DismissDirection.vertical,
        backgroundColor: Colors.white,
        colorText: const Color(0xff292929),
        titleText: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 15),
          child: Text(message.toString()),
        ),
        overlayBlur: 0,
        animationDuration: const Duration(milliseconds: 500),
        duration: const Duration(seconds: 3));
  }
}
