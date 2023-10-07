import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_share/controller/favorite_controller.dart';
import 'package:fashion_share/controller/loader_controller.dart';
import 'package:fashion_share/model/product_list_model.dart';
import 'package:fashion_share/utils/app_color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controller/product_controller.dart';

import '../../../utils/app_config.dart';
import '../../../widget/titel_row.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final data = Get.arguments;
  // ProductsModel? productModel;
  // List<Images>? imageList;

  ProductController productController = Get.put(ProductController());
  CarouselController controller = CarouselController();
  LoaderController loaderController = Get.put(LoaderController());
  FavoriteController favoriteController = Get.put(FavoriteController());
  int activeIndex = 0;
  final _scrollController = ScrollController();
  double? _scrollPosition = 0;

  @override
  void initState() {
    super.initState();
    _scrollListener() {
      setState(() {
        _scrollPosition = _scrollController.position.pixels;
      });
    }

    _scrollController.addListener(_scrollListener);

    // _scrollController.jumpTo(0);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Images>? imageList = data['product'].images;
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: _scrollPosition == 0
            ? AppBar(
                title: Text(
                  'Details'.tr,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: 'segoeuiBold',
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: sblueColor,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              )
            : AppBar(
                title: Text(
                  'Details'.tr,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'segoeuiBold',
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                // scrolledUnderElevation: 5,
                // elevation: 0,
                backgroundColor: Colors.white,
              ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // _scrollPosition == 0
                  //     ? TitleRow(
                  //         OnTap: () {
                  //           Get.back();
                  //         },
                  //         title: 'Details'.tr)
                  //     : Container(),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        color: Colors.black12,
                        height: getPercentScreenHeight(50),
                        width: getPercentScreenWidth(100),
                        child: data['product'].images!.first.path!.isNotEmpty
                            ? CarouselSlider(
                                // carouselController: controller.,
                                items: imageList!.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Image.network(
                                        // height: getPercentScreenHeight(20),
                                        // width: getPercentScreenWidth(50),

                                        '${i.path}',
                                        fit: BoxFit.cover,
                                        width: getPercentScreenWidth(100),
                                      );
                                    },
                                  );
                                }).toList(),
                                options: CarouselOptions(
                                  autoPlay: false,
                                  viewportFraction: 1,
                                  height: getPercentScreenHeight(50),
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      activeIndex = index;
                                    });
                                  },
                                ),
                              )

                            // ? Image.network(
                            //     "${data['product'].images!.first.path!}",
                            // proList[index].image!,
                            // fit: BoxFit.cover,
                            // )
                            : Image.asset(
                                'assets/images/Group.png',
                                // proList[index].image!,
                                fit: BoxFit.contain,
                              ),
                      ),
                      AnimatedSmoothIndicator(
                          activeIndex: activeIndex,
                          count: imageList!.length,
                          effect: CustomizableEffect(
                            activeDotDecoration: DotDecoration(
                              width: 32,
                              height: 8,
                              color: sblueColor,
                              // rotationAngle: 180,
                              // verticalOffset: -10,
                              borderRadius: BorderRadius.circular(24),
                              // dotBorder: DotBorder(
                              //   padding: 2,
                              //   width: 2,
                              //   color: Colors.indigo,
                              // ),
                            ),
                            dotDecoration: DotDecoration(
                              width: 8,
                              height: 8,
                              color: Colors.white,
                              // dotBorder: DotBorder(
                              //   padding: 2,
                              //   width: 2,
                              //   color: Colors.grey,
                              // ),
                              // borderRadius: BorderRadius.only(
                              //     topLeft: Radius.circular(2),
                              //     topRight: Radius.circular(16),
                              //     bottomLeft: Radius.circular(16),
                              //     bottomRight: Radius.circular(2)),
                              borderRadius: BorderRadius.circular(16),
                              verticalOffset: 0,
                            ),
                          )).paddingOnly(bottom: getPercentScreenHeight(2))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        // color: Colors.amber,
                        height: getPercentScreenHeight(5),
                        // width: getPercentScreenWidth(45),
                        padding: EdgeInsets.all(5),
                        child: AutoSizeText(
                          // s.name!,
                          data['product'].name,
                          // proList[index].name!,
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'segoeuiBold',
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        // color: Colors.amber,
                        height: getPercentScreenHeight(5),
                        // width: getPercentScreenWidth(54),
                        padding: EdgeInsets.all(5),
                        child: AutoSizeText(
                          // s.name!,
                          data['product'].sku,
                          // proList[index].name!,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'segoeuiBold',
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ).paddingOnly(
                      left: getPercentScreenWidth(2),
                      right: getPercentScreenWidth(2)),
                  Container(
                    height: getPercentScreenHeight(5),
                    width: getPercentScreenWidth(92),
                    // padding: EdgeInsets.all(5),
                    child: AutoSizeText(
                      // s.name!,
                      'SP ' + data['product'].price,
                      // proList[index].name!,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'segoeuiBold',
                          color: sblueColor),
                    ),
                  ),
                  Container(
                    height: getPercentScreenHeight(13),
                    width: getPercentScreenWidth(92),
                    // padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Description'.tr + ' : ',
                          style: const TextStyle(
                              fontFamily: 'segoeuiBold',
                              fontSize: 20,
                              color: blackcolor),
                        ),
                        AutoSizeText(
                          data['product'].description,
                          maxFontSize: 16,
                          minFontSize: 15,
                          maxLines: 3,
                          textScaleFactor: 1.1,
                          style: const TextStyle(
                              fontFamily: 'segoeui',
                              // fontSize: 15,
                              color: fontgrey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: getPercentScreenHeight(12),
                    width: getPercentScreenWidth(92),
                    // padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Color & Size'.tr + ' : ',
                          style: const TextStyle(
                              fontFamily: 'segoeuiBold',
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 20,
                            ),
                            // AutoSizeText(

                            SizedBox(
                              width: getPercentScreenWidth(2),
                            ),
                            Container(
                              height: getPercentScreenHeight(5),
                              width: getPercentScreenWidth(25),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.grey[300]),
                              child: Center(
                                child: AutoSizeText(
                                  // int id =int.parse(data['product']['brands'].replaceAll(RegExp(r'[^0-9]'), ''))
                                  // proList[index].model!,
                                  data['product'].size.name,
                                  maxFontSize: 16,
                                  minFontSize: 15,
                                  maxLines: 1,

                                  // 'camry',
                                  // s.model!,
                                  style: const TextStyle(
                                      fontFamily: 'segoeui',
                                      // fontSize: 15,
                                      color: fontgrey),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: getPercentScreenHeight(8),
                    width: getPercentScreenWidth(92),
                    // padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Material'.tr + ' : ',
                          style: const TextStyle(
                              fontFamily: 'segoeuiBold',
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        AutoSizeText(
                          // int id =int.parse(data['product']['brands'].replaceAll(RegExp(r'[^0-9]'), ''))
                          // proList[index].model!,
                          data['product'].material.name,
                          maxFontSize: 16,
                          minFontSize: 15,
                          maxLines: 1,

                          // 'camry',
                          // s.model!,
                          style: const TextStyle(
                              fontFamily: 'segoeui',
                              // fontSize: 15,
                              color: fontgrey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: getPercentScreenHeight(12),
                    width: getPercentScreenWidth(92),
                    // padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Branch'.tr + ' : ',
                          style: const TextStyle(
                              fontFamily: 'segoeuiBold',
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  // int id =int.parse(data['product']['brands'].replaceAll(RegExp(r'[^0-9]'), ''))
                                  // proList[index].model!,
                                  data['product'].branch.address,
                                  maxFontSize: 16,
                                  minFontSize: 15,
                                  maxLines: 1,

                                  // 'camry',
                                  // s.model!,
                                  style: TextStyle(
                                      fontFamily: 'segoeui',
                                      // fontSize: 15,
                                      color: fontgrey),
                                ),
                                AutoSizeText(
                                  // int id =int.parse(data['product']['brands'].replaceAll(RegExp(r'[^0-9]'), ''))
                                  // proList[index].model!,
                                  'Open  :  ' +
                                      '${data['product'].branch.workingHours ?? 'undefined'}',
                                  maxFontSize: 16,
                                  minFontSize: 15,
                                  maxLines: 1,

                                  // 'camry',
                                  // s.model!,
                                  style: TextStyle(
                                      fontFamily: 'segoeui',
                                      // fontSize: 15,
                                      color: fontgrey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: getPercentScreenWidth(5),
                                  child: Image.asset(
                                      'assets/images/WhatsApp FAB.png'),
                                ),
                                SizedBox(
                                  width: getPercentScreenWidth(2),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: getPercentScreenWidth(5),
                                  child: Image.asset(
                                      'assets/images/phone-button.png'),
                                ),
                              ],
                            )
                          ],
                        ),
                        // Container(
                        //   // color: Colors.amber,
                        //   height: getPercentScreenHeight(20),
                        //   width: getPercentScreenWidth(100),
                        //   padding: EdgeInsets.all(5),
                        //   child: Image.asset(
                        //     'assets/images/Map.png',
                        //     fit: BoxFit.cover,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        // boxShadow: const [
                        //   BoxShadow(
                        //     blurStyle: BlurStyle.normal,
                        //     color: sblueColor,
                        //     offset: Offset(2.0, 5.0), //(x,y)
                        //     blurRadius: 10.0,
                        //   ),
                        // ],
                        border: Border.all(color: sblueColor, width: 5.0),
                        color: sblueColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: getPercentScreenWidth(90),
                      height: getPercentScreenHeight(6),
                      // color: SPrimaryColor,
                      child: GetBuilder<FavoriteController>(
                          builder: (controller) => controller
                                  .isItemAlreadyAdded(data['product'])
                              ? TextButton(
                                  onPressed: () {
                                    favoriteController
                                        .removeSelectedItemFromCart(
                                            data['index']);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: getPercentScreenWidth(5),
                                      ),
                                      SizedBox(
                                        width: getPercentScreenWidth(1),
                                      ),
                                      Text(
                                        // textAlign: TextAlign.center,
                                        'Remove From favorites'.tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'segoeui'),
                                      ),
                                    ],
                                  ),
                                )
                              : TextButton(
                                  onPressed: () {
                                    favoriteController
                                        .addItemToCart(data['product']);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                        size: getPercentScreenWidth(5),
                                      ),
                                      SizedBox(
                                        width: getPercentScreenWidth(1),
                                      ),
                                      Text(
                                        // textAlign: TextAlign.center,
                                        'Add to favorites'.tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'segoeui'),
                                      ),
                                    ],
                                  ),
                                ))).paddingOnly(
                      top: getPercentScreenHeight(5),
                      bottom: getPercentScreenHeight(2)),
                ],
              )),
        ),
      ),
    );
  }
}
