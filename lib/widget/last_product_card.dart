import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/controller/loader_controller.dart';
import 'package:fashion_share/controller/product_controller.dart';
import 'package:fashion_share/model/product_list_model.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/favorite_controller.dart';
import '../routes/routes.dart';
import '../utils/app_config.dart';

class LastProdutCard extends StatefulWidget {
  LastProdutCard(
      {super.key,
      required this.itemCount,
      required this.list,
      required this.pageiationLinks});
  int itemCount;
  var list;
  Meta pageiationLinks;
  @override
  State<LastProdutCard> createState() => _LastProdutCardState();
}

class _LastProdutCardState extends State<LastProdutCard> {
  LoaderController loaderController = Get.put(LoaderController());
  ProductController productController = Get.put(ProductController());
  FavoriteController favoriteController = Get.put(FavoriteController());

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   productController.fetchProductsList();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          height: getPercentScreenHeight(8),
          width: getPercentScreenWidth(95),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Last Products'.tr,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'segoeuiBold')),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.productlistscreen, arguments: {
                    'itemCount': productController.productsList.length,
                    'list': productController.productsList,
                    'pageiationLinks': productController.pageiationLinks,
                  });
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
        Container(
          padding: const EdgeInsets.only(left: 1, right: 1),
          margin: const EdgeInsets.only(
            left: 10,
          ),
          // color: Colors.amber,

          height: getPercentScreenHeight(35),
          width: getPercentScreenWidth(100),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemExtent: getPercentScreenWidth(43),
            itemCount: widget.itemCount,
            itemBuilder: (ctx, int index) => InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.productdetails,
                    arguments: {'product': widget.list[index]});

                print('pppppppppppp${index}');
              },
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: getPercentScreenHeight(24),
                        width: getPercentScreenWidth(40),
                        // alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 3, right: 3),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(12)),

                        child: widget.list[index].images!.first.path!.isNotEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  "${widget.list[index].images!.first.path}",
                                  // proList[index].image!,
                                  fit: BoxFit.cover,
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
                      ).paddingAll(getPercentScreenWidth(1)),
                      AutoSizeText('${widget.list[index].name}',
                              maxLines: 1,
                              maxFontSize: 16,
                              minFontSize: 15,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  // fontSize: 15,
                                  color: Colors.black,
                                  fontFamily: 'segoeui'))
                          .paddingAll(getPercentScreenWidth(1)),
                      AutoSizeText('SP ' + '${widget.list[index].price} ',
                          style: const TextStyle(
                            fontSize: 18,
                            color: sblueColor,
                            fontFamily: 'segoeuiBold',
                          )).paddingAll(getPercentScreenWidth(1))
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      favoriteController.addItemToCart(widget.list[index]);
                    },
                    child: GetBuilder<FavoriteController>(
                      builder: (controller) => favoriteController
                              .isItemAlreadyAdded(widget.list[index])
                          ? CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.red,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ))
                          : CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/images/fi_HEART.png',
                                height: getPercentScreenHeight(3),
                                width: getPercentScreenWidth(8),
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
    );
  }
}
