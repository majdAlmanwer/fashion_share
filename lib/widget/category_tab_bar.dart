import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/controller/loader_controller.dart';
import 'package:fashion_share/controller/models_controller.dart';
import 'package:fashion_share/controller/product_controller.dart';
import 'package:fashion_share/screens/home/categories/catygories_screen.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:fashion_share/widget/circle_shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';

import '../routes/routes.dart';

class CategoryTabBar extends StatefulWidget {
  const CategoryTabBar({super.key});

  @override
  State<CategoryTabBar> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  ModelsController modelsController = Get.put(ModelsController());
  LoaderController loaderController = Get.put(LoaderController());
  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: getPercentScreenHeight(23),
      width: getPercentScreenWidth(95),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Categories'.tr,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'segoeuiBold')),
            InkWell(
              onTap: () {
                Get.to(CategoriesScreen());
              },
              child: Text('See All'.tr,
                  style: const TextStyle(
                      color: sblueColor,
                      fontSize: 14,
                      fontFamily: 'segoeuiBold')),
            ),
          ],
        ).paddingOnly(bottom: 15, top: 10),
        GetBuilder<ModelsController>(
          builder: (controller) => loaderController.loading.value
              ? CircleShimmerLoader()
              : SizedBox(
                  height: getPercentScreenHeight(14),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: controller.modelsList.category!.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          productController.categoryId.value =
                              controller.modelsList.category![index].id;
                        });

                        Get.toNamed(AppRoutes.productlistscreen, arguments: {
                          'itemCount': productController.productsList.length,
                          'list': productController.productsList,
                          'pageiationLinks': productController.pageiationLinks,
                        });
                      },
                      child: Container(
                          width: getPercentScreenWidth(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              controller.modelsList.category![index].image
                                      .isNotEmpty
                                  ? CircleAvatar(
                                      radius: getPercentScreenWidth(7),
                                      backgroundImage: NetworkImage(controller
                                          .modelsList.category![index].image),
                                    )
                                  : Image.asset('assets/images/Frame2.png'),
                              SizedBox(
                                height: getPercentScreenHeight(1),
                              ),
                              AutoSizeText(
                                  controller.modelsList.category![index].name,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  maxFontSize: 15,
                                  minFontSize: 14,
                                  style: const TextStyle(
                                      color: blackcolor, fontFamily: 'segoeui'))
                            ],
                          )).paddingAll(1),
                    ),
                  ),
                ),
        )
      ]),
    );
  }
}
