import 'package:get/get.dart';
import 'package:status_generator/views/dashboard/easy_search_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const EasyToSearchScreen());
    });
    super.onInit();
  }
}
