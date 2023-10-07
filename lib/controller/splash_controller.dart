import 'package:fashion_share/routes/routes.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/connectivity.dart';
import 'login_controller.dart';

class SplashController extends GetxController {
  bool isloading = true;
  GetStorage box = GetStorage();
  LoginController loginController = Get.put(LoginController());

  void checkAndConnectivity() async {
    bool isConnected = await checkInternetConnection();

    if (isConnected) {
      if (box.read('loggedIn') == true) {
        Get.offAllNamed(AppRoutes.homepage);
      } else if (box.read('loggedIn') == null ||
          box.read('loggedIn') == false) {
        Get.toNamed(AppRoutes.loginscreen);
      }
      // Perform actions when there is an internet connection
      print('Internet connection available');
    } else {
      Get.showSnackbar(GetSnackBar(
          titleText: Text('warning'.tr,
              style: const TextStyle(
                  fontFamily: 'segoeuiBold', fontSize: 14, color: sblueColor)),
          messageText: const Text('No internet connection',
              style: TextStyle(
                  fontFamily: 'segoeuiBold', fontSize: 14, color: sblueColor)),
          duration: const Duration(seconds: 5),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          snackPosition: SnackPosition.BOTTOM,
          icon: IconButton(
              onPressed: () {
                Get.closeCurrentSnackbar();
              },
              icon: const Icon(Icons.check_circle),
              iconSize: 32,
              color: sblueColor),
          backgroundColor: blueColor));
      // Perform actions when there is no internet connection
      if (box.read('loggedIn') == true) {
        Get.offAllNamed(AppRoutes.homepage);
      } else if (box.read('loggedIn') == null ||
          box.read('loggedIn') == false) {
        Get.toNamed(AppRoutes.loginscreen);
      }
      print('No internet connection');
    }
  }
}
