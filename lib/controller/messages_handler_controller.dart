import 'package:fashion_share/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_config.dart';

class MessagesHandlerController extends GetxController {
  Future<void> showErrorMessage(String? message) async {
    Get.showSnackbar(GetSnackBar(
        titleText: Text(message?.tr ?? 'error'.tr,
            style: TextStyle(
                fontFamily: 'segoeuiBold', fontSize: 14, color: sblueColor)),
        messageText: Text('error'.tr,
            style: TextStyle(
                fontFamily: 'segoeuiBold', fontSize: 14, color: sblueColor)),
        duration: const Duration(seconds: 3),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        snackPosition: SnackPosition.BOTTOM,
        icon: IconButton(
            onPressed: () {
              Get.closeCurrentSnackbar();
            },
            icon: Icon(Icons.cancel),
            iconSize: 32,
            color: Colors.red),
        backgroundColor: blueColor.withOpacity(0.8)));
  }

  Future<void> showSuccessMessage(String? message) async {
    Get.showSnackbar(GetSnackBar(
        titleText: Column(
          children: [
            Image.asset('assets/images/Icon -1.png',
                fit: BoxFit.contain,
                scale: 0.1,
                width: getPercentScreenWidth(10),
                height: getPercentScreenHeight(10)),
            Text('Success'.tr,
                style: TextStyle(
                    fontFamily: 'segoeuiBold',
                    fontSize: 18,
                    color: Colors.black)),
          ],
        ),
        messageText: Text(
          ''.tr,
        ),
        borderRadius: 50.0,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white));
  }
}
