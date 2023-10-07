import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/controller/favorite_controller.dart';
import 'package:fashion_share/utils/app_color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/app_config.dart';
import '../../../../widget/custom_alert_dialog.dart';
import '../../../../widget/nav_bar.dart';
import '../../../../widget/titel_row.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
          onPressed: () {
            showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) {
                return CustomAlertDialog();
              },
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: sblueColor,
        ),
        body: Column(
          children: [
            TitleRow(title: 'Favorite'.tr, widget: Text('')),
            GetBuilder<FavoriteController>(
              builder: (controller) => controller.favoriteList.isEmpty
                  ? Container(
                      height: getPercentScreenHeight(80),
                      width: getPercentScreenWidth(80),
                      child: Column(
                        children: [
                          Image.asset('assets/images/wishlist.png',
                              // proList[index].image!,
                              fit: BoxFit.contain,
                              scale: 0.1,
                              width: getPercentScreenWidth(70),
                              height: getPercentScreenHeight(50)),
                          AutoSizeText('You Have No favorites Right Now'.tr,
                              style: const TextStyle(
                                  fontFamily: 'segoeuiBold',
                                  fontSize: 18,
                                  color: Colors.black)),
                        ],
                      ),
                    )
                  : Expanded(
                      child: Container(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          // itemExtent: getPercentScreenWidth(35),
                          itemCount: controller.favoriteList.length,
                          itemBuilder: (ctx, int index) => InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.productdetails, arguments: {
                                'product': controller.favoriteList[index]
                              });
                            },
                            child: Container(
                              height: getPercentScreenHeight(17),
                              decoration: BoxDecoration(
                                  // border: Border.none,
                                  borderRadius: BorderRadius.circular(16),
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
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width:
                                                    getPercentScreenWidth(30),
                                                child: AutoSizeText(
                                                    controller
                                                                .favoriteList[
                                                                    index]
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
                                                        fontFamily:
                                                            'segoeuiBold',
                                                        fontSize: 12,
                                                        color: Colors.black)),
                                              ),
                                              AutoSizeText(
                                                  controller
                                                      .favoriteList[index].sku!,
                                                  maxFontSize: 20,
                                                  minFontSize: 18,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      fontFamily: 'segoeuiBold',
                                                      color: Colors.black)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: getPercentScreenWidth(100),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AutoSizeText(
                                                  controller.favoriteList[index]
                                                              .isForSale ==
                                                          0
                                                      ? '${'Rent'.tr}  '
                                                      : '${'Sell'.tr}  ',
                                                  style: const TextStyle(
                                                      fontFamily: 'segoeuiBold',
                                                      fontSize: 14,
                                                      color: Colors.black45)),
                                              SizedBox(
                                                width:
                                                    getPercentScreenWidth(20),
                                                child: AutoSizeText(
                                                    controller
                                                                .favoriteList[
                                                                    index]
                                                                .price !=
                                                            null
                                                        ? '${controller.favoriteList[index].price!}'
                                                        : '',
                                                    maxFontSize: 18,
                                                    minFontSize: 16,
                                                    maxLines: 1,
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            'segoeuiBold',
                                                        fontSize: 12,
                                                        color: sblueColor)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        AutoSizeText(
                                            '${controller.favoriteList[index].branch!.name}  ',
                                            style: const TextStyle(
                                                fontFamily: 'segoeuiBold',
                                                fontSize: 14,
                                                color: sblueColor)),
                                        InkWell(
                                          onTap: () {
                                            controller
                                                .removeSelectedItemFromCart(
                                                    index);
                                            print(
                                                'delete item from favorite list ');
                                          },
                                          child: SizedBox(
                                            width: getPercentScreenWidth(100),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                    radius: 15,
                                                    backgroundColor: Colors.red,
                                                    child: Icon(
                                                      Icons.favorite,
                                                      color: Colors.white,
                                                    )),
                                                SizedBox(
                                                  width:
                                                      getPercentScreenWidth(2),
                                                ),
                                                AutoSizeText(
                                                    'Remove from favorites'.tr,
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            'segoeuiBold',
                                                        fontSize: 15,
                                                        color: Colors.black45)),
                                              ],
                                            ),
                                          ).paddingOnly(
                                              top: getPercentScreenHeight(1)),
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
                                              height:
                                                  getPercentScreenHeight(15))
                                          : Image.asset(
                                              'assets/images/Group.png',
                                              // proList[index].image!,
                                              fit: BoxFit.contain,
                                              scale: 0.1,
                                              width: getPercentScreenWidth(25),
                                              height:
                                                  getPercentScreenHeight(15)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
