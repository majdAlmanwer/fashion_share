import 'package:fashion_share/controller/image_picker_controller.dart';
import 'package:fashion_share/controller/loader_controller.dart';
import 'package:fashion_share/model/user_model.dart';
import 'package:fashion_share/routes/routes.dart';
import 'package:fashion_share/screens/setting/setting_screen.dart';
import 'package:fashion_share/service/user_service.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';

import '../model/user_info_model.dart';

class UserController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());
  final imagesController = Get.put(ImagePickerController());
  UserInfoModel userInfo = UserInfoModel();
  Future<dynamic> getUserInfo() async {
    var res = await UserService().getUserInfo();

    userInfo = res;
    update();
    print('userInfo  is   is   is   is   ${userInfo.data!.email}');
  }

  Future<void> updateUserInfo(String email, String phone) async {
    var formData = dio.FormData();
    formData.fields.addAll([
      MapEntry('name', email),
      MapEntry('description', phone),
    ]);

    // Add picked image files
    for (XFile pickedImage in imagesController.images) {
      String fileName = pickedImage.name;
      String filePath = pickedImage.path;
      formData.files.add(
        MapEntry(
          'image',
          await dio.MultipartFile.fromFile(
            filePath,
            filename: fileName,
          ),
        ),
      );
    }
    // var res = await UserService().updateUserInfo(data);
    try {
      var res = await UserService().updateUserInfo(formData);

      // print(res);
      Get.off(const SettingScreen());
    } catch (e) {
      print(e.toString());
    }
    // userInfo = res;

    print('userInfo  is   is   is   is   doooooooooooooooooone');
  }

  Future<dynamic> resetPassword(
      String current, String newPass, String confirm) async {
    var data = {
      "current_password": current,
      "new_password": newPass,
      "confirm_password": confirm
    };
    // var res = await UserService().updateUserInfo(data);
    try {
      var res = await UserService().changePassword(data);
      return res.data;
      // print(res.);
    } catch (e) {
      print(e.toString());
    }
    // userInfo = res;

    print('userInfo  is   is   is   is   doooooooooooooooooone');
  }

  Future<dynamic> logOut() async {
    // var res = await UserService().updateUserInfo(data);
    loaderController.loading(true);
    try {
      var res = await UserService().logout();
      Get.offAllNamed(AppRoutes.loginscreen);
      return res.data;
      // print(res.);
    } catch (e) {
      print(e.toString());
    }
    // userInfo = res;

    print('userInfo  is   is   is   is   doooooooooooooooooone');
    loaderController.loading(false);
  }
}
