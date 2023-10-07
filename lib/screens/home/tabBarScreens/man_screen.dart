import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_share/controller/models_controller.dart';
import 'package:fashion_share/controller/product_controller.dart';
import 'package:fashion_share/screens/home/tabBarScreens/widgets/categories_list_view.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:fashion_share/widget/category_tab_bar.dart';
import 'package:fashion_share/widget/last_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/loader_controller.dart';
import '../../../widget/branch_widget.dart';

class MenScreen extends StatefulWidget {
  const MenScreen({super.key});

  @override
  State<MenScreen> createState() => _MenScreenState();
}

class _MenScreenState extends State<MenScreen> {
  ProductController productController = Get.put(ProductController());
  ModelsController modelsController = Get.put(ModelsController());
  LoaderController loaderController = Get.put(LoaderController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getPercentScreenHeight(100),
      width: getPercentScreenWidth(100),
      child: SingleChildScrollView(
        child: Column(children: [
          BranchWidget(),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(children: [
              GetBuilder<ModelsController>(
                builder: (controller) => loaderController.loading.value
                    ? Container(
                        height: getPercentScreenHeight(30),
                        width: getPercentScreenWidth(90),
                        color: Colors.grey[300],
                        child: Center(
                          child: Image.asset(
                            'assets/images/splash.png',
                            height: getPercentScreenHeight(8),
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 1,
                              height: getPercentScreenHeight(25),
                            ),
                            items: modelsController.modelsList.banner!.map((i) {
                              return Stack(
                                children: [
                                  Image.network(
                                    // color: Colors.grey,
                                    '${i.image}',
                                    fit: BoxFit.fill,
                                    width: getPercentScreenWidth(100),
                                  ),
                                  Center(
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      i.name,
                                      style: const TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    i.description,
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.black),
                                    textAlign: TextAlign.start,
                                  )
                                ],
                              );
                            }).toList()

                            // : List.empty(),
                            ),
                      ),
              )
            ]),
          ),
          GetBuilder<ModelsController>(
              init: ModelsController(),
              // filter: (value) => value.fetchModelsList(),
              builder: (controller) => CategoryTabBar()),
          // GetBuilder<ProductController>(
          //     builder: (controller) => LastProdutCard(
          //           itemCount: productController.menSectionList.length,
          //           list: productController.menSectionList,
          //           pageiationLinks: productController.pageiationLinksMen,
          //         )),
          CategoriesListView(
            itemCount: productController.menSectionList.length,
            list: productController.menSectionList,
          ),
        ]),
      ),
    );
  }
}
