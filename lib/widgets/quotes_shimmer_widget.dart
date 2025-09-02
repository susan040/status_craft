import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:status_craft/utils/colors.dart';

class QuotesShimmer extends StatelessWidget {
  const QuotesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title placeholder
          Container(
            margin: const EdgeInsets.only(left: 14, top: 14, bottom: 10),
            height: 25,
            width: 130,
            decoration: BoxDecoration(
              color: AppColors.extraWhite,
              borderRadius: BorderRadius.circular(5),
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 14),
                  height: 230,
                  width: Get.width / 1.5,
                  decoration: BoxDecoration(
                    color: AppColors.extraWhite,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  margin: const EdgeInsets.only(right: 14),
                  height: 230,
                  width: Get.width / 1.5,
                  decoration: BoxDecoration(
                    color: AppColors.extraWhite,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 14, top: 20, bottom: 10),
                height: 25,
                width: 110,
                decoration: BoxDecoration(
                  color: AppColors.extraWhite,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 14, top: 20, bottom: 10),
                height: 25,
                width: 70,
                decoration: BoxDecoration(
                  color: AppColors.extraWhite,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),

          // Grid shimmer
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.extraWhite,
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
