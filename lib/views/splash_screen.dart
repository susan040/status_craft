import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:status_craft/controller/splash_screen_controller.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final c = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                child: Image(
                  image: const AssetImage(ImagePath.logo),
                  height: 210,
                  width: 210,
                ),
              ),
            ),
            SizedBox(height: 140),
            Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: AppColors.primaryColor,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
