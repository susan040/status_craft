import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_generator/utils/colors.dart';
import 'package:status_generator/utils/custom_text_style.dart';
import 'package:status_generator/utils/image_path.dart';
import 'package:status_generator/views/dash_screen.dart';
import 'package:status_generator/widgets/custom/elevated_button.dart';

class EasyToAccessScreen extends StatelessWidget {
  static String routeName = "/easy-access-screen";
  const EasyToAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: Stack(
        children: [
          // Background image container
          Container(
            margin: const EdgeInsets.only(
                left: 11, right: 11, top: 60, bottom: 125),
            height: MediaQuery.of(context).size.height / 1.6,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePath.easyAccess),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Content container
          Positioned(
            bottom: 3,
            left: 0,
            right: 0,
            child: Container(
              // Adjust the height as needed
              width: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 47,
                    blurRadius: 40,
                    color: AppColors.extraWhite,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Text("Easy To Access", style: CustomTextStyles.f14W600()),
                  const SizedBox(height: 5),
                  Text(
                    "Start chatting",
                    style: CustomTextStyles.f12W400(color: AppColors.lGrey),
                  ),
                  Text(
                    "with status crafter now",
                    style: CustomTextStyles.f12W400(color: AppColors.lGrey),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 12,
                        decoration: BoxDecoration(
                          color: AppColors.unselectedGrey,
                          borderRadius: BorderRadius.circular(52),
                        ),
                      ),
                      const SizedBox(width: 7),
                      Container(
                        height: 10,
                        width: 33,
                        decoration: BoxDecoration(
                          color: AppColors.lightBlueColor,
                          borderRadius: BorderRadius.circular(52),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 60, right: 60, top: 20),
                    child: CustomElevatedButton(
                        title: "Continue",
                        onTap: () {
                          Get.offAll(() => DashScreen());
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}