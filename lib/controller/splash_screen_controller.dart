import 'package:get/get.dart';
import 'package:status_craft/views/dashboard/onboading_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => OnboardingScreen());
    });
    super.onInit();
  }
}
