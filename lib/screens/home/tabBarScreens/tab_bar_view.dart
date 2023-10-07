import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

import 'package:fashion_share/screens/home/tabBarScreens/all_screen.dart';
import 'package:fashion_share/screens/home/tabBarScreens/kids_screen.dart';
import 'package:fashion_share/screens/home/tabBarScreens/man_screen.dart';
import 'package:fashion_share/screens/home/tabBarScreens/rent_screen.dart';
import 'package:fashion_share/screens/home/tabBarScreens/women_screen.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';

class CustomTabBarView extends StatefulWidget {
  const CustomTabBarView({super.key});

  @override
  State<CustomTabBarView> createState() => _CustomTabBarViewState();
}

class _CustomTabBarViewState extends State<CustomTabBarView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      padding: const EdgeInsets.all(1),
      width: getPercentScreenWidth(100),
      height: getPercentScreenHeight(100),
      child: ContainedTabBarView(
        initialIndex: 0,
        tabBarViewProperties:
            const TabBarViewProperties(physics: NeverScrollableScrollPhysics()),
        tabBarProperties: TabBarProperties(
          indicatorColor: sblueColor,
          height: getPercentScreenHeight(5),
          indicatorWeight: 3,
          labelColor: Colors.black,
        ),
        tabs: [
          // Container(
          //   height: getPercentScreenHeight(100),
          //   width: getPercentScreenWidth(100),
          //   color: Colors.white,
          //   child: Center(
          //     child: Text(
          //       'All'.tr,
          //       style: const TextStyle(
          //         // color: SPrimaryColor,
          //         fontSize: 16,
          //         fontFamily: 'segoeui',
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            height: getPercentScreenHeight(100),
            width: getPercentScreenWidth(100),
            color: Colors.white,
            child: Center(
              child: Text(
                'Women'.tr,
                style: const TextStyle(
                  fontFamily: 'segoeui',
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            height: getPercentScreenHeight(100),
            width: getPercentScreenWidth(100),
            color: Colors.white,
            child: Center(
              child: Text(
                'Men'.tr,
                style: const TextStyle(
                  fontFamily: 'segoeui',
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            height: getPercentScreenHeight(100),
            width: getPercentScreenWidth(100),
            color: Colors.white,
            child: Center(
              child: Text(
                'Kids'.tr,
                style: const TextStyle(
                  fontFamily: 'segoeui',
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            height: getPercentScreenHeight(100),
            width: getPercentScreenWidth(100),
            color: Colors.white,
            child: Center(
              child: Text(
                'Rent'.tr,
                style: const TextStyle(
                  fontFamily: 'segoeui',
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
        views: [
          // Container(
          //   height: getPercentScreenHeight(90),
          //   child: const AllProductScreen(),
          // ),
          Container(
            height: getPercentScreenHeight(90),
            child: const WomenScreen(),
          ),
          Container(
            height: getPercentScreenHeight(90),
            child: const MenScreen(),
          ),
          Container(
            height: getPercentScreenHeight(90),
            child: const KidsScreen(),
          ),
          Container(
            height: getPercentScreenHeight(90),
            child: const RentScreen(),
          ),
        ],
      ),
    );
  }
}
