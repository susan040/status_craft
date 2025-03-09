import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:status_craft/controller/dashboard/prompt_screen_controller.dart';
import 'package:status_craft/controller/dashboard/quote_controller.dart';
import 'package:status_craft/models/quote.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';
import 'package:status_craft/utils/image_path.dart';
import 'package:status_craft/views/dashboard/category_screen.dart';
import 'package:status_craft/views/dashboard/sub_category_screen.dart';
import 'package:status_craft/widgets/category_widget.dart';

class PromptScreen extends StatelessWidget {
  static String routeName = "/prompt-screen";
  PromptScreen({super.key});
  final QuoteController quoteController = Get.put(QuoteController());
  final c = Get.put(PromptScreenController());

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
    }
  ];

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
                  height: 50,
                  width: 50,
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
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Text(
                  "Today's Status",
                  style:
                      CustomTextStyles.f14W600(color: AppColors.primaryColor),
                ),
              ),
              const SizedBox(height: 10),
              FutureBuilder<List<Quotes>>(
                future: quoteController.fetchQuotes(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return _buildShimmer(); // Shimmer loading effect
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No quotes available');
                  } else {
                    // Get first 3 quotes from the list
                    List<Quotes> quotesList = snapshot.data!.take(3).toList();

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(quotesList.length, (index) {
                          return PopularStatusWidget(
                            image: index == 0
                                ? "assets/common/abc.jpg"
                                : index == 1
                                    ? "assets/common/inspirational.jpg"
                                    : "assets/common/fitness.jpg",
                            quotes: quotesList[index],
                          );
                        }),
                      ),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: CustomTextStyles.f14W600(),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const CategoryScreen());
                      },
                      child: Text(
                        "More",
                        style: CustomTextStyles.f12W400(
                            color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Container(
                  child: GridView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        AppColors.textColor.withOpacity(0.33),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  category["title"] as String,
                                  style: CustomTextStyles.f14W700(
                                      color: AppColors.extraWhite),
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
            ],
          ),
        ),
      ),
    );
  }

  // Shimmer widget for loading state
  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6, // This is the number of categories you're displaying
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              height: 150,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}

class PopularStatusWidget extends StatelessWidget {
  const PopularStatusWidget({
    super.key,
    required this.image,
    required this.quotes,
  });
  final Quotes quotes;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 14),
      height: 230,
      width: Get.width / 1.5,
      decoration: BoxDecoration(
        color: AppColors.extraWhite,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.25),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                quotes.quote ?? "",
                style: CustomTextStyles.f12W700(
                  color: AppColors.extraWhite,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                "-${quotes.author}",
                style: CustomTextStyles.f12W600(
                  color: AppColors.extraWhite,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
