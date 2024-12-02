import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF2A6AB5);
  static const secondaryColor = Color(0xFFF1A819);
  static const lightBlueColor = Color(0xFF84D3EC);
  static const tertiaryColor = Color(0xFFFFFFFF);
  static const backGroundColor = tertiaryColor;
  static const borderColor = Color(0xFFA3A3A3);
  static const textColor = Color(0xFF303030);
  static const textColorAccent = Color(0xFFC5C5C5);
  static const hintTextColor = borderColor;

  static const errorColor = Color(0XFFFF6363);
  static const primeYellow = Color(0xFFF7E0B1);

  static const extraWhite = Color(0xFFFFFFFF);

  static const unselectedGrey = Color(0xFFD4D4D4);
  static const textGreyColor = Color(0xFF7C7A7A);

  static const accepted = Color.fromRGBO(0, 167, 67, 1);
  static const rejected = Color.fromRGBO(255, 59, 59, 1);

  static Color shadowColor = const Color(0xFF494949).withOpacity(0.06);

  static final shimmerBase = Colors.grey.withOpacity(0.20);
  static const Color shimmerHighlight = Color(0xFFE1E1E1);

  static const Color lGrey = Color(0xFF909090);
  static const Color secondaryTextColor = Color(0xFFAAAAAA);

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
