import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/controller/user_controller.dart';
import 'package:fashion_share/screens/setting/components/about_us/about_uc_screen.dart';
import 'package:fashion_share/screens/setting/components/contact_us/contact_us_screen.dart';
import 'package:fashion_share/screens/setting/components/language_screen/language_screen.dart';
import 'package:fashion_share/screens/setting/components/profile/profile_screen.dart';
import 'package:fashion_share/screens/setting/components/wardrobe/war_drobe_screen.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:fashion_share/widget/titel_row.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getPercentScreenHeight(100),
      width: getPercentScreenWidth(100),
      child: Column(
        children: [
          TitleRow(
            title: 'Profile'.tr,
            widget: Text(''),
          ),
          userController.userInfo.data!.image != null
              ? CircleAvatar(
                  radius: getPercentScreenWidth(18),
                  backgroundColor: Colors.blue[100],
                  child: Image.network(
                    '${userController.userInfo.data!.image}',
                    height: getPercentScreenHeight(16),
                    // fit: BoxFit.fitHeight,
                  ),
                ).paddingOnly(top: getPercentScreenHeight(2))
              : CircleAvatar(
                  radius: getPercentScreenWidth(18),
                  backgroundColor: Colors.blue[100],
                  child: Image.asset(
                    'assets/images/fi_user.png',
                    height: getPercentScreenHeight(16),
                    // fit: BoxFit.fitHeight,
                  ),
                ).paddingOnly(
                  top: getPercentScreenHeight(2),
                ),
          Container(
            height: getPercentScreenHeight(12),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              AutoSizeText(
                'Edit Profile'.tr,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'segoeuiBold'),
              ),
              InkWell(
                onTap: () {
                  Get.to(ProfileScreen());
                },
                child: SizedBox(
                    height: getPercentScreenHeight(10),
                    width: getPercentScreenWidth(10),
                    child: Image.asset('assets/images/state-layer.png')),
              ),
              SizedBox(
                width: getPercentScreenWidth(2),
              ),
            ]),
          ),
          Container(
            // color: Colors.amber,
            height: getPercentScreenHeight(40),
            width: getPercentScreenWidth(90),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(WarDrobeScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: getPercentScreenHeight(5),
                              width: getPercentScreenWidth(8),
                              child: Image.asset('assets/images/fi_shirt.png')),
                          SizedBox(
                            width: getPercentScreenWidth(2),
                          ),
                          Text(
                            'My WarDrobe'.tr,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontFamily: 'segoeuiBold'),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(WarDrobeScreen());
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: getPercentScreenHeight(5),
                              width: getPercentScreenWidth(8),
                              child: Image.asset('assets/images/fi_bell.png')),
                          SizedBox(
                            width: getPercentScreenWidth(2),
                          ),
                          Text(
                            'Notifications'.tr,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontFamily: 'segoeuiBold'),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    Get.to(LanguageScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: getPercentScreenHeight(5),
                              width: getPercentScreenWidth(8),
                              child: Image.asset('assets/images/fi_globe.png')),
                          SizedBox(
                            width: getPercentScreenWidth(2),
                          ),
                          Text(
                            'Language'.tr,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontFamily: 'segoeuiBold'),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(LanguageScreen());
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    Get.to(ContactUsScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: getPercentScreenHeight(5),
                              width: getPercentScreenWidth(8),
                              child: Image.asset(
                                  'assets/images/fi_phone-call.png')),
                          SizedBox(
                            width: getPercentScreenWidth(2),
                          ),
                          Text(
                            'Contact Us'.tr,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontFamily: 'segoeuiBold'),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(ContactUsScreen());
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    Get.to(AboutUsScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: getPercentScreenHeight(5),
                              width: getPercentScreenWidth(8),
                              child: Image.asset('assets/images/fi_info.png')),
                          SizedBox(
                            width: getPercentScreenWidth(2),
                          ),
                          Text(
                            'About Us'.tr,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontFamily: 'segoeuiBold'),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(AboutUsScreen());
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
