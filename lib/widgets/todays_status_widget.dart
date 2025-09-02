import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/controller/dashboard/quote_controller.dart';
import 'package:status_craft/models/quote.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';

class TodaysStatusWidget extends StatelessWidget {
  TodaysStatusWidget({
    super.key,
    required this.quotes,
  });

  final Quotes quotes;
  final quoteController = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    final tags = quotes.results?.first.tags ?? [];

    if (tags.length != 1) {
      return const SizedBox.shrink();
    }

    final String tag = tags.first.toLowerCase().trim();
    final String imagePath =
        quoteController.categoryImages[tag] ?? "assets/common/no_image.png";

    return Container(
      margin: const EdgeInsets.only(left: 14),
      height: 230,
      width: Get.width / 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),

            // Quote content
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      quotes.results?.first.content ?? "",
                      style: CustomTextStyles.f12W600(
                        color: AppColors.extraWhite,
                      ),
                      textAlign: TextAlign.center,
                      // maxLines: 3,
                      // overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "-${quotes.results?.first.author ?? ""}",
                      style: CustomTextStyles.f12W400(
                        color: AppColors.extraWhite.withOpacity(0.9),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      tag,
                      style: CustomTextStyles.f12W400(
                        color: AppColors.extraWhite.withOpacity(0.8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
