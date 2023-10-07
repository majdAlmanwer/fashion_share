import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/controller/models_controller.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WoltModelSheetWidget extends StatefulWidget {
  const WoltModelSheetWidget({super.key});

  @override
  State<WoltModelSheetWidget> createState() => _WoltModelSheetWidgetState();
}

class _WoltModelSheetWidgetState extends State<WoltModelSheetWidget> {
  ModelsController modelsController = Get.put(ModelsController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getPercentScreenHeight(50),
      width: getPercentScreenWidth(50),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return AutoSizeText(
            modelsController.modelsList.branch!.length.toString(),
            style: TextStyle(
                fontFamily: 'AGCRegular',
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          );
        },
      ),
    );
  }
}
