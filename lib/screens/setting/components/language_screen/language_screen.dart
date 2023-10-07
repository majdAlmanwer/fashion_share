import 'package:fashion_share/controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widget/titel_row.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

enum SingingCharacter { arabic, english }

class _LanguageScreenState extends State<LanguageScreen> {
  LanguageController languageController = Get.put(LanguageController());
  SingingCharacter? character = SingingCharacter.english;
  @override
  void initState() {
    super.initState();
    // Set the default selected language as the current language
    character = Get.locale?.languageCode == 'ar'
        ? SingingCharacter.arabic
        : SingingCharacter.english;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: GetBuilder<LanguageController>(
            builder: (controller) => Column(
              children: [
                TitleRow(
                  title: 'Language'.tr,
                  widget: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 25,
                      ),
                      onPressed: () {
                        Get.back();
                      }),
                ),
                ListTile(
                  title: const Text('english'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.english,
                    groupValue: controller.character,
                    onChanged: (SingingCharacter? value) {
                      // setState(() {
                      controller.setCharacter(SingingCharacter.english);
                      // character = value!;
                      // Get.updateLocale(const Locale('en'));
                      // });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('العربية'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.arabic,
                    groupValue: controller.character,
                    onChanged: (SingingCharacter? value) {
                      // setState(() {
                      controller.setCharacter(SingingCharacter.arabic);
                      // character = value!;
                      // Get.updateLocale(const Locale('ar'));
                      // });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
