import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/image_picker_controller.dart';
import '../../../controller/loader_controller.dart';
import '../../../controller/models_controller.dart';
import '../../../controller/product_controller.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_config.dart';
import '../../../widget/loading_widget.dart';
import '../../../widget/titel_row.dart';
import 'drop_down_list.dart';
import 'image_select.dart';

class RentProductScreen extends StatefulWidget {
  const RentProductScreen({
    super.key,
  });

  @override
  State<RentProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<RentProductScreen> {
  // final data = Get.arguments;

  ProductController productController = Get.put(ProductController());
  // CarouselController controller = CarouselController();
  LoaderController loaderController = Get.put(LoaderController());
  ModelsController modelsController = Get.put(ModelsController());
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  XFile? image;
  List<XFile> images = [];
  ImagePicker picker = ImagePicker();
  int activeIndex = 0;
  String? section;
  // create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  final pageIndexNotifier = ValueNotifier(0);
  final priceController = TextEditingController();
  var select;
  RxInt sectionId = 0.obs;
  RxInt categoryId = 0.obs;
  RxInt branchId = 0.obs;
  RxInt materialId = 0.obs;
  RxInt conditionId = 0.obs;
  int sizeId = 0;

  // bool sizeSelect = false;
  int selectedSizeIndex = -1;
// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
    print('color selected');
    print('colors is ${color.value}');
  }

