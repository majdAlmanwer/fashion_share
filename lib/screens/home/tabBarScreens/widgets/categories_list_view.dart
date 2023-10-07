import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/controller/favorite_controller.dart';
import 'package:fashion_share/controller/loader_controller.dart';
import 'package:fashion_share/controller/models_controller.dart';
import 'package:fashion_share/controller/product_controller.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:fashion_share/widget/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/routes.dart';

class CategoriesListView extends StatefulWidget {
  CategoriesListView({super.key, required this.itemCount, required this.list});
  var itemCount;
  var list;

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  // ModelsController modelsController = Get.put(ModelsController());
  ProductController productController = Get.put(ProductController());
  LoaderController loaderController = Get.put(LoaderController());
  FavoriteController favoriteController = Get.put(FavoriteController());

  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModelsController>(
      builder: (controller) => loaderController.loading.value
          ? ShimmerLoader()
          : Container(
              // height: getPercentScreenHeight(100),
              width: getPercentScreenWidth(100),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.modelsList.category!.length,
                itemBuilder: (ctx, index1) => Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      height: getPercentScreenHeight(8),
                      width: getPercentScreenWidth(95),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.modelsList.category![index1].name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'segoeuiBold')),
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.productlistscreen,
                                  arguments: {
                                    'itemCount': widget.list
                                        .where((element) =>
                                            element.categories!.id ==
                                            controller.modelsList
                                                .category![index1].id)
                                        .length,
                                    'list': widget.list
                                        .where((element) =>
                                            element.categories!.id ==
                                            controller.modelsList
                                                .category![index1].id)
                                        .toList(),
                                    'pageiationLinks':
                                        productController.pageiationLinks,
                                  });
                              print(widget.list.where((element) =>
                                  element.categories!.id ==
                                  controller.modelsList.category![index1].id));
                            },
                            child: Text('See All'.tr,
                                style: const TextStyle(
                                    color: sblueColor,
                                    fontSize: 14,
                                    fontFamily: 'segoeuiBold')),
                          ),
                        ],
                      ),
                    ),
                    loaderController.loading.value
                        ? ShimmerLoader()
                        : widget.list
                                    .where((element) =>
                                        element.categories!.id ==
                                        controller
                                            .modelsList.category![index1].id)
                                    .length ==
                                0
                            ? Container(
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin:
                                    const EdgeInsets.only(left: 3, right: 3),
                                height: getPercentScreenHeight(24),
                                width: getPercentScreenWidth(40),
                                child: const Center(
                                  child: Text('No Product',
                                      style: TextStyle(
                                        // fontSize: 15,
                                        color: blackcolor,
                                        fontFamily: 'segoeui',
                                      )),
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.only(left: 2, right: 1),
                                margin: EdgeInsets.only(
                                  left: 10,
                                ),
                                // color: Colors.amber,
                                height: getPercentScreenHeight(35),
                                width: getPercentScreenWidth(100),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemExtent: getPercentScreenWidth(43),
                                  itemCount: widget.list
                                      .where((element) =>
                                          element.categories!.id ==
                                          controller
                                              .modelsList.category![index1].id)
                                      .length,
                                  itemBuilder: (ctx, int index) => InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.productdetails,
                                          arguments: {
                                            'product': widget.list[index],
                                            'index': index
                                          });

                                      print('pppppppppppp${index}');
                                    },
                                    child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              margin: const EdgeInsets.only(
                                                  left: 3, right: 3),
                                              height:
                                                  getPercentScreenHeight(24),
                                              width: getPercentScreenWidth(40),
                                              // alignment: Alignment.center,
                                              child: widget.list[index].images!
                                                      .first.path!.isNotEmpty
                                                  ? ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: widget
                                                            .list[index]
                                                            .images
                                                            .length,
                                                        itemBuilder:
                                                            (context, index2) =>
                                                                Image.network(
                                                          "${widget.list[index].images![index2].path}",
                                                          // proList[index].image!,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    )
                                                  : Image.asset(
                                                      'assets/images/Frame2.png',
                                                      // proList[index].image!,
                                                      fit: BoxFit.contain,
                                                    ),
                                              // AutoSizeText(proList[index].name!,
                                              //     style: TextStyle(
                                              //         fontSize: 13,
                                              //         fontFamily: 'AGCRegular',
                                              //         fontWeight: FontWeight.bold,
                                              //         color: SPrimaryColor)),
                                            ).paddingAll(
                                                getPercentScreenWidth(1)),
                                            AutoSizeText(
                                                    '${widget.list[index].name}',
                                                    maxLines: 1,
                                                    maxFontSize: 16,
                                                    minFontSize: 15,
                                                    style: const TextStyle(
                                                      // fontSize: 15,
                                                      color: blackcolor,
                                                      fontFamily: 'segoeui',
                                                    ))
                                                .paddingAll(
                                                    getPercentScreenWidth(1)),
                                            AutoSizeText(
                                                    'SP ' +
                                                        '${widget.list[index].price} ',
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: sblueColor,
                                                      fontFamily: 'segoeuiBold',
                                                    ))
                                                .paddingAll(
                                                    getPercentScreenWidth(1))
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            favoriteController.addItemToCart(
                                                widget.list[index]);
                                            // setState(() {
                                            //   isSelect = true;
                                            // });
                                          },
                                          child: GetBuilder<FavoriteController>(
                                            builder: (controller) =>
                                                favoriteController
                                                        .isItemAlreadyAdded(
                                                            widget.list[index])
                                                    ? CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor:
                                                            Colors.red,
                                                        child: Icon(
                                                          Icons.favorite,
                                                          color: Colors.white,
                                                        ))
                                                    : CircleAvatar(
                                                        radius: 15,
                                                        backgroundColor:
                                                            Colors.white,
                                                        child: Image.asset(
                                                          'assets/images/fi_HEART.png',
                                                          height:
                                                              getPercentScreenHeight(
                                                                  3),
                                                          width:
                                                              getPercentScreenWidth(
                                                                  8),
                                                        ),
                                                      ),
                                          ),
                                        ).paddingAll(10),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                  ],
                ),
              ),
            ).paddingOnly(bottom: getPercentScreenHeight(1)),
    );
  }
}
