import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  Widget _section({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: CustomTextStyles.f14W600(color: AppColors.textColor)),
          const SizedBox(height: 6),
          Divider(color: AppColors.textColor.withOpacity(0.2), thickness: 1),
          const SizedBox(height: 6),
          Text(
            content,
            style: CustomTextStyles.f13W400(height: 1.6),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        centerTitle: true,
        elevation: 1,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: Text(
          "Terms & Conditions",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _section(
                title: "1. Introduction",
                content:
                    "By using this app, you agree to the terms and conditions outlined below. Please read them carefully before using the app.",
              ),
              _section(
                title: "2. Privacy Policy",
                content:
                    "We take your privacy seriously. We do not share any personal data without your consent. For more details, please refer to our Privacy Policy.",
              ),
              _section(
                title: "3. User Responsibilities",
                content:
                    "You are responsible for maintaining the confidentiality of your account and password. Notify us immediately if you suspect any unauthorized use of your account.",
              ),
              _section(
                title: "4. Limitation of Liability",
                content:
                    "We are not liable for any damages arising from the use or inability to use the app.",
              ),
              _section(
                title: "5. Termination",
                content:
                    "We reserve the right to suspend or terminate your access to the app if you violate any of the terms.",
              ),
              _section(
                title: "6. Changes to the Terms",
                content:
                    "We may modify these terms from time to time. You will be notified of any changes via the app.",
              ),
              _section(
                title: "7. Governing Law",
                content:
                    "These terms are governed by the laws of the country in which the app is distributed.",
              ),
              _section(
                title: "8. Contact Us",
                content:
                    "If you have any questions regarding these terms, feel free to contact us.",
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
