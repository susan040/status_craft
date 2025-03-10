import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/views/dashboard/prompt_screen.dart';
import 'package:status_craft/views/dashboard/setting_screen.dart';

class DashScreenController extends GetxController {
  final dashKey = GlobalKey<ScaffoldState>();

  RxList<Widget> pages = RxList([
    //HomeScreen(),
    PromptScreen(),
     SettingScreen()
  ]);
  RxInt currentIndex = RxInt(0);

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
