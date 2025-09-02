import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/models/onboard.dart';
import 'package:status_craft/views/dash_screen.dart';

class OnboadingScreenController extends GetxController {
  final PageController pageController = PageController();
  var currentIndex = 0.obs;

  void nextPage() {
    if (currentIndex.value < onboardingPages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Get.offAll(() => DashScreen());
    }
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }
}
