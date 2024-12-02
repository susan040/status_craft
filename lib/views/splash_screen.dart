import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/controller/splash_screen_controller.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final c = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 70,
            ),
            Center(
              child: SizedBox(
                child: Image(
                  image: AssetImage(ImagePath.logo),
                  // height: Get.height / 1.4,
                  // width: Get.width / 1.1,
                ),
              ),
            ),
            Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            )),
          ],
        ),
      ),
    );
  }
}
