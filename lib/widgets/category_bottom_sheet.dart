import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';
import 'package:status_craft/views/dashboard/quote_page.dart';
import 'package:status_craft/widgets/custom/elevated_button.dart';

class CategoryBottomSheet extends StatelessWidget {
  final String category;
  CategoryBottomSheet({super.key, required this.category});

  final List<int> quoteCounts = [1, 2, 3, 4, 5];
  final RxInt selectedCount = 1.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Adjust the height as needed
      padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
      child: Column(
        children: [
          Obx(() => DropdownButtonFormField<int>(
                dropdownColor: AppColors.extraWhite,
                value: selectedCount.value,
                hint: const Text('Select an option'),
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: AppColors.primaryColor),
                decoration: InputDecoration(
                  labelText: 'Options',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    selectedCount.value = newValue;
                  }
                },
                items: quoteCounts.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString(),
                        style: CustomTextStyles.f14W400(
                            color: AppColors.textColor)),
                  );
                }).toList(),
              )),
          const SizedBox(height: 22),
          // CustomElevatedButton(
          //     title: "Show Quotes",
          //     onTap: () {
          //       Navigator.of(context).pop();
          //       Get.to(() => QuotesDisplayPage(
          //           category: category, count: selectedCount.value));
          //     })
        ],
      ),
    );
  }
}
