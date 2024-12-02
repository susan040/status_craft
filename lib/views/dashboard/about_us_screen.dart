import 'package:flutter/material.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        centerTitle: false,
        elevation: 2,
        title: Text("Category", style: CustomTextStyles.f16W600()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 22, bottom: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About Us", style: CustomTextStyles.f16W600()),
              const SizedBox(height: 16),
              Text(
                "Welcome to Status Generator! We are dedicated to providing you with an extensive collection of quotes and statuses designed to inspire, motivate, and connect people. Whether you're looking to express love, celebrate achievements, find the courage to face new challenges, or share wisdom and knowledge, our app has something for every occasion. Our mission is to make it easy for you to find the perfect words that resonate with your experiences and emotions. With categories ranging from Love, Marriage, and Dating to Graduation, Knowledge, Learning, Medical, Legal, Leadership, and Government, we ensure that you have a wealth of options at your fingertips. Our user-friendly interface allows for seamless navigation and customization, letting you tailor quotes to your preferences and discover new ones with just a refresh. You can save your favorite quotes for quick access and share them effortlessly with friends and family through social media or messaging apps. Behind Status Generator is a passionate team of developers, designers, and writers committed to creating an exceptional user experience. We continually strive to improve the app and expand our quote library to bring you the most relevant and inspiring content. We believe in the power of words to uplift and unite, and we hope our app brings joy and inspiration to your daily life. We value your feedback and are always here to listen. Please feel free to reach out to us with any questions, suggestions, or comments at contact@statusgeneratorapp.com. Thank you for choosing Status Generator, where every word matters.",
                textAlign: TextAlign.justify,
                style: CustomTextStyles.f14W400(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
