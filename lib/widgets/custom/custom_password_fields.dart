import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/custom_text_style.dart';
import '../../utils/image_path.dart';
import '../../utils/validator.dart';

class CustomPasswordField extends StatelessWidget {
  final String hint;
  final FocusNode? focusNode;
  final bool eye;
  final VoidCallback onEyeClick;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Function(String)? onSubmitted;
  final String? labelText;

  const CustomPasswordField({
    super.key,
    required this.hint,
    required this.eye,
    required this.onEyeClick,
    required this.controller,
    required this.textInputAction,
    this.validator,
    this.onSubmitted,
    this.focusNode,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: TextFormField(
        focusNode: focusNode,
        onFieldSubmitted: onSubmitted,
        controller: controller,
        validator: validator ?? Validators.checkPasswordField,
        obscureText: eye,
        maxLines: 1,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          label: labelText != null
              ? Text(
                  labelText ?? "",
                  style: CustomTextStyles.f16W400(
                    color: AppColors.primaryColor,
                  ),
                )
              : null,
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(width: 1, color: AppColors.secondaryTextColor),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.errorColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.errorColor),
          ),
          suffixIcon: IconButton(
            onPressed: onEyeClick,
            icon: (eye)
                ? SvgPicture.asset(
                    ImagePath.eyeOff,
                    height: 27,
                    colorFilter: const ColorFilter.mode(
                        AppColors.textGreyColor, BlendMode.srcIn),
                    fit: BoxFit.scaleDown,
                  )
                : SvgPicture.asset(
                    ImagePath.eye,
                    height: 12,
                    colorFilter: const ColorFilter.mode(
                        AppColors.textGreyColor, BlendMode.srcIn),
                    fit: BoxFit.scaleDown,
                  ),
          ),
          errorStyle: const TextStyle(fontSize: 10),
          hintText: hint,
          hintStyle:
              CustomTextStyles.f16W400(color: AppColors.secondaryTextColor),
        ),
        style: CustomTextStyles.f16W400(),
      ),
    );
  }
}
