import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        centerTitle: false,
        elevation: 2,
        leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back, color: AppColors.textColor)),
        title: Text("Terms and conditions",
            style: CustomTextStyles.f14W600(color: AppColors.textColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1. Introduction\n\nBy using this app, you agree to the terms and conditions outlined below. Please read them carefully before using the app.\n\n"
                "2. Privacy Policy\n\nWe take your privacy seriously. We do not share any personal data without your consent. For more details, please refer to our Privacy Policy.\n\n"
                "3. User Responsibilities\n\nYou are responsible for maintaining the confidentiality of your account and password. You agree to notify us immediately if you suspect any unauthorized use of your account.\n\n"
                "4. Limitation of Liability\n\nWe are not liable for any damages arising from the use or inability to use the app.\n\n"
                "5. Termination\n\nWe reserve the right to suspend or terminate your access to the app if you violate any of the terms.\n\n"
                "6. Changes to the Terms\n\nWe may modify these terms from time to time. You will be notified of any changes via the app.\n\n"
                "7. Governing Law\n\nThese terms are governed by the laws of the country in which the app is distributed.\n\n"
                "8. Contact Us\n\nIf you have any questions regarding these terms, feel free to contact us.",
                style: CustomTextStyles.f14W400(),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
