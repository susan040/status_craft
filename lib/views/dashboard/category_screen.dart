import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_generator/utils/colors.dart';
import 'package:status_generator/utils/custom_text_style.dart';
import 'package:status_generator/views/dashboard/sub_category_screen.dart';
import 'package:status_generator/widgets/category_widget.dart';
import 'package:status_generator/widgets/custom/sub_category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        centerTitle: false,
        elevation: 2,
        title: Text("Category", style: CustomTextStyles.f16W600()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
              child: Row(children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const PositiveStatusScreen());
                  },
                  child: Container(
                    height: 150,
                    width: Get.width / 2.26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/common/positive.jpg"))),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textColor.withOpacity(
                                0.33), // Adjust the opacity to make the image darker
                          ),
                        ),
                        Center(
                          child: Text(
                            "Positive",
                            style: CustomTextStyles.f14W700(
                                color: AppColors.extraWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                InkWell(
                  onTap: () {
                    Get.to(() => const EmotionalStatusScreen());
                  },
                  child: Container(
                    height: 150,
                    width: Get.width / 2.26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/common/emotional.jpg"))),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textColor.withOpacity(
                                0.33), // Adjust the opacity to make the image darker
                          ),
                        ),
                        Center(
                          child: Text(
                            "Emotional",
                            style: CustomTextStyles.f14W700(
                                color: AppColors.extraWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
              child: Row(children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const CelebrationStatusScreen());
                  },
                  child: Container(
                    height: 150,
                    width: Get.width / 2.26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/common/celebration.jpg"))),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textColor.withOpacity(
                                0.33), // Adjust the opacity to make the image darker
                          ),
                        ),
                        Center(
                          child: Text(
                            "Celebration",
                            style: CustomTextStyles.f14W700(
                                color: AppColors.extraWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                InkWell(
                  onTap: () {
                    Get.to(() => const RomanticStatusScreen());
                  },
                  child: Container(
                    height: 150,
                    width: Get.width / 2.26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/common/romantic.png"))),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textColor.withOpacity(
                                0.33), // Adjust the opacity to make the image darker
                          ),
                        ),
                        Center(
                          child: Text(
                            "Romantic",
                            style: CustomTextStyles.f14W700(
                                color: AppColors.extraWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 14, top: 16, bottom: 16),
              child: Row(children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const InspirationStatusScreen());
                  },
                  child: Container(
                    height: 150,
                    width: Get.width / 2.26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/common/inspiration.jpeg"))),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textColor.withOpacity(
                                0.33), // Adjust the opacity to make the image darker
                          ),
                        ),
                        Center(
                          child: Text(
                            "Inspiration",
                            style: CustomTextStyles.f14W700(
                                color: AppColors.extraWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                InkWell(
                  onTap: () {
                    Get.to(() => const EducationStatusScreen());
                  },
                  child: Container(
                    height: 150,
                    width: Get.width / 2.26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/common/education.jpg"))),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textColor.withOpacity(
                                0.33), // Adjust the opacity to make the image darker
                          ),
                        ),
                        Center(
                          child: Text(
                            "Education",
                            style: CustomTextStyles.f14W700(
                                color: AppColors.extraWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 14),
              child: Row(children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const CoolStatusWidget());
                  },
                  child: Container(
                    height: 150,
                    width: Get.width / 2.26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/common/cool.jpg"))),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textColor.withOpacity(
                                0.33), // Adjust the opacity to make the image darker
                          ),
                        ),
                        Center(
                          child: Text(
                            "Cool",
                            style: CustomTextStyles.f14W700(
                                color: AppColors.extraWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                InkWell(
                  onTap: () {
                    Get.to(() => const PassionStatusWidget());
                  },
                  child: Container(
                    height: 150,
                    width: Get.width / 2.26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/common/passion.jpg"))),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textColor.withOpacity(
                                0.33), // Adjust the opacity to make the image darker
                          ),
                        ),
                        Center(
                          child: Text(
                            "Passion",
                            style: CustomTextStyles.f14W700(
                                color: AppColors.extraWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 14, top: 16, bottom: 25),
              child: Row(children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const GovernmentalStatusWidget());
                  },
                  child: Container(
                    height: 150,
                    width: Get.width / 2.26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/common/governmental.jpg"))),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textColor.withOpacity(
                                0.33), // Adjust the opacity to make the image darker
                          ),
                        ),
                        Center(
                          child: Text(
                            "Governmental",
                            style: CustomTextStyles.f14W700(
                                color: AppColors.extraWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
