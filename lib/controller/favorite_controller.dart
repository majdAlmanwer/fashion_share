import 'package:fashion_share/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart' as data;

import '../model/product_list_model.dart';
import '../utils/app_config.dart';

class FavoriteController extends GetxController {
  List<Data> favoriteList = <Data>[].obs;

  data.GetStorage box = data.GetStorage();

  bool isItemAlreadyAdded(Data itemNew) {
    return favoriteList.where((item) => item.id == itemNew.id).isNotEmpty;
    // update();
  }

  void addItemToCart(Data item) {
    if (isItemAlreadyAdded(item)) {
      print('isItemAlreadyAdded');
      Get.showSnackbar(GetSnackBar(
          onTap: (snack) => Get.toNamed(AppRoutes.favoritescreen),
          titleText: Column(
            children: [
              Image.asset('assets/images/Icon -1.png',
                  fit: BoxFit.contain,
                  scale: 0.1,
                  width: getPercentScreenWidth(10),
                  height: getPercentScreenHeight(10)),
              Text('Item Already Added To Favorites'.tr,
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

      update();
    } else {
      favoriteList.add(item);
      List itemsfavorites = favoriteList.map((Data e) => e.toJson()).toList();

      box.write('items_favorites', itemsfavorites);
      Get.showSnackbar(GetSnackBar(
          onTap: (snack) => Get.toNamed(AppRoutes.favoritescreen),
          titleText: Column(
            children: [
              Image.asset('assets/images/Icon -1.png',
                  fit: BoxFit.contain,
                  scale: 0.1,
                  width: getPercentScreenWidth(10),
                  height: getPercentScreenHeight(10)),
              Text('Added To Favorites'.tr,
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

      print('added');
      update();
    }
    // favoriteList.add(item);

    // List itemsfavorites = favoriteList.map((Data e) => e.toJson()).toList();

    // box.write('items_favorites', itemsfavorites);
    // update();
  }

  // Removing selected item from the list of cart
  void removeSelectedItemFromCart(int index) {
    favoriteList.removeAt(index);

    List<Map<String, dynamic>> itemsfavorites =
        favoriteList.map((Data e) => e.toJson()).toList();

    box.write('items_favorites', itemsfavorites);
    update();
  }

  void updatingSession() {
    box.listenKey('items_favorites', (updatedValue) {
      if (updatedValue is List) {
        List<Data> updatedList =
            updatedValue.map((e) => Data.fromJson(e)).toList();

        // Filter out duplicate items
        List<Data> filteredList =
            updatedList.where((item) => !favoriteList.contains(item)).toList();
        favoriteList.clear();
        favoriteList.addAll(filteredList);
        // favoriteList.clear();
        // favoriteList.addAll(updatedValue.map((e) => Data.fromJson(e)).toList());

        update();
      }
    });
  }

  void getUpdatedSessionFavorites() {
    if (box.hasData('items_favorites')) {
      List<dynamic> value = box.read('items_favorites');
      favoriteList.clear();
      favoriteList.addAll(value.map((e) => Data.fromJson(e)));
      update();
    }
  }

  @override
  void onReady() {
    updatingSession();
    getUpdatedSessionFavorites();

    // calculateGrandTotal();
    super.onReady();
  }
}
