import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';
import 'package:status_craft/views/dashboard/sub_category_screen.dart';
import 'package:status_craft/widgets/category_widget.dart';
import 'package:status_craft/widgets/custom/sub_category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "title": "Positive",
        "image": "assets/common/positive.jpg",
        "screen": const PositiveStatusScreen()
      },
      {
        "title": "Emotional",
        "image": "assets/common/emotional.jpg",
        "screen": const EmotionalStatusScreen()
      },
      {
        "title": "Celebration",
        "image": "assets/common/celebration.jpg",
        "screen": const CelebrationStatusScreen()
      },
      {
        "title": "Romantic",
        "image": "assets/common/romantic.png",
        "screen": const RomanticStatusScreen()
      },
      {
        "title": "Inspiration",
        "image": "assets/common/inspiration.jpeg",
        "screen": const InspirationStatusScreen()
      },
      {
        "title": "Education",
        "image": "assets/common/education.jpg",
        "screen": const EducationStatusScreen()
      },
      {
        "title": "Cool",
        "image": "assets/common/cool.jpg",
        "screen": const CoolStatusWidget()
      },
      {
        "title": "Passion",
        "image": "assets/common/passion.jpg",
        "screen": const PassionStatusWidget()
      },
      {
        "title": "Governmental",
        "image": "assets/common/governmental.jpg",
        "screen": const GovernmentalStatusWidget()
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        centerTitle: false,
        elevation: 2,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: Text("Category",
            style: CustomTextStyles.f14W600(color: AppColors.textColor)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            // Ensuring GridView has a fixed height
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];
                return InkWell(
                  onTap: () => Get.to(() => category["screen"] as Widget),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(category["image"] as String),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          // Ensure proper use inside Stack
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.textColor.withOpacity(0.33),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            category["title"] as String,
                            style: CustomTextStyles.f14W700(
                              color: AppColors.extraWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
