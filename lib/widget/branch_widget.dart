import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/controller/loader_controller.dart';
import 'package:fashion_share/controller/models_controller.dart';
import 'package:fashion_share/controller/product_controller.dart';
import 'package:fashion_share/model/models_model.dart';
import 'package:fashion_share/screens/branch/branch_screen.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading_widget.dart';

class BranchWidget extends StatefulWidget {
  const BranchWidget({super.key});

  @override
  State<BranchWidget> createState() => _BranchWidgetState();
}

class _BranchWidgetState extends State<BranchWidget> {
  LoaderController loaderController = Get.put(LoaderController());
  ProductController productController = Get.put(ProductController());
  final modelsController = Get.put(ModelsController());
  RxString? hintName = ''.obs;
  final branchList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.only(top: 8, right: 10, left: 10),
      height: getPercentScreenHeight(9),
      width: getPercentScreenWidth(90),
      decoration: BoxDecoration(
        border: Border.all(color: blueColor, width: 1.0),
        color: blueColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                '${'Branch'.tr} : ',
                style: const TextStyle(
                    fontSize: 14, fontFamily: 'segoeui', color: Colors.black45),
              ),
              GetBuilder<ModelsController>(
                  builder: (controller) => controller.modelsList.branch == null
                      ? AutoSizeText(
                          '${'Loading'.tr}....',
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'segoeui',
                              color: Colors.black45),
                        )
                      : Container(
                          // color: Colors.amber,
                          height: getPercentScreenHeight(5),
                          width: getPercentScreenWidth(35),
                          // padding: EdgeInsets.all(5),
                          // margin: EdgeInsets.all(5),
                          child: InkWell(
                            onTap: () {
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Branch' + ' : ',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'segoeuiBold',
                                      ),
                                    ).paddingAll(10),
                                    Container(
                                      height: getPercentScreenHeight(40),
                                      child: ListView.builder(
                                        itemCount: controller
                                            .modelsList.branch!.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    // splashRadius: 25,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100)),
                                                    value: false,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        hintName!.value =
                                                            controller
                                                                .modelsList
                                                                .branch![index]
                                                                .name;
                                                        // print(
                                                        //     'value condition  is     ${widget.list[index].id}');
                                                      });
                                                      Get.back();
                                                    },
                                                    activeColor: Colors.blue,
                                                  ),
                                                  Text(
                                                    controller.modelsList
                                                        .branch![index].name,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily: 'segoeui',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                color: Colors.black45,
                                              )
                                            ],
                                          );
                                          //     ListTile(
                                          //       title: Text(widget.list[index].name),
                                          //       onTap: () {
                                          //         // Handle item tap
                                          //         setState(() {
                                          //           widget.select = widget.list[index].name;
                                          //         });
                                          //         Get.back();
                                          //       },
                                          //     );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              height: getPercentScreenHeight(7),
                              width: getPercentScreenWidth(100),
                              // decoration: BoxDecoration(
                              //   borderRadius: const BorderRadius.all(
                              //     Radius.circular(30.0),
                              //   ),
                              //   border:
                              //       Border.all(color: sblueColor, width: 1.0),
                              // ),
                              child: hintName!.value == ''
                                  ? Row(
                                      children: [
                                        Text(
                                          controller
                                              .modelsList.branch!.first.name,
                                          style: const TextStyle(
                                            color: sblueColor,
                                            fontSize: 15,
                                            fontFamily: 'segoeuiBold',
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: sblueColor,
                                        ),
                                      ],
                                    )
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          hintName!.value,
                                          style: const TextStyle(
                                            color: sblueColor,
                                            fontSize: 15,
                                            fontFamily: 'segoeuiBold',
                                          ),
                                        ),
                                        SizedBox(
                                          width: getPercentScreenWidth(2),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: sblueColor,
                                        ),
                                      ],
                                    ),
                            ),

                            //    DropdownButtonFormField<dynamic>(
                            //     // itemHeight: getPercentScreenHeight(8),

                            //     alignment: Alignment.centerLeft,
                            //     isExpanded: true,
                            //     iconDisabledColor: sblueColor,
                            //     iconEnabledColor: sblueColor,
                            //     icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            //     hint: AutoSizeText(
                            //       '${controller.modelsList.branch!.first.name}'.tr,
                            //       maxFontSize: 20,
                            //       minFontSize: 18,
                            //       maxLines: 1,
                            //       style: const TextStyle(
                            //         color: sblueColor,
                            //         fontFamily: 'segoeuiBold',
                            //       ),
                            //     ),
                            //     decoration:
                            //         const InputDecoration.collapsed(hintText: ''),

                            //     onSaved: (newva) {
                            //       hintName!.value = newva.toString();
                            //     },
                            //     onChanged: (val) {
                            //       setState(() {
                            //         productController.branchId.value = val;

                            //         print('dropdown value ======= ${val}');
                            //       });
                            //       // productController.productsList.refresh();
                            //       Get.showOverlay(
                            //           asyncFunction: () async =>
                            //               await productController
                            //                   .fetchProductsList(),
                            //           loadingWidget: LoaderWidget(),
                            //           opacityColor: blueColor.withOpacity(0.2));
                            //     },
                            //     dropdownColor: blueColor,
                            //     menuMaxHeight: getPercentScreenWidth(70),
                            //     items: controller.modelsList.branch!
                            //         .map<DropdownMenuItem<dynamic>>((value) {
                            //       // print('oooooooooo${value.name}');
                            //       return DropdownMenuItem<dynamic>(
                            //         alignment: Alignment.center,
                            //         value: value.id,
                            //         child: Container(
                            //           width: getPercentScreenWidth(70),
                            //           height: getPercentScreenHeight(5),
                            //           child: Text(
                            //             value.name,
                            //             textAlign: TextAlign.start,
                            //             style: const TextStyle(
                            //                 color: sblueColor,
                            //                 fontSize: 18,
                            //                 fontWeight: FontWeight.w600),
                            //           ),
                            //         ),
                            //       );
                            //     }).toList(),
                            //   ),
                            // )
                            // const AutoSizeText(
                            //     'Damascus/Bab Toma',
                            //     style: TextStyle(
                            //         color: Colors.blue,
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.bold),
                            //   ),
                          )))
            ],
          ),
          InkWell(
            onTap: () {
              Get.to(
                BranchScreen(),
              );
            },
            child: Image.asset(
              'assets/images/location.png',
              height: getPercentScreenHeight(8),
              width: getPercentScreenWidth(10),
            ),
          ),
        ],
      ),
    );
  }
}
