import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';
import 'package:status_craft/widgets/category_bottom_sheet.dart';

class PositiveStatusScreen extends StatelessWidget {
  const PositiveStatusScreen({super.key});

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
                    context, "success", "assets/common/success.jpg"),
                const SizedBox(width: 14),
                buildCategoryCard(context, "life", "assets/common/life.jpeg"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(
              children: [
                buildCategoryCard(
                    context, "courage", "assets/common/courage.jpg"),
                const SizedBox(width: 14),
                buildCategoryCard(
                    context, "dreams", "assets/common/dreams.jpg"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(
              children: [
                buildCategoryCard(
                    context, "freedom", "assets/common/freedom.jpg"),
                const SizedBox(width: 14),
                buildCategoryCard(
                    context, "forgiveness", "assets/common/forgiveness.jpg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EmotionalStatusScreen extends StatelessWidget {
  const EmotionalStatusScreen({super.key});

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
                buildCategoryCard(context, "anger", "assets/common/anger.jpg"),
                const SizedBox(width: 14),
                buildCategoryCard(
                    context, "jealousy", "assets/common/jealous.jpeg"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(
              children: [
                buildCategoryCard(
                    context, "happiness", "assets/common/happiness.jpg"),
                const SizedBox(width: 14),
                buildCategoryCard(context, "alone", "assets/common/alone.jpg"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(
              children: [
                buildCategoryCard(context, "funny", "assets/common/funny.jpg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CelebrationStatusScreen extends StatelessWidget {
  const CelebrationStatusScreen({super.key});
  void showCategoryBottomSheet(BuildContext context, String category) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CategoryBottomSheet(category: category);
      },
    );
  }

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
                    context, "birthday", "assets/common/birthday.jpg"),
                const SizedBox(width: 14),
                buildCategoryCard(
                    context, "marriage", "assets/common/marriage.png"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(
              children: [
                buildCategoryCard(
                    context, "fitness", "assets/common/fitness.jpg"),
                const SizedBox(width: 14),
                buildCategoryCard(context, "movie", "assets/common/movie.jpg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InspirationStatusScreen extends StatelessWidget {
  const InspirationStatusScreen({super.key});
  void showCategoryBottomSheet(BuildContext context, String category) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CategoryBottomSheet(category: category);
      },
    );
  }

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
                    context, "courage", "assets/common/courage.jpg"),
                const SizedBox(width: 14),
                buildCategoryCard(
                    context, "change", "assets/common/change.jpg"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(
              children: [
                buildCategoryCard(
                    context, "inspirational", "assets/common/inspirations.jpg"),
                const SizedBox(width: 14),
                buildCategoryCard(context, "hope", "assets/common/hope.jpg"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 14, top: 16),
            child: Row(
              children: [
                buildCategoryCard(context, "life", "assets/common/life.jpeg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
