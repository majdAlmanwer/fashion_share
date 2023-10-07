import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/api/api.dart';
import 'package:fashion_share/controller/favorite_controller.dart';
import 'package:fashion_share/controller/loader_controller.dart';
import 'package:fashion_share/controller/product_controller.dart';
import 'package:fashion_share/model/product_list_model.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:fashion_share/widget/custom_filter_bar.dart';
import 'package:fashion_share/widget/titel_row.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/app_config.dart';

class ProductListBody extends StatefulWidget {
  ProductListBody({
    super.key,
  });
  // int itemCount;
  // var list;
  // Meta? pageiationLinks;

  @override
  State<ProductListBody> createState() => _ProductListBodyState();
}

class _ProductListBodyState extends State<ProductListBody> {
  LoaderController loaderController = Get.put(LoaderController());
  ProductController productController = Get.put(ProductController());
  FavoriteController favoriteController = Get.put(FavoriteController());
  ScrollController _scrollController = ScrollController();
  var data = Get.arguments;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    // int currentPage = productController.pageiationLinks.currentPage!;
    // fetchNextPage();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchNextPage();
      }
    });
    // productController.fetchProductsList();
    super.initState();
  }

  Future<void> fetchNextPage() async {
    int currentPage = data['pageiationLinks'].currentPage!;
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      // await productController.nextPage(currentPage);
      final response = await Api().dio.get('/products?page=$currentPage++');
      if (response.statusCode == 200) {
        ProductListModel newData = ProductListModel.fromJson(response.data);
        List<Data> pagetisonData = newData.data!;
        data['list'].addAll(pagetisonData);
        currentPage++;
      } else {
        // Handle the error case
        print('API request failed with status code ${response.statusCode}');
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleRow(
          title: 'Products'.tr,
          widget: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                Get.back();
              }),
        ),
        CustomFilterBar(),
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: getPercentScreenWidth(2),
                    right: getPercentScreenWidth(2)),
                // color: Colors.amber,
                height: getPercentScreenHeight(90),
                width: getPercentScreenWidth(100),

                child: data['list'].isEmpty
                    ? Center(
                        child: Container(
                          child: const Center(
                            child: Text('No Product',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: blackcolor,
                                  fontFamily: 'segoeui',
                                )),
                          ),
                        ),
                      )
                    : GridView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1.0,
                          mainAxisExtent: getPercentScreenHeight(37),
                          mainAxisSpacing: 1.0,
                        ),
                        itemCount: data['list'].length + 1,
                        itemBuilder: (ctx, int index) {
                          if (index == data['list'].length) {
                            return Center(
                              child: isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                      color: sblueColor,
                                    ))
                                  : Center(
                                      child: Container(
                                        child: Center(child: Text('')),
                                      ),
                                    ),
                            );
                          }
                          return InkWell(
                            onTap: () {
                              // Get.toNamed(AppRoutes.productdetails, arguments: {
                              //   'product': controller.productsList[index]
                              // });

                              // print('pppppppppppp${index}');
                            },
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.productdetails,
                                    arguments: {
                                      'product': data['list'][index]
                                    });
                              },
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: getPercentScreenHeight(25),
                                        width: getPercentScreenWidth(50),
                                        // alignment: Alignment.center,
                                        child: data['list'][index]
                                                .images!
                                                .first
                                                .path!
                                                .isNotEmpty
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  "${data['list'][index].images!.first.path}",
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
                                      Container(
                                        // alignment: Alignment.center,
                                        child: AutoSizeText(
                                            '${data['list'][index].name}',
                                            // maxLines: 2,
                                            // maxFontSize: 10,
                                            // minFontSize: 10,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontFamily: 'segoeui',
                                            )),
                                      ).paddingAll(getPercentScreenWidth(1)),
                                      Container(
                                        // alignment: Alignment.center,
                                        child: AutoSizeText(
                                            'SP ' +
                                                '${data['list'][index].price} ',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: sblueColor,
                                                fontFamily: 'segoeuiBold')),
                                      ).paddingAll(getPercentScreenWidth(1))
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      favoriteController
                                          .addItemToCart(data['list'][index]);
                                    },
                                    child: GetBuilder<FavoriteController>(
                                      builder: (controller) =>
                                          favoriteController.isItemAlreadyAdded(
                                                  data['list'][index])
                                              ? const CircleAvatar(
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
                          );
                        },
                      ),
              ),
            ],
          )),
        ),
      ],
    );
  }
}
