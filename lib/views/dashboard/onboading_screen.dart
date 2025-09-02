import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/controller/dashboard/onboading_screen_controller.dart';
import 'package:status_craft/models/onboard.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';
import 'package:status_craft/widgets/custom/elevated_button.dart';

class OnboardingScreen extends StatelessWidget {
  final controller = Get.put(OnboadingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.43,
                child: PageView.builder(
                    itemCount: onboardingPages.length,
                    controller: controller.pageController,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: controller.onPageChanged,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 1.6,
                              width: MediaQuery.of(context).size.width / 1.05,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage(onboardingPages[index].image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -15,
                            left: 0,
                            right: 0,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 10),
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
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    onboardingPages[index].title,
                                    style: CustomTextStyles.f16W700(),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    onboardingPages[index].description,
                                    style: CustomTextStyles.f12W400(
                                        color: AppColors.lGrey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(height: 40),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingPages.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: controller.currentIndex.value == index ? 25 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == index
                            ? AppColors.lightBlueColor
                            : AppColors.unselectedGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 22),
                child: CustomElevatedButton(
                    title: "Continue", onTap: controller.nextPage),
              )
            ],
          ),
        ),
      ),
    );
  }
}
