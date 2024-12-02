import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';
import 'package:status_craft/widgets/category_bottom_sheet.dart';

class CoolStatusWidget extends StatelessWidget {
  const CoolStatusWidget({super.key});

  Widget buildCategoryCard(
      BuildContext context, String category, String imagePath) {
    return InkWell(
      onTap: () {
        showCategoryBottomSheet(context, category);
      },
      child: Container(
        height: 150,
        width: Get.width / 2.26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
          ),
        ),
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
                category.capitalizeFirst!,
                style: CustomTextStyles.f14W700(color: AppColors.extraWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
        title: Text("Sub Categories", style: CustomTextStyles.f16W600()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(
              children: [
                buildCategoryCard(
                    context, "beauty", "assets/common/beauty.jpg"),
                const SizedBox(width: 14),
                buildCategoryCard(context, "cool", "assets/common/cools.jpg"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(
              children: [
                buildCategoryCard(context, "best", "assets/common/best.jpg"),
                const SizedBox(width: 14),
                buildCategoryCard(
                    context, "attitude", "assets/common/attitude.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PassionStatusWidget extends StatelessWidget {
  const PassionStatusWidget({super.key});

  Widget buildCategoryCard(
      BuildContext context, String category, String imagePath) {
    return InkWell(
      onTap: () {
        showCategoryBottomSheet(context, category);
      },
      child: Container(
        height: 150,
        width: Get.width / 2.26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
          ),
        ),
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
                category.capitalizeFirst!,
                style: CustomTextStyles.f14W700(color: AppColors.extraWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
        title: Text("Sub Categories", style: CustomTextStyles.f16W600()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(
              children: [
                buildCategoryCard(context, "dream", "assets/common/dreams.jpg"),
                const SizedBox(width: 14),
                buildCategoryCard(
                    context, "business", "assets/common/business.jpg"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(
              children: [
                buildCategoryCard(context, "art", "assets/common/art.jpg"),
                const SizedBox(width: 14),
                buildCategoryCard(
                    context, "design", "assets/common/design.jpg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GovernmentalStatusWidget extends StatelessWidget {
  const GovernmentalStatusWidget({super.key});

  Widget buildCategoryCard(
      BuildContext context, String category, String imagePath) {
    return InkWell(
      onTap: () {
        showCategoryBottomSheet(context, category);
      },
      child: Container(
        height: 150,
        width: Get.width / 2.26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
          ),
        ),
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
                category.capitalizeFirst!,
                style: CustomTextStyles.f14W700(color: AppColors.extraWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
        title: Text("Sub Categories", style: CustomTextStyles.f16W600()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(
              children: [
                buildCategoryCard(context, "legal", "assets/common/legal.jpg"),
                const SizedBox(width: 14),
                buildCategoryCard(
                    context, "leadership", "assets/common/leadership.jpg"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(
              children: [
                buildCategoryCard(
                    context, "government", "assets/common/government.jpg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
