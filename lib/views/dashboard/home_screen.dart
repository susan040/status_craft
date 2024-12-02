import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:status_generator/utils/colors.dart';
import 'package:status_generator/utils/custom_text_style.dart';
import 'package:status_generator/utils/image_path.dart';
import 'package:status_generator/widgets/custom/custom_textfield.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home-screen";
  const HomeScreen({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Evolve", style: CustomTextStyles.f18W600()),
                  const SizedBox(width: 5),
                  Text("your",
                      style: CustomTextStyles.f18W600(
                          color: AppColors.secondaryColor)),
                ],
              ),
              const SizedBox(height: 4),
              Text("thoughts",
                  style:
                      CustomTextStyles.f18W600(color: AppColors.primaryColor)),
              const SizedBox(height: 14),
              const CustomTextField(
                  maxLines: 14,
                  hint: "Write here.....",
                  textInputAction: TextInputAction.continueAction,
                  textInputType: TextInputType.multiline),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Output Language",
                              style: CustomTextStyles.f14W600()),
                          const SizedBox(width: 5),
                          Row(
                            children: [
                              // const Image(
                              //   image: AssetImage("assets/icons/flags.png"),
                              // ),
                              const SizedBox(width: 3),
                              Text(
                                "English(U.S)",
                                style: CustomTextStyles.f14W400(
                                    color: AppColors.lGrey),
                              ),
                            ],
                          )
                        ],
                      ),
                      SvgPicture.asset(
                        ImagePath.arrowRight,
                        color: AppColors.textColor,
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 150, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Text("Submit",
                            style: CustomTextStyles.f14W600(
                                color: AppColors.extraWhite)),
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset(
                        ImagePath.arrowRight,
                        color: AppColors.extraWhite,
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
