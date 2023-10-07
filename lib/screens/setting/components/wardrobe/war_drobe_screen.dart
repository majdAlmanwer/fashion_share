import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/controller/favorite_controller.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:fashion_share/widget/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/app_config.dart';

import '../../../../widget/nav_bar.dart';
import '../../../../widget/titel_row.dart';

class WarDrobeScreen extends StatefulWidget {
  const WarDrobeScreen({super.key});

  @override
  State<WarDrobeScreen> createState() => _WarDrobeScreenState();
}

class _WarDrobeScreenState extends State<WarDrobeScreen> {
  FavoriteController favoriteController = Get.put(FavoriteController());
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: sblueColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TitleRow(
                title: 'My Wardrobe',
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
              GetBuilder<FavoriteController>(
                builder: (controller) => controller.favoriteList.isEmpty ||
                        controller.favoriteList.length == 0
                    ? Container(
                        height: getPercentScreenHeight(80),
                        width: getPercentScreenWidth(80),
                        child: Column(
                          children: [
                            Image.asset('assets/images/undraw.png',
                                // proList[index].image!,
                                fit: BoxFit.contain,
                                scale: 0.1,
                                width: getPercentScreenWidth(70),
                                height: getPercentScreenHeight(50)),
                            AutoSizeText('You Have No Items In Your Wardrobe',
                                style: const TextStyle(
                                    fontFamily: 'AGCBold',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                      )
                    : Container(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          // itemExtent: getPercentScreenWidth(35),
                          itemCount: controller.favoriteList.length,
                          itemBuilder: (ctx, int index) => Container(
                            height: getPercentScreenHeight(15),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white
                                // boxShadow: const [
                                //   BoxShadow(
                                //     blurStyle: BlurStyle.normal,
                                //     color: SGreyColor,
                                //     offset: Offset(10.0, 10.0), //(x,y)
                                //     blurRadius: 10.0,
                                //   ),
                                // ],
                                ),
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: getPercentScreenWidth(60),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        // width: getPercentScreenWidth(100),
                                        child: Row(
                                          children: [
                                            // AutoSizeText('${'Product Name'.tr} : ',
                                            //     style: const TextStyle(
                                            //         fontFamily: 'AGCBold',
                                            //         fontSize: 15,
                                            //         fontWeight: FontWeight.bold,
                                            //         color: Colors.black)),
                                            SizedBox(
                                              width: getPercentScreenWidth(35),
                                              child: AutoSizeText(
                                                  controller.favoriteList[index]
                                                              .name !=
                                                          null
                                                      ? controller
                                                          .favoriteList[index]
                                                          .name!
                                                      : '',
                                                  maxFontSize: 20,
                                                  minFontSize: 18,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      fontFamily: 'AGCBold',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: getPercentScreenWidth(100),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AutoSizeText('${'Rent'.tr} : ',
                                                style: const TextStyle(
                                                    fontFamily: 'AGCBold',
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black45)),
                                            SizedBox(
                                              width: getPercentScreenWidth(20),
                                              child: AutoSizeText(
                                                  controller.favoriteList[index]
                                                              .price !=
                                                          null
                                                      ? '${controller.favoriteList[index].price!}'
                                                      : '',
                                                  maxFontSize: 18,
                                                  minFontSize: 16,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      fontFamily: 'AGCBold',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: sblueColor)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: getPercentScreenWidth(25),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: controller.favoriteList[index]
                                            .images!.isNotEmpty
                                        // cartController
                                        //     .cartItems[index].itemImage!.isNotEmpty ||
                                        // cartController.cartItems[index].itemImage == ''
                                        ? Image.network(
                                            "${controller.favoriteList[index].images!.first.path!}",
                                            // proList[index].image!,
                                            fit: BoxFit.contain,
                                            scale: 0.1,
                                            width: getPercentScreenWidth(25),
                                            height: getPercentScreenHeight(15))
                                        : Image.asset('assets/images/Group.png',
                                            // proList[index].image!,
                                            fit: BoxFit.contain,
                                            scale: 0.1,
                                            width: getPercentScreenWidth(25),
                                            height: getPercentScreenHeight(15)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
