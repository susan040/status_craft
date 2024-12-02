import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';
import 'package:status_craft/utils/image_path.dart';

class SettingScreen extends StatelessWidget {
  static String routeName = "/setting-screen";
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
          backgroundColor: AppColors.extraWhite,
          centerTitle: false,
          title: const Image(
            image: AssetImage(ImagePath.mainLogo),
            height: 50,
            width: 50,
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: CustomTextStyles.f16W600(),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Language Preference", style: CustomTextStyles.f14W400()),
                // Obx(() {
                //   return DropdownButton<String>(
                //     value: languageController.selectedLocale.value.languageCode,
                //     onChanged: (String? newValue) {
                //       if (newValue != null) {
                //         languageController.changeLanguage(newValue);
                //       }
                //     },
                //     items: const [
                //       DropdownMenuItem<String>(
                //         value: 'en',
                //         child: Text('English'),
                //       ),
                //       DropdownMenuItem<String>(
                //         value: 'ne',
                //         child: Text('Nepali'),
                //       ),
                //       // DropdownMenuItem<String>(
                //       //   value: 'fr',
                //       //   child: Text('French'),
                //       // ),
                //     ],
                //   );
                // }),
              ],
            ),
            const SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Invite Friends", style: CustomTextStyles.f14W400()),
                SvgPicture.asset(
                  ImagePath.arrowRight,
                  height: 18,
                  width: 18,
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text(
              "Support",
              style: CustomTextStyles.f16W600(),
            ),
            const SizedBox(height: 14),
            Container(
              height: 93,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.extraWhite,
                  borderRadius: BorderRadiusDirectional.circular(17),
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 1,
                        color: AppColors.unselectedGrey)
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Contact Support",
                            style: CustomTextStyles.f14W400()),
                        SvgPicture.asset(
                          ImagePath.arrowRight,
                          height: 18,
                          width: 18,
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1.2),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rate the app", style: CustomTextStyles.f14W400()),
                        const Icon(
                          Icons.star_border_outlined,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
