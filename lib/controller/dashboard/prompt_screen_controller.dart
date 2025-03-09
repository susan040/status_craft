import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';
import 'package:status_craft/widgets/custom/elevated_button.dart';

class PromptScreenController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  void showRatingPopup(BuildContext context) {
    // Show the dialog when called
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.extraWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 18, bottom: 5),
                child: Text("Give a review", style: CustomTextStyles.f14W600()),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                child: Text("Tell others what you think",
                    style: CustomTextStyles.f12W400(
                        color: AppColors.secondaryTextColor)),
              ),

              // Rating Bar
              Center(
                child: RatingBar.builder(
                  unratedColor: AppColors.lGrey.withOpacity(0.4),
                  itemSize: 35,
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.only(left: 5, right: 5),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(
                        "Rating: $rating"); // You can log or store the rating value
                  },
                ),
              ),

              // Comment Section
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 12, bottom: 10),
                child: Text("Comment", style: CustomTextStyles.f12W600()),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                child: TextFormField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Enter your review",
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: AppColors.secondaryTextColor),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: AppColors.primaryColor),
                    ),
                    hintStyle: CustomTextStyles.f12W400(
                        color: AppColors.secondaryTextColor),
                  ),
                ),
              ),

              // Submit Button
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                child: SizedBox(
                  height: 45,
                  child: CustomElevatedButton(
                      title: "Submit Review",
                      onTap: () {
                        Navigator.pop(context);
                      }),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  // Show the app version in a popup (Dialog)
  void showAppVersionPopup(BuildContext context) async {
    String appVersion = await getAppVersion();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.extraWhite,
          title: Text("App Version"),
          content: Text("Version: $appVersion"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
