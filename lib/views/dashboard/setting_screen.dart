import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:status_craft/controller/dashboard/prompt_screen_controller.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';
import 'package:status_craft/utils/image_path.dart';
import 'package:status_craft/views/dashboard/about_us_screen.dart';
import 'package:status_craft/views/dashboard/app_information_screen.dart';
import 'package:status_craft/views/dashboard/help_screen.dart';
import 'package:status_craft/views/dashboard/terms_condition_screen.dart';

class SettingScreen extends StatelessWidget {
  static String routeName = "/setting-screen";
  SettingScreen({super.key});
  final c = Get.put(PromptScreenController());

  Widget buildSettingItem(String label, Widget icon, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: CustomTextStyles.f14W400()),
            icon,
          ],
        ),
      ),
    );
  }

  Widget buildContainer(List<Widget> children) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.extraWhite,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
              spreadRadius: 1, blurRadius: 1, color: AppColors.unselectedGrey)
        ],
      ),
      child: Column(children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        elevation: 2,
        title: Row(
          children: [
            Image(image: AssetImage(ImagePath.mainLogo), height: 50, width: 50),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text("Manage",
                  style:
                      CustomTextStyles.f14W600(color: AppColors.primaryColor)),
            ),
            const SizedBox(width: 4),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text("Settings",
                  style: CustomTextStyles.f14W600(
                      color: AppColors.secondaryColor)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Support", style: CustomTextStyles.f14W600()),
              SizedBox(height: 14),
              buildContainer([
                buildSettingItem(
                    "Help",
                    Icon(
                      Icons.help_outline_outlined,
                      size: 18,
                      color: AppColors.primaryColor,
                    ), () {
                  Get.to(() => HelpPage());
                }),
                Divider(thickness: 1.2),
                buildSettingItem(
                    "Rate the app",
                    Icon(
                      Icons.star_border_outlined,
                      size: 20,
                      color: AppColors.primaryColor,
                    ), () {
                  c.showRatingPopup(context);
                }),
                Divider(thickness: 1.2),
                buildSettingItem(
                    "Share this application",
                    Icon(
                      Icons.share,
                      size: 17,
                      color: AppColors.primaryColor,
                    ),
                    () {}),
                Divider(thickness: 1.2),
                buildSettingItem(
                    "About Us",
                    SvgPicture.asset(
                      ImagePath.about,
                      height: 15,
                      width: 15,
                      color: AppColors.primaryColor,
                    ), () {
                  Get.to(() => AboutUsScreen());
                }),
              ]),
              SizedBox(height: 25),
              Text("General Settings", style: CustomTextStyles.f14W600()),
              SizedBox(height: 14),
              buildContainer([
                buildSettingItem(
                    "App Info",
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: AppColors.primaryColor,
                    ), () {
                  Get.to(() => AppInfoScreen());
                }),
                Divider(thickness: 1.2),
                buildSettingItem(
                    "Version",
                    Icon(
                      Icons.app_settings_alt,
                      size: 18,
                      color: AppColors.primaryColor,
                    ), () {
                  c.showAppVersionPopup(context);
                }),
                Divider(thickness: 1.2),
                buildSettingItem(
                    "Terms & Conditions",
                    Icon(
                      Icons.assignment,
                      size: 18,
                      color: AppColors.primaryColor,
                    ), () {
                  Get.to(() => TermsAndConditionsScreen());
                }),
              ]),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
