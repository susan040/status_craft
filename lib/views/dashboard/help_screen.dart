import 'package:flutter/material.dart';
import 'package:status_generator/utils/colors.dart';
import 'package:status_generator/utils/custom_text_style.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        centerTitle: false,
        elevation: 2,
        title: Text("Help", style: CustomTextStyles.f16W600()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Introduction', style: CustomTextStyles.f16W600()),
            const SizedBox(height: 8),
            Text(
              'Welcome to Status Generator! This app helps you create and share inspiring quotes and statuses. Whether you want to express love, share wisdom, or celebrate achievements, you will find the perfect quote here.',
              style: CustomTextStyles.f14W400(),
            ),
            const SizedBox(height: 16),
            Text('How to Use', style: CustomTextStyles.f16W600()),
            const SizedBox(height: 8),
            Text(
              '1. Browse categories to find quotes.\n'
              '2. Select a category to view quotes.\n'
              '3. Use the refresh button to get new quotes.\n'
              '4. Share your favorite quotes with friends.',
              style: CustomTextStyles.f14W400(),
            ),
            const SizedBox(height: 16),
            Text('FAQ', style: CustomTextStyles.f16W600()),
            const SizedBox(height: 8),
            Text(
              'Q: How do I share a quote?\n'
              'A: Tap the share icon next to the quote to share it via social media or messaging apps.\n\n'
              'Q: Can I save my favorite quotes?\n'
              'A: Yes, tap the heart icon to save quotes to your favorites.',
              style: CustomTextStyles.f14W400(),
            ),
            const SizedBox(height: 16),
            Text('Contact Support', style: CustomTextStyles.f16W600()),
            const SizedBox(height: 8),
            Text(
              'If you have any questions or need assistance, please contact our support team at support@statusgenerator.com.',
              style: CustomTextStyles.f14W400(),
            ),
          ],
        ),
      ),
    );
  }
}
