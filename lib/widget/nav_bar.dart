import 'package:fashion_share/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bottom_nav_bar_controller.dart';
import '../utils/app_config.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  CustomBottomNavBarController customBottomNavBarController =
      Get.put(CustomBottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomNavBarController>(
      builder: (controller) {
        return Container(
          height: getPercentScreenHeight(8),
          // padding: EdgeInsets.all(8),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedLabelStyle:
                TextStyle(color: Colors.black, fontFamily: 'segoeui'),
            unselectedLabelStyle:
                TextStyle(color: Colors.black, fontFamily: 'segoeui'),
            selectedItemColor: sblueColor,
            unselectedItemColor: Colors.black45,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeSelectedIndex,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                // tooltip: 'home',
                activeIcon: Image.asset(
                  'assets/images/fi_home.png',
                  height: getPercentScreenHeight(3),
                  width: getPercentScreenWidth(8),
                ),
                icon: Image.asset(
                  'assets/images/fi_home_1.png',
                  height: getPercentScreenHeight(3),
                  width: getPercentScreenWidth(8),
                ),
                label: 'Home'.tr,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/fi_grid.png',
                  height: getPercentScreenHeight(3),
                  width: getPercentScreenWidth(8),
                ),
                label: 'Category'.tr,
              ),
              const BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 10,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/images/fi_HEART_blue.png',
                  height: getPercentScreenHeight(3),
                  width: getPercentScreenWidth(8),
                ),
                icon: Image.asset(
                  'assets/images/fi_HEART.png',
                  height: getPercentScreenHeight(3),
                  width: getPercentScreenWidth(8),
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'assets/images/fi_user.png',
                  height: getPercentScreenHeight(3),
                  width: getPercentScreenWidth(8),
                ),
                icon: Image.asset(
                  'assets/images/fi_user-1.png',
                  height: getPercentScreenHeight(3),
                  width: getPercentScreenWidth(8),
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
