import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/controller/dashboard/prompt_screen_controller.dart';
import 'package:status_craft/controller/dashboard/quote_controller.dart';
import 'package:status_craft/models/quote.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';
import 'package:status_craft/utils/image_path.dart';
import 'package:status_craft/views/dashboard/category_screen.dart';
import 'package:status_craft/views/dashboard/quote_screen.dart';
import 'package:status_craft/widgets/quotes_shimmer_widget.dart';
import 'package:status_craft/widgets/todays_status_widget.dart';

class PromptScreen extends StatelessWidget {
  static String routeName = "/prompt-screen";
  PromptScreen({super.key});
  final quoteController = Get.put(QuoteController());
  final c = Get.put(PromptScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        elevation: 2,
        centerTitle: false,
        title: Column(
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage(ImagePath.mainLogo),
                  height: 45,
                  width: 45,
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text("Daily",
                      style: CustomTextStyles.f14W600(
                          color: AppColors.primaryColor)),
                ),
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text("Status",
                      style: CustomTextStyles.f14W600(
                          color: AppColors.secondaryColor)),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<List<Quotes>>(
                future: quoteController.fetchQuotes(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const QuotesShimmer();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No quotes available');
                  } else {
                    List<Quotes> quotesList = snapshot.data!.take(3).toList();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 10),
                          child: Text(
                            "Today's Status",
                            style: CustomTextStyles.f14W600(
                                color: AppColors.primaryColor),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(quotesList.length, (index) {
                              return TodaysStatusWidget(
                                quotes: quotesList[index],
                              );
                            }),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: CustomTextStyles.f14W600(),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => CategoryScreen());
                      },
                      child: Text(
                        "More",
                        style: CustomTextStyles.f14W400(
                            color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                if (quoteController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (quoteController.categories.isEmpty) {
                  return const Center(child: Text("No categories found"));
                }

                final filteredCategories = quoteController.categories
                    .where((c) => (c.quoteCount ?? 0) >= 5)
                    .take(6)
                    .toList();

                return Padding(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 14),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredCategories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      final category = filteredCategories[index];
                      final imagePath = quoteController.categoryImages[
                              category.slug?.toLowerCase() ?? ""] ??
                          "assets/common/no_image.png";

                      return GestureDetector(
                        onTap: () {
                          Get.to(() =>
                              QuotesScreen(category: category.slug ?? ""));
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
                                      color:
                                          AppColors.extraWhite.withOpacity(0.9),
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
              })
            ],
          ),
        ),
      ),
    );
  }
}
