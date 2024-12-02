import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:status_craft/controller/dashboard/quote_controller.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';
import 'package:status_craft/utils/image_path.dart';
import 'package:status_craft/views/dashboard/about_us_screen.dart';
import 'package:status_craft/views/dashboard/category_screen.dart';
import 'package:status_craft/views/dashboard/help_screen.dart';
import 'package:status_craft/views/dashboard/sub_category_screen.dart';
import 'package:status_craft/widgets/category_widget.dart';

class PromptScreen extends StatelessWidget {
  static String routeName = "/prompt-screen";
  PromptScreen({super.key});
  final QuoteController quoteController = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.extraWhite,
        appBar: AppBar(
          backgroundColor: AppColors.extraWhite,
          iconTheme: IconThemeData(color: AppColors.textColor),
          centerTitle: false,
          elevation: 1.5,
          leading: IconButton(
            icon: Icon(Icons.menu,
                color: AppColors.textColor), // Custom menu icon
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Opens the drawer
            },
          ),
          title: Text(
            "Daily Status",
            style: CustomTextStyles.f16W600(color: AppColors.textColor),
          ),
        ),
        drawer: Drawer(
          backgroundColor: AppColors.extraWhite,
          shadowColor: Colors.black,
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(image: AssetImage("assets/icons/drawer.png")),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 20),
                  child: Row(
                    children: [
                      Text("Status",
                          style: CustomTextStyles.f16W600(
                              color: AppColors.primaryColor)),
                      const SizedBox(width: 4),
                      Text("Crafter",
                          style: CustomTextStyles.f16W600(
                              color: AppColors.secondaryColor))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Divider(
                    color: AppColors.primaryColor,
                    thickness: 0.6,
                  ),
                ),
                InkWell(
                    onTap: () {
                      Get.to(() => const HelpPage());
                    },
                    child: const DrawerWidget(
                        name: 'Help', image: ImagePath.help)),
                InkWell(
                  onTap: () {},
                  child: const DrawerWidget(
                      name: 'Share this Application', image: ImagePath.share),
                ),
                InkWell(
                  onTap: () {},
                  child: const DrawerWidget(
                      name: 'Rate This App', image: ImagePath.rate),
                ),
                InkWell(
                    onTap: () {
                      Get.to(() => const AboutUsScreen());
                    },
                    child: const DrawerWidget(
                        name: 'About Us', image: ImagePath.about)),
              ],
            ),
          )),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 22, bottom: 7),
                child:
                    Text("Popular Status", style: CustomTextStyles.f16W600()),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 220,
                  child: Row(
                    children: [
                      PopularStatusWidget(
                          image: "assets/common/romantic_status.jpg",
                          name:
                              "Love isn't measured in time but in how deeply you cherish each day together.  — Angelita Lim"),
                      PopularStatusWidget(
                          image: "assets/common/inspirational.jpg",
                          name:
                              "Believe you can and you're halfway there.  — Theodore Roosevelt"),
                      PopularStatusWidget(
                          image: "assets/common/fitness.jpg",
                          name:
                              "Take care of your body. It's the only place you have to live.  — Jim Rohn"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories", style: CustomTextStyles.f16W600()),
                    InkWell(
                      onTap: () {
                        Get.to(() => const CategoryScreen());
                      },
                      child: Text("More",
                          style: CustomTextStyles.f16W400(
                              color: AppColors.primaryColor)),
                    ),
                  ],
                ),
              ),
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
                              image:
                                  AssetImage("assets/common/emotional.jpg"))),
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
                    left: 16, right: 14, top: 16, bottom: 25),
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
                              image: AssetImage(
                                  "assets/common/inspiration.jpeg"))),
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
                              image:
                                  AssetImage("assets/common/education.jpg"))),
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
              )
            ],
          ),
        ));
  }
}

class PopularStatusWidget extends StatelessWidget {
  const PopularStatusWidget({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 14),
      height: 230,
      width: Get.width / 1.5,
      decoration: BoxDecoration(
          color: AppColors.extraWhite,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
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

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.name,
    required this.image,
  });
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 23),
      child: Row(
        children: [
          SvgPicture.asset(image),
          const SizedBox(width: 13),
          Text(
            name,
            style: CustomTextStyles.f14W600(),
          )
        ],
      ),
    );
  }
}