  @override
  Widget build(BuildContext context) {
    // List<Images>? imageList = data['product'].images;

    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TitleRow(
                widget: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                title: 'Rent Your Product'),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                height: getPercentScreenHeight(100),
                width: getPercentScreenWidth(100),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: getPercentScreenHeight(2),
                      // ),
                      Container(
                        height: getPercentScreenHeight(25),
                        width: getPercentScreenWidth(100),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  'Images'.tr + ' : ',
                                  style: const TextStyle(
                                      fontFamily: 'segoeuiBold',
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                AutoSizeText(
                                  ' At least 4 images'.tr,
                                  maxFontSize: 12,
                                  minFontSize: 10,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontFamily: 'segoeui',
                                      // fontSize: 12,

                                      color: Colors.black54),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getPercentScreenHeight(1),
                            ),
                            InkWell(
                              onTap: () async {
                                Get.bottomSheet(
                                    backgroundColor: Colors.white,
                                    isDismissible: true,
                                    shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.white70, width: 1),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(24),
                                          topRight: Radius.circular(24)),
                                    ),
                                    ImageSelectDialog());

                                // showDialog(
                                //   barrierDismissible: true,
                                //   context: context,
                                //   builder: (BuildContext context) {
                                //     return ImageSelectDialog();
                                //   },
                                // );

                                // image = await picker.pickImage(
                                //     source: ImageSource.camera);
                                // // images = await picker.pickMultiImage();
                                // setState(() {
                                //   image = image;
                                //   images.add(image!);
                                // });
                                // print(images.length);
                                // image = await picker.pickImage(
                                //     source: ImageSource.gallery);
                                // setState(() {
                                //   image = image;
                                // });
                                // imagePickerController.pickImage();
                              },
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                    ),
                                    height: getPercentScreenHeight(18),
                                    width: getPercentScreenWidth(30),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/icon-button.png',
                                          // proList[index].image!,
                                          height: getPercentScreenHeight(8),
                                          fit: BoxFit.contain,
                                        ),
                                        AutoSizeText(
                                          'Add Images Here'.tr,
                                          maxFontSize: 18,
                                          minFontSize: 16,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'segoeuiBold',
                                              // fontSize: 12,

                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: getPercentScreenHeight(18),
                                    width: getPercentScreenWidth(60),
                                    child: GetBuilder<ImagePickerController>(
                                      builder: (controller) => ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller.images.length,
                                          itemBuilder: (context, index) =>
                                              controller.images.isEmpty
                                                  ? Container(
                                                      height:
                                                          getPercentScreenHeight(
                                                              18),
                                                      width:
                                                          getPercentScreenWidth(
                                                              25),
                                                      // color: Colors.amber,
                                                    )
                                                  : Container(
                                                      decoration: BoxDecoration(
                                                        // border: Border,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color: Colors.white,
                                                      ),
                                                      child: Image.file(
                                                          height:
                                                              getPercentScreenHeight(
                                                                  18),
                                                          width:
                                                              getPercentScreenWidth(
                                                                  30),
                                                          File(controller
                                                              .images[index]
                                                              .path)),
                                                    )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.amber,
                        height: getPercentScreenHeight(15),
                        width: getPercentScreenWidth(100),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Section'.tr + ' : ',
                              style: TextStyle(
                                  fontFamily: 'segoeuiBold',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            DropDownList(
                              list: modelsController.modelsList.section!,
                              name: 'section',
                              selectedId: sectionId,
                              // selectedId: sectionId,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: getPercentScreenHeight(18),
                        width: getPercentScreenWidth(100),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Category'.tr + ' : ',
                              style: TextStyle(
                                  fontFamily: 'segoeuiBold',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            DropDownList(
                              list: modelsController.modelsList.category!,
                              name: 'category',
                              selectedId: categoryId,
                            )
                            // CustomDropDownFiled(
                            //   list: modelsController.modelsList.category!,
                            //   title: 'category',
                            //   dropDownValue: section,
                            // )
                          ],
                        ),
                      ),
                      Container(
                        height: getPercentScreenHeight(15),
                        width: getPercentScreenWidth(100),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  'Branch'.tr + ' : ',
                                  style: TextStyle(
                                      fontFamily: 'segoeuiBold',
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    'Select the branch you want to display your product in'
                                        .tr,
                                    maxFontSize: 12,
                                    minFontSize: 10,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: 'segoeui',
                                        // fontSize: 12,

                                        color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                            DropDownList(
                              list: modelsController.modelsList.branch!,
                              name: 'branch',
                              selectedId: branchId,
                            )
                            // CustomDropDownFiled(
                            //   list: modelsController.modelsList.branch!,
                            //   title: 'branch',
                            //   dropDownValue: section,
                            // )
                          ],
                        ),
                      ),

                      Container(
                        height: getPercentScreenHeight(19),
                        width: getPercentScreenWidth(100),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Size'.tr + ' : ',
                              style: TextStyle(
                                  fontFamily: 'segoeuiBold',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            Container(
                              height: getPercentScreenHeight(13),
                              padding: EdgeInsets.all(8),
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 8.0,
                                  mainAxisExtent: getPercentScreenHeight(5),
                                  mainAxisSpacing: 5.0,
                                ),
                                itemCount:
                                    modelsController.modelsList.size!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedSizeIndex = index;
                                        sizeId = modelsController
                                            .modelsList.size![index].id;
                                      });
                                      print(sizeId = modelsController
                                          .modelsList.size![index].id);
                                    },
                                    child: Container(
                                      height: getPercentScreenHeight(8),
                                      width: getPercentScreenWidth(15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: selectedSizeIndex == index
                                              ? sblueColor
                                              : Colors.grey[300]),
                                      child: Center(
                                        child: AutoSizeText(
                                          modelsController
                                              .modelsList.size![index].name,
                                          style: TextStyle(
                                              fontFamily: 'segoeui',
                                              fontSize: 14,
                                              color: selectedSizeIndex == index
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: getPercentScreenHeight(30),
                        width: getPercentScreenWidth(100),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Color'.tr + ' : ',
                              style: TextStyle(
                                  fontFamily: 'segoeuiBold',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              // margin: EdgeInsets.all(5),
                              // color: Colors.amber,
                              height: getPercentScreenHeight(24),
                              width: getPercentScreenWidth(100),
                              child: BlockPicker(
                                layoutBuilder: (context, colors, child) {
                                  return GridView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 60,
                                      childAspectRatio: 2.0,
                                      crossAxisSpacing: 2,
                                      mainAxisExtent: 50,
                                      mainAxisSpacing: 5,
                                    ),
                                    children: [
                                      for (Color color in colors)
                                        Container(
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                                color: color,
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade400),
                                                shape: BoxShape.circle),
                                            child: child(color))
                                    ],
                                  );
                                },
                                useInShowDialog: false,
                                availableColors: [
                                  Colors.red,
                                  Colors.orange,
                                  Colors.brown,
                                  Colors.green,
                                  Colors.green.shade900,
                                  Colors.blue,
                                  Colors.blue.shade900,
                                  Colors.purple,
                                  Colors.pink,
                                  Colors.pinkAccent,
                                  Colors.white,
                                  Colors.grey,
                                  Colors.grey.shade800,
                                  Colors.black,
                                ],
                                pickerColor: pickerColor,
                                onColorChanged: changeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: getPercentScreenHeight(16),
                        width: getPercentScreenWidth(100),
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Price'.tr + ' : ',
                              style: TextStyle(
                                  fontFamily: 'segoeuiBold',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: TextFormField(
                                controller: priceController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          const BorderSide(color: Colors.grey)),
                                  hintText: '10.000',
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: 'segoeui',
                                  ),
                                  suffixText: 'SP',

                                  // suffixIcon: Text(
                                  //   'SP',
                                  //   style: TextStyle(
                                  //     color: Colors.grey,
                                  //     fontSize: 14,
                                  //     fontFamily: 'ArLang',
                                  //   ),
                                  // ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: getPercentScreenHeight(15),
                        width: getPercentScreenWidth(100),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Material'.tr + ' : ',
                              style: TextStyle(
                                  fontFamily: 'segoeuiBold',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            DropDownList(
                              list: modelsController.modelsList.material!,
                              name: 'material',
                              selectedId: materialId,
                            )
                            // CustomDropDownFiled(
                            //   list: modelsController.modelsList.material!,
                            //   title: 'material',
                            //   dropDownValue: section,
                            // )
                          ],
                        ),
                      ),
                      Container(
                        height: getPercentScreenHeight(15),
                        width: getPercentScreenWidth(100),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Condition'.tr + ' : ',
                              style: TextStyle(
                                  fontFamily: 'segoeuiBold',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            DropDownList(
                              list: modelsController.modelsList.condition!,
                              name: 'condition',
                              selectedId: conditionId,
                            )
                            // CustomDropDownFiled(
                            //   list: modelsController.modelsList.condition!,
                            //   title: 'condition',
                            //   dropDownValue: section,
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
                                border:
                                    Border.all(color: sblueColor, width: 5.0),
                                color: sblueColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: getPercentScreenWidth(90),
                              height: getPercentScreenHeight(6),
                              // color: SPrimaryColor,
                              child: TextButton(
                                onPressed: () {
                                  var id = ([
                                    int.parse(priceController.text),
                                    categoryId.value,
                                    pickerColor.value,
                                    materialId.value,
                                    sectionId.value,
                                    sizeId,
                                    conditionId.value,
                                    branchId.value,
                                  ]);
                                  print('Current selected value:$id');

                                  Get.showOverlay(
                                      asyncFunction: () async =>
                                          await productController.sellProduct(
                                            'majdTest',
                                            "123",
                                            int.parse(priceController.text),
                                            categoryId.value,
                                            1,
                                            materialId.value,
                                            sectionId.value,
                                            sizeId,
                                            conditionId.value,
                                            branchId.value,
                                            0,
                                          ),
                                      loadingWidget: LoaderWidget(),
                                      opacityColor: blueColor.withOpacity(0.2));

                                  // productController.sellProduct(
                                  //   'majdTest',
                                  //   "123",
                                  //   int.parse(priceController.text),
                                  //   categoryId.value,
                                  //   1,
                                  //   materialId.value,
                                  //   sectionId.value,
                                  //   sizeId,
                                  //   conditionId.value,
                                  //   branchId.value,
                                  //   1,
                                  // );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon(
                                    //   Icons.sell,
                                    //   color: Colors.white70,
                                    //   size: getPercentScreenWidth(4),
                                    // ),
                                    // SizedBox(
                                    //   width: getPercentScreenWidth(1),
                                    // ),
                                    Text(
                                      // textAlign: TextAlign.center,
                                      'Submit'.tr,
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontFamily: 'segoeuiBold',
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .paddingOnly(
                              top: getPercentScreenHeight(5),
                              bottom: getPercentScreenHeight(2)),
                    ],
                  ).paddingOnly(
                      // bottom: getPercentScreenHeight(7),
                      top: getPercentScreenHeight(1)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
