import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalkthroughController extends GetxController {
  final currentPage = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  Timer? timer;

  onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentPage < 2) {
        currentPage.value++;
      } else {
        currentPage.value = 0;
      }
      pageController.animateToPage(currentPage.value,
          duration: const Duration(microseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  void onClose() {
    super.onClose();
    if (timer != null) timer!.cancel();
  }
}
