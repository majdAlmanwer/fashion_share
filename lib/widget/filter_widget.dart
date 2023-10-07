import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/controller/models_controller.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:fashion_share/widget/slider_select_range.dart';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_color.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  ModelsController modelsController = Get.put(ModelsController());
  XFile? image;
  ImagePicker picker = ImagePicker();
  int activeIndex = 0;
  String? section;
  // create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
    print('color selected');
    print('colors is ${color}');
  }

  bool conditionVal = false;
  late List<bool> isCheckedcondition;
  late List<bool> isCheckedmaterial;

  @override
  void initState() {
    isCheckedcondition =
        List<bool>.filled(modelsController.modelsList.condition!.length, false);

    isCheckedmaterial =
        List<bool>.filled(modelsController.modelsList.material!.length, false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List<bool> isCheckedList = List.generate(
    //   modelsController.modelsList.condition!.length,
    //   (index) => false,
    // );
    return Expanded(
      child: Container(
        height: getPercentScreenHeight(100),
        width: getPercentScreenWidth(100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getPercentScreenHeight(2),
              ),
              Container(
                height: getPercentScreenHeight(18),
                width: getPercentScreenWidth(100),
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Size'.tr + ' : ',
                      style: const TextStyle(
                          fontFamily: 'AGCRegular',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      height: getPercentScreenHeight(12),
                      padding: EdgeInsets.all(5),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisExtent: getPercentScreenHeight(5),
                          mainAxisSpacing: 5.0,
                        ),
                        itemCount: modelsController.modelsList.size!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: getPercentScreenHeight(8),
                            width: getPercentScreenWidth(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.grey[300]),
                            child: Center(
                              child: AutoSizeText(
                                modelsController.modelsList.size![index].name,
                                style: TextStyle(
                                    fontFamily: 'AGCRegular',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
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
                padding: EdgeInsets.all(2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Color'.tr + ' : ',
                      style: const TextStyle(
                          fontFamily: 'AGCRegular',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      // margin: EdgeInsets.all(5),
                      // color: Colors.amber,
                      height: getPercentScreenHeight(25),
                      width: getPercentScreenWidth(100),
                      child: BlockPicker(
                        layoutBuilder: (context, colors, child) {
                          return GridView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 50,
                              childAspectRatio: 2.0,
                              crossAxisSpacing: 2.0,
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
                                            color: Colors.grey.shade400),
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
                height: getPercentScreenHeight(15),
                width: getPercentScreenWidth(100),
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Price'.tr + ' : ',
                      style: const TextStyle(
                          fontFamily: 'AGCRegular',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SliderSelectRange(
                        onRangeSelected: (range) =>
                            print("${range.start} - ${range.end}"),
                        values: RangeValues(10, 100))
                  ],
                ),
              ),
              Container(
                height: getPercentScreenHeight(18),
                width: getPercentScreenWidth(100),
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Material'.tr + ' : ',
                      style: TextStyle(
                          fontFamily: 'AGCRegular',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      height: getPercentScreenHeight(12),
                      // padding: EdgeInsets.all(5),
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemExtent: getPercentScreenHeight(3),
                        itemCount: modelsController.modelsList.material!.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                value: isCheckedmaterial[index],
                                onChanged: (value) {
                                  setState(() {
                                    isCheckedmaterial[index] = value!;
                                    print(
                                        'value is     ${modelsController.modelsList.material![index].id}');
                                  });
                                },
                                activeColor: Colors.blue,
                              ),
                              Text(modelsController
                                  .modelsList.material![index].name)
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                // color: Colors.amber,
                height: getPercentScreenHeight(18),
                width: getPercentScreenWidth(100),
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Condition'.tr + ' : ',
                      style: const TextStyle(
                          fontFamily: 'AGCRegular',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      height: getPercentScreenHeight(12),
                      // padding: EdgeInsets.all(5),
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemExtent: getPercentScreenHeight(3),
                        itemCount:
                            modelsController.modelsList.condition!.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                value: isCheckedcondition[index],
                                onChanged: (value) {
                                  setState(() {
                                    isCheckedcondition[index] = value!;
                                    print(
                                        'value condition  is     ${modelsController.modelsList.condition![index].id}');
                                  });
                                },
                                activeColor: Colors.blue,
                              ),
                              Text(modelsController
                                  .modelsList.condition![index].name)
                            ],
                          );
                        },
                      ),
                    )
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
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.filter_list,
                              color: Colors.white70,
                              size: getPercentScreenWidth(4),
                            ),
                            SizedBox(
                              width: getPercentScreenWidth(1),
                            ),
                            Text(
                              // textAlign: TextAlign.center,
                              'Filter'.tr,
                              style: TextStyle(
                                color: Colors.white70,
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
    );
  }
}
