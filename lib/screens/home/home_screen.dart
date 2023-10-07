import 'package:fashion_share/controller/user_controller.dart';
import 'package:fashion_share/screens/home/home_body.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/loader_controller.dart';
import '../../controller/models_controller.dart';
import '../../controller/product_controller.dart';
import '../../widget/custom_alert_dialog.dart';
import '../../widget/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LoaderController loaderController = Get.put(LoaderController());
  ProductController productController = Get.put(ProductController());
  ModelsController modelsController = Get.put(ModelsController());
  UserController userController = Get.put(UserController());
  int branchId = 1;
  int sectionId = 1;

  @override
  void initState() {
    // TODO: implement initState
    modelsController.fetchModelsList();
    productController.fetchProductsList();
    productController.getMenSection();
    productController.getWomenSection();
    productController.getKidsSection();
    productController.getRentSection();
    // modelsController.fetchModelsList();
    userController.getUserInfo();
    // productController.nextPage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          bottomOpacity: 0.0,
          leadingWidth: getPercentScreenWidth(50),
          leading: Get.locale == const Locale('en')
              ? Image.asset(
                  'assets/images/Logo.png',
                  // height: getPercentScreenHeight(20),
                  // width: getPercentScreenWidth(50),
                ).paddingOnly(
                  right: getPercentScreenWidth(2),
                  left: getPercentScreenWidth(2))
              : Image.asset(
                  'assets/images/Logo-ar.png',
                  // height: getPercentScreenHeight(20),
                  // width: getPercentScreenWidth(50),
                ).paddingOnly(
                  right: getPercentScreenWidth(2),
                  left: getPercentScreenWidth(2)),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black,
            ).paddingOnly(
                right: getPercentScreenWidth(2),
                left: getPercentScreenWidth(2)),
          ],
        ),
        body: HomeBody(),
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
      ),
    );
  }
}
