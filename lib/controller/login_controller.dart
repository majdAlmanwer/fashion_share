import 'dart:async';

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fashion_share/model/auth_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/routes.dart';

import '../service/auth_service.dart';
import 'loader_controller.dart';
import 'messages_handler_controller.dart';

class LoginController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());
  MessagesHandlerController msgController =
      Get.put(MessagesHandlerController());
  // NotificationController noti = Get.put(NotificationController());

  GetStorage box = GetStorage();

  String email = '';
  String password = '';
  String token = '';
  String refreshToken = '';

  Future<dynamic> login(
      {required String email, required String password}) async {
    loaderController.loading(true);
    var data = {'email': email, 'password': password};
    // var response = await AuthService().login(data);

    // return response;
    try {
      var response = await AuthService().login(data);
      token = response.data['access_token'];

      print('sssssssssssss user type is .... .... $token}');

      // box.write('refreshToken', refreshToken);
      box.write('token', token);

      print('sssssssssssss user token is .... .... ${box.read('token')}');

      box.write('loggedIn', true);
      print('sssssssssssss  .... ....${box.read('loggedIn')}');

      // update();
      msgController.showSuccessMessage('operation was successful'.tr);

      Get.toNamed(AppRoutes.onboard);
      // return AuthModel.fromJson(response);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
        msgController.showErrorMessage('error DioException');
      } else {
        print('errorrrrrr is ${e}');

        msgController.showErrorMessage('User Not Found'.tr);
      }
      loaderController.loading(false);
    }
  }

  Future<dynamic> registar(String email, String password, String phone) async {
    loaderController.loading(true);
    var data = {"email": email, "password": password, "phone": phone};
    var response = await AuthService().registar(data);
    loaderController.loading(false);
    return response;
  }
}
