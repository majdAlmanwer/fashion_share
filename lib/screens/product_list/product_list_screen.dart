import 'package:fashion_share/utils/app_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';

import '../../controller/loader_controller.dart';
import '../../controller/models_controller.dart';
import '../../controller/product_controller.dart';
import 'package:fashion_share/screens/product_list/product_list_body.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  LoaderController loaderController = Get.put(LoaderController());
  ProductController productController = Get.put(ProductController());
  ModelsController modelsController = Get.put(ModelsController());

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: ProductListBody(
            // itemCount: productController.productsList.length,
            // list: productController.productsList,
            // pageiationLinks: productController.pageiationLinks,
            ),
      ),
    );
  }
}
