import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_generator/views/dashboard/prompt_screen.dart';
import 'package:status_generator/views/dashboard/setting_screen.dart';

class DashScreenController extends GetxController {
  final dashKey = GlobalKey<ScaffoldState>();

  RxList<Widget> pages = RxList([
    //HomeScreen(),
    PromptScreen(),
    const SettingScreen()
  ]);
  RxInt currentIndex = RxInt(0);

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
