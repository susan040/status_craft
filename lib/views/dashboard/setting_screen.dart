import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/controller/dashboard/prompt_screen_controller.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';
import 'package:status_craft/utils/image_path.dart';
import 'package:status_craft/views/dashboard/about_us_screen.dart';
import 'package:status_craft/views/dashboard/help_screen.dart';
import 'package:status_craft/views/dashboard/terms_condition_screen.dart';

class SettingScreen extends StatelessWidget {
  static String routeName = "/setting-screen";
  SettingScreen({super.key});
  final c = Get.put(PromptScreenController());

  Widget buildSettingItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          leading: CircleAvatar(
            radius: 20,
            backgroundColor:
                (iconColor ?? AppColors.primaryColor).withOpacity(0.15),
            child: Icon(icon,
                color: iconColor ?? AppColors.primaryColor, size: 22),
          ),
          title: Text(title, style: CustomTextStyles.f13W600()),
          subtitle: Text(subtitle,
              style: CustomTextStyles.f12W400(color: Colors.grey)),
          trailing:
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: onTap,
        ),
        const Divider(height: 1, thickness: 0.5),
      ],
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
            Image(image: AssetImage(ImagePath.mainLogo), height: 45, width: 45),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Support", style: CustomTextStyles.f14W600()),
              const SizedBox(height: 8),
              buildSettingItem(
                title: "Help",
                subtitle: "Get assistance and FAQs",
                icon: Icons.help_outline,
                onTap: () => Get.to(() => HelpPage()),
              ),
              buildSettingItem(
                title: "Rate the app",
                subtitle: "Give us your feedback",
                icon: Icons.star_border,
                onTap: () => c.showRatingPopup(context),
              ),
              buildSettingItem(
                title: "Share this application",
                subtitle: "Tell your friends about us",
                icon: Icons.share,
                onTap: () {},
              ),
              buildSettingItem(
                title: "About Us",
                subtitle: "Learn more about our team",
                icon: Icons.info_outline,
                onTap: () => Get.to(() => AboutUsScreen()),
              ),
              const SizedBox(height: 24),
              Text("General Settings", style: CustomTextStyles.f14W600()),
              const SizedBox(height: 8),
              buildSettingItem(
                title: "Version",
                subtitle: "Current app version",
                icon: Icons.system_update_alt,
                onTap: () => c.showAppVersionPopup(context),
              ),
              buildSettingItem(
                title: "Terms & Conditions",
                subtitle: "Read our policies",
                icon: Icons.assignment_outlined,
                onTap: () => Get.to(() => TermsAndConditionsScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
