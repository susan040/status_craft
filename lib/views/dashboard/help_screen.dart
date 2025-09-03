import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  Widget _sectionCard(
      {required IconData icon,
      required String title,
      required Widget content}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.only(left: 14, right: 14, top: 6, bottom: 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.primaryColor, size: 20),
                const SizedBox(width: 8),
                Text(title,
                    style:
                        CustomTextStyles.f14W600(color: AppColors.textColor)),
              ],
            ),
            const SizedBox(height: 8),
            content,
          ],
        ),
      ),
    );
  }

  Widget _faqSection() {
    final faqList = [
      {
        'question': 'Do I need an internet connection to use the app?',
        'answer':
            'Yes, an internet connection is required to browse and refresh quotes.'
      },
      {
        'question': 'Can I customize the quotes?',
        'answer':
            'Currently, you can only copy and share quotes. Custom editing will be available in future updates.'
      },
      {
        'question': 'Is this app free to use?',
        'answer': 'Yes, the app is completely free, with no hidden charges.'
      },
      {
        'question': 'Is the app safe to use?',
        'answer':
            'Yes, the app is safe. We do not collect any personal information without consent.'
      },
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.only(left: 14, right: 14, top: 6, bottom: 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.question_answer,
                    color: AppColors.primaryColor, size: 20),
                const SizedBox(width: 8),
                Text('FAQ',
                    style:
                        CustomTextStyles.f14W600(color: AppColors.textColor)),
              ],
            ),
            const SizedBox(height: 12),
            ...faqList.map((faq) {
              return ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: Text(
                  faq['question']!,
                  style: CustomTextStyles.f13W600(color: AppColors.textColor),
                ),
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    child: Text(
                      faq['answer']!,
                      style: CustomTextStyles.f13W400(),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              );
            }).toList(),
          ],
        ),
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
        title: Text("Help",
            style: CustomTextStyles.f14W600(color: AppColors.textColor)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: ListView(
            children: [
              _sectionCard(
                icon: Icons.info_outline,
                title: 'Introduction',
                content: Text(
                  'Welcome to Status Generator! This app helps you create and share inspiring quotes and statuses. Whether you want to express love, share wisdom, or celebrate achievements, you will find the perfect quote here.',
                  style: CustomTextStyles.f13W400(height: 1.6),
                  textAlign: TextAlign.justify,
                ),
              ),
              _sectionCard(
                icon: Icons.touch_app,
                title: 'How to Use',
                content: Text(
                  '• Browse categories to find quotes.\n'
                  '• Select a category to view quotes.\n'
                  '• Use the refresh button to get new quotes.\n'
                  '• Share your favorite quotes with friends.',
                  style: CustomTextStyles.f13W400(
                    height: 1.8,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              _faqSection(),
              _sectionCard(
                icon: Icons.support_agent,
                title: 'Contact Support',
                content: Text(
                  'If you have any questions or need assistance, please contact our support team.',
                  style: CustomTextStyles.f13W400(
                    height: 1.6,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
