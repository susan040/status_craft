import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  var selectedLocale = Locale('en').obs;

  @override
  void onInit() {
    super.onInit();
    _loadLanguage();
  }

  void changeLanguage(String languageCode) async {
    var locale = Locale(languageCode);
    selectedLocale.value = locale;
    Get.updateLocale(locale);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language_preference', languageCode);
  }

  void _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language_preference') ?? 'en';
    selectedLocale.value = Locale(languageCode);
    Get.updateLocale(Locale(languageCode));
  }
}
