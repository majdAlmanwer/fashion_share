import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/controller/loader_controller.dart';
import 'package:fashion_share/controller/models_controller.dart';
import 'package:fashion_share/controller/product_controller.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:fashion_share/widget/custom_bottom_nav_bar.dart';
import 'package:fashion_share/widget/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/app_color.dart';
import '../../../widget/custom_alert_dialog.dart';
import '../../../widget/nav_bar.dart';
import '../../../widget/titel_row.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({
    super.key,
  });

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  // ModelsController modelsController = Get.put(ModelsController());
  ProductController productController = Get.put(ProductController());
  LoaderController loaderController = Get.put(LoaderController());
  // void initState() {
  //   // TODO: implement initState
  //   productController.fetchProductsList();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
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
        body: GetBuilder<ModelsController>(
          builder: (controller) => loaderController.loading.value
              ? ShimmerLoader()
              : Column(
                  children: [
                    TitleRow(widget: Text(''), title: 'Categories'.tr),
                    Expanded(
                      child: Container(
                        // height: MediaQuery.of(context).size.height,
                        width: getPercentScreenWidth(95),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.modelsList.section!.length,
                          itemBuilder: (ctx, index1) => Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                height: getPercentScreenHeight(8),
                                width: getPercentScreenWidth(95),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        controller
                                            .modelsList.section![index1].name,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontFamily: 'segoeuiBold')),
                                  ],
                                ),
                              ),
                              loaderController.loading.value
                                  ? ShimmerLoader()
                                  : Container(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 5),
                                      // color: Colors.amber,
                                      height: getPercentScreenHeight(15),
                                      width: getPercentScreenWidth(95),
                                      child: SizedBox(
                                        height: getPercentScreenHeight(10),
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller
                                              .modelsList.category!.length,
                                          itemBuilder: (context, index) =>
                                              InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  AppRoutes.productlistscreen,
                                                  arguments: {
                                                    'itemCount':
                                                        productController
                                                            .productsList
                                                            .length,
                                                    'list': productController
                                                        .productsList,
                                                    'pageiationLinks':
                                                        productController
                                                            .pageiationLinks,
                                                  });
                                            },
                                            child: Container(
                                                width:
                                                    getPercentScreenWidth(16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    controller
                                                            .modelsList
                                                            .category![index]
                                                            .image
                                                            .isNotEmpty
                                                        ? CircleAvatar(
                                                            radius:
                                                                getPercentScreenWidth(
                                                                    7),
                                                            backgroundImage:
                                                                NetworkImage(controller
                                                                    .modelsList
                                                                    .category![
                                                                        index]
                                                                    .image),
                                                          )
                                                        : Image.asset(
                                                            'assets/images/Frame2.png'),
                                                    SizedBox(
                                                      height:
                                                          getPercentScreenHeight(
                                                              1),
                                                    ),
                                                    AutoSizeText(
                                                        controller
                                                            .modelsList
                                                            .category![index]
                                                            .name,
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
                                                        maxFontSize: 16,
                                                        minFontSize: 15,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'segoeui'))
                                                  ],
                                                )).paddingAll(2),
                                          ),
                                        ),
                                      ),
                                    ),
                              Divider(
                                color: Colors.black,
                                indent: getPercentScreenWidth(2),
                                endIndent: getPercentScreenWidth(3),
                              )
                            ],
                          ),
                        ),
                      ).paddingOnly(bottom: getPercentScreenHeight(1)),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
