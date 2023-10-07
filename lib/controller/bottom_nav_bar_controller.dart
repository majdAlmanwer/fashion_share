import 'package:get/get.dart';

import '../screens/home/categories/catygories_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/setting/components/favorite/favorite_screen.dart';
import '../screens/setting/setting_screen.dart';

class CustomBottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.to(HomeScreen());
        break;
      case 1:
        Get.to(CategoriesScreen());
        break;
      case 2:
        // Get.to(FavoriteScreen());
        break;
      case 3:
        Get.to(FavoriteScreen());
        break;
      case 4:
        Get.to(SettingScreen());
        break;
    }
    update();
  }
}
