import 'package:fashion_share/controller/bottom_nav_bar_controller.dart';

import 'package:fashion_share/screens/add_product/add_product_screen.dart';

import 'package:fashion_share/utils/app_color.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({
    super.key,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  // var selectedIndex = 0;

  // _onItemTapped(int index) {
  //   // setState(() {
  //   selectedIndex = index;
  //   switch (index) {
  //     case 0:
  //       Get.to(HomeScreen());
  //       break;
  //     case 1:
  //       Get.to(CategoriesScreen());
  //       break;
  //     case 2:
  //       Get.to(FavoriteScreen());
  //       break;
  //     case 3:
  //       Get.to(SettingScreen());
  //       break;
  //   }
  //   // });
  // }
  CustomBottomNavBarController customBottomNavBarController =
      Get.put(CustomBottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomNavBarController>(
      builder: (controller) => AnimatedBottomNavigationBar(
        barColor: Colors.white,
        controller: FloatingBottomBarController(
          initialIndex: controller.selectedIndex.value,
        ),
        bottomBar: [
          BottomBarItem(
              icon: Image.asset(
                'assets/images/fi_home_1.png',
                height: getPercentScreenHeight(3),
                width: getPercentScreenWidth(8),
              ),
              iconSelected: Image.asset(
                'assets/images/fi_home.png',
                height: getPercentScreenHeight(3),
                width: getPercentScreenWidth(8),
              ),
              title: 'home'.tr,
              dotColor: sblueColor,
              onTap: (index) => controller.changeSelectedIndex(index)),
          BottomBarItem(
              icon: Image.asset(
                'assets/images/fi_grid.png',
                height: getPercentScreenHeight(3),
                width: getPercentScreenWidth(8),
              ),
              iconSelected: Image.asset(
                'assets/images/fi_grid_blue.png',
                height: getPercentScreenHeight(3),
                width: getPercentScreenWidth(8),
              ),
              title: 'Categories'.tr,
              dotColor: sblueColor,
              onTap: (index) => controller.changeSelectedIndex(index)),
          BottomBarItem(
              icon: const Icon(
                Icons.favorite_border,
                size: 25,
                color: Colors.black54,
              ),
              iconSelected: const Icon(Icons.favorite_border_outlined,
                  color: sblueColor, size: 25),
              title: 'Favorite'.tr,
              dotColor: sblueColor,
              onTap: (index) => controller.changeSelectedIndex(index)),
          BottomBarItem(
              icon: Image.asset(
                'assets/images/fi_user-1.png',
                height: getPercentScreenHeight(3),
                width: getPercentScreenWidth(8),
              ),
              iconSelected: Image.asset(
                'assets/images/fi_user.png',
                height: getPercentScreenHeight(3),
                width: getPercentScreenWidth(8),
              ),
              title: 'Profile'.tr,
              dotColor: sblueColor,
              onTap: (index) => controller.changeSelectedIndex(index)),
        ],
        bottomBarCenterModel: BottomBarCenterModel(
          centerBackgroundColor: sblueColor,
          centerIcon: const FloatingCenterButton(
            child: Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
          centerIconChild: [
            FloatingCenterButtonChild(
              child: Text(
                'Sell'.tr,
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.to(const AddProductScreen());
                print('Item1');
              },
            ),
            FloatingCenterButtonChild(
              child: Text(
                'Rent'.tr,
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () => print('Item3'),
            ),
          ],
        ),
      ),
    );
  }
}
