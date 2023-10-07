import 'package:fashion_share/controller/loader_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';
import '../model/product_list_model.dart';
import '../routes/routes.dart';
import '../service/product_service.dart';
import '../utils/app_config.dart';
import 'image_picker_controller.dart';

class ProductController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());
  final imagesController = Get.put(ImagePickerController());

  var productsList = <Data>[].obs;
  List<Data> womenSectionList = [];
  List<Data> menSectionList = [];
  List<Data> kidsSectionList = [];
  List<Data> rentSectionList = [];
  Meta pageiationLinks = Meta();
  Meta pageiationLinksWomen = Meta();
  Meta pageiationLinksMen = Meta();
  Meta pageiationLinksKids = Meta();
  Meta pageiationLinksRent = Meta();

  List<Data> productsListPageAll = [];
  // List<Data> productsListPageWomen = [];
  List<Data> productsListPageMen = [];
  RxInt sec = 1.obs;
  RxInt branchId = 1.obs;
  RxInt categoryId = 1.obs;

  Future<void> fetchProductsList() async {
    loaderController.loading(true);

    var data = {
      "section": sec.toInt(),
      "branch": branchId.toInt(),
      "category": categoryId.toInt(),
    };
    var getItems = await ProductService().getAllProducts(data);
    productsList = getItems.data!.obs;
    pageiationLinks = getItems.meta!;
    print(
        '***********pageiationLinks.currentPage is************${pageiationLinks.currentPage} ');

    update();

    print('11111111111111111111111111111 is ${productsList.length}');

    loaderController.loading(false);
    update();
  }

  Future<void> getWomenSection({dynamic data}) async {
    loaderController.loading(true);

    var data = {'section': 1};
    var getItems = await ProductService().getAllProducts(data);
    womenSectionList = getItems.data!;
    pageiationLinksWomen = getItems.meta!;
    print('***********product ist is************${getItems.data} ');

    update();

    print('11111111111111111111111111111 is ${womenSectionList.length}');

    loaderController.loading(false);
  }

  Future<void> getMenSection({dynamic data}) async {
    loaderController.loading(true);

    var data = {'section': 2};
    var getItems = await ProductService().getAllProducts(data);
    menSectionList = getItems.data!;
    pageiationLinksMen = getItems.meta!;
    print('***********product ist is************${getItems.data} ');

    update();

    print('11111111111111111111111111111 is ${menSectionList.length}');

    loaderController.loading(false);
  }

  Future<void> getKidsSection({dynamic data}) async {
    loaderController.loading(true);

    var data = {'section': 3};
    var getItems = await ProductService().getAllProducts(data);
    kidsSectionList = getItems.data!;
    pageiationLinksKids = getItems.meta!;
    print('***********product ist is************${getItems.data} ');

    update();

    print('11111111111111111111111111111 is ${menSectionList.length}');

    loaderController.loading(false);
  }

  Future<void> getRentSection({dynamic data}) async {
    loaderController.loading(true);

    var data = {"section": 4, "sale": 0};
    var getItems = await ProductService().getAllProducts(data);
    rentSectionList = getItems.data!;
    pageiationLinksRent = getItems.meta!;
    print('***********product ist is************${getItems.data} ');

    update();

    print('11111111111111111111111111111 is ${menSectionList.length}');

    loaderController.loading(false);
  }

  Future<void> nextPage(int currentPage) async {
    loaderController.loading(true);

    var getItems = await ProductService().getNextPage(currentPage);
    productsListPageAll = getItems.data!;
    print('***********links ist is************${getItems.data} ');

    update();

    loaderController.loading(false);
  }

  Future<void> sellProduct(
    String name,
    String description,
    int price,
    int categoryId,
    int colorId,
    int materiaId,
    int sectionId,
    int sizeId,
    int conditionId,
    int branchId,
    int is_for_sale,
  ) async {
    var formData = dio.FormData();

    // Add form fields
    formData.fields.addAll([
      MapEntry('name', name),
      MapEntry('description', description),
      MapEntry('price', '$price'),
      MapEntry('category_id', '$categoryId'),
      MapEntry('color_id', '$colorId'),
      MapEntry('material_id', '$materiaId'),
      MapEntry('section_id', '$sectionId'),
      MapEntry('size_id', '$sizeId'),
      MapEntry('condition_id', '$conditionId'),
      MapEntry('branch_id', '$branchId'),
      MapEntry('is_for_sale', '$is_for_sale'),
    ]);

    // Add picked image files
    for (XFile pickedImage in imagesController.images) {
      String fileName = pickedImage.name;
      String filePath = pickedImage.path;
      formData.files.add(
        MapEntry(
          'images[]',
          await dio.MultipartFile.fromFile(
            filePath,
            filename: fileName,
          ),
        ),
      );
    }

    print('Formdata  ${formData.files}');
    try {
      var response = await ProductService().addProduct(data: formData);
      print(response);

      Get.offAndToNamed(AppRoutes.homepage);
      Get.showSnackbar(GetSnackBar(
          titleText: Column(
            children: [
              Image.asset('assets/images/Icon -1.png',
                  fit: BoxFit.contain,
                  scale: 0.1,
                  width: getPercentScreenWidth(10),
                  height: getPercentScreenHeight(10)),
              Text('Request Was Submitted'.tr,
                  style: const TextStyle(
                      fontFamily: 'segoeuiBold',
                      fontSize: 18,
                      color: Colors.black)),
            ],
          ),
          messageText: Center(
            child: Text(
              'Request Was Submitted Successfully, Our Team Will Reach Out To You In 24 Hours'
                  .tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'segoeui', fontSize: 16, color: Colors.black),
            ),
          ),
          borderRadius: 50.0,
          duration: const Duration(seconds: 3),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white));
    } catch (error) {
      print('Failed to upload data. Error: $error');
    }
  }
}
