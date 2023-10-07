import 'package:fashion_share/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/setting/components/language_screen/language_screen.dart';

class LanguageController extends GetxController {
  SingingCharacter? character;

  @override
  void onInit() {
    super.onInit();
    // Set the initial selected language
    character = Get.locale?.languageCode == 'ar'
        ? SingingCharacter.arabic
        : SingingCharacter.english;
  }

  void setCharacter(SingingCharacter? value) {
    character = value;
    if (value == SingingCharacter.english) {
      Get.updateLocale(const Locale('en'));
    } else if (value == SingingCharacter.arabic) {
      Get.updateLocale(const Locale('ar'));
    }
    Get.off(const SettingScreen());
    // back to setting screen
    update();
  }
}
