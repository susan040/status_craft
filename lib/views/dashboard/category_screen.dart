import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/controller/dashboard/quote_controller.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';
import 'package:status_craft/views/dashboard/quote_screen.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  final controller = Get.put(QuoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        centerTitle: true,
        elevation: 2,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: Text(
          "Category",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.categories.isEmpty) {
          return const Center(child: Text("No categories found"));
        }

        return Padding(
          padding:
              const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 14),
          child: GridView.builder(
            itemCount: controller.categories
                .where((c) => (c.quoteCount ?? 0) >= 5)
                .length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              // Filtered list
              final filteredCategories = controller.categories
                  .where((c) => (c.quoteCount ?? 0) >= 5)
                  .toList();

              final category = filteredCategories[index];

              // Get mapped image or fallback
              final imagePath = controller
                      .categoryImages[category.slug?.toLowerCase() ?? ""] ??
                  "assets/common/category_placeholder.jpg";

              return GestureDetector(
                onTap: () {
                  Get.to(() => QuotesScreen(category: category.slug ?? ""));
                },
                child: Stack(
                  children: [
                    // Background image
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(imagePath),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),

                    // Overlay gradient
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.4),
                            Colors.transparent
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),

                    // Category title & quote count
                    Positioned(
                      bottom: 12,
                      left: 12,
                      right: 12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.name ?? "",
                            style: CustomTextStyles.f14W700(
                              color: AppColors.extraWhite,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Quotes: ${category.quoteCount}",
                            style: CustomTextStyles.f12W400(
                              color: AppColors.extraWhite.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
