import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../api/api.dart';
import '../controller/loader_controller.dart';
import '../controller/messages_handler_controller.dart';

class AuthService {
  static AuthService? _instance;

  var dio = Dio();
  factory AuthService() => _instance ??= AuthService._();

  AuthService._();

  final LoaderController loaderController = Get.find<LoaderController>();
  MessagesHandlerController msgController =
      Get.put(MessagesHandlerController());
  GetStorage box = GetStorage();

  Future<dynamic> login([dynamic data]) async {
    loaderController.loading(true);
    // var res = await Api().dio.post('/login', data: data);

    // return res;
    try {
      var res = await Api().dio.post('/login', data: data);
      var loginResponse = res;
      print('$res');
      if (loginResponse.statusCode == 200) {
        print('ooooooooooooo${loginResponse.data}');
        return loginResponse;
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 422) {
          msgController.showErrorMessage('error');
          print('***********************${e.response}');
          return null;
        }
        // msgController.showErrorMessage('error');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
  }

  Future<dynamic> registar([dynamic data]) async {
    var res = await Api().dio.post('/register', data: data);
    print(res);
  }
}
