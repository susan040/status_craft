import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';
import 'package:status_craft/widgets/category_bottom_sheet.dart';

class RomanticStatusScreen extends StatelessWidget {
  const RomanticStatusScreen({super.key});
  void showCategoryBottomSheet(BuildContext context, String category) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CategoryBottomSheet(category: category);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        centerTitle: false,
        elevation: 2,
        leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back, color: AppColors.textColor)),
        title: Text("Sub Categories",
            style: CustomTextStyles.f14W600(color: AppColors.textColor)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(children: [
              InkWell(
                onTap: () {
                  showCategoryBottomSheet(context, "love");
                },
                child: Container(
                  height: 125,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/common/love.jpg"))),
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
                          "Love",
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
                  showCategoryBottomSheet(context, "marriage");
                },
                child: Container(
                  height: 125,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/common/marriage.png"))),
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
                          "Marriage",
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
                  showCategoryBottomSheet(context, "dating");
                },
                child: Container(
                  height: 125,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/common/dating.jpg"))),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.textColor.withOpacity(0.33),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Dating",
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
        ],
      ),
    );
  }
}

class EducationStatusScreen extends StatelessWidget {
  const EducationStatusScreen({super.key});
  void showCategoryBottomSheet(BuildContext context, String category) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CategoryBottomSheet(category: category);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        centerTitle: false,
        elevation: 2,
        leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back, color: AppColors.textColor)),
        title: Text("Sub Categories",
            style: CustomTextStyles.f14W600(color: AppColors.textColor)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(children: [
              InkWell(
                onTap: () {
                  showCategoryBottomSheet(context, "graduation");
                },
                child: Container(
                  height: 125,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/common/graduation.jpg"))),
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
                          "Graduation",
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
                  showCategoryBottomSheet(context, "knowledge");
                },
                child: Container(
                  height: 125,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/common/knowledge.jpg"))),
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
                          "Knowledge",
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
                  showCategoryBottomSheet(context, "learning");
                },
                child: Container(
                  height: 125,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/common/learning.jpg"))),
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
                          "Learning",
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
                  showCategoryBottomSheet(context, "medical");
                },
                child: Container(
                  height: 125,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/common/medical.jpeg"))),
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
                          "Medical",
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
        ],
      ),
    );
  }
}
