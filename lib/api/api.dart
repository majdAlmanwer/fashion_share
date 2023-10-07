import 'package:dio/dio.dart';
import 'package:fashion_share/api/app_config.dart';
import 'package:fashion_share/controller/loader_controller.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/messages_handler_controller.dart';

class Api {
  final dio = createDio;
  final tokenDio = createTokenDio;

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio get createDio {
    var dio = Dio(BaseOptions(
      baseUrl: appConfig,
      receiveTimeout: const Duration(seconds: 25), // 25 seconds
      connectTimeout: const Duration(seconds: 25),
      sendTimeout: const Duration(seconds: 25),
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }

  static Dio get createTokenDio {
    var tokenDio = Dio(BaseOptions(
      baseUrl: appConfig,
      receiveTimeout: const Duration(seconds: 25), // 25 seconds
      connectTimeout: const Duration(seconds: 25),
      sendTimeout: const Duration(seconds: 25),
    ));

    return tokenDio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio? dio;

  GetStorage box = GetStorage();
  LoaderController loaderController = Get.put(LoaderController());
  // final MessagesHandlerController msgHandlerController =
  //     Get.put(MessagesHandlerController());
  // final AuthController authController = Get.put(AuthController());
  // final UserInfoController userInfoController = Get.put(UserInfoController());
  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final token = box.read('token');
    // print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa token is ${token}');
    // options.method != 'POST' ? loaderController.loading(true) : null;
    options.headers = {
      "Content-Type": "application/json",
      "accept": "*/*",
    };
    // options.headers['Authorization'] = 'bearer $token';
    // options.headers = {
    //   'Authorization': 'bearer $token',
    // };
    // if (token == null || token.isEmpty) {
    //   options.headers = {
    //     "Content-Type": "application/json",
    //     "accept": "*/*",
    //     "Authorization": "bearer "
    //   };
    //   print('not auth');
    // } else if (token.isNotEmpty || token != null) {
    //   options.headers = {
    //     "accept": "*/*",
    //     "Authorization": "bearer $token",
    //     // "Content-Type": "application/json",
    //   };
    // }

    return handler.next(options);
  }

  @override
  void onResponse(
    response,
    ResponseInterceptorHandler handler,
  ) {
    print(
      'RESPONSE[${response.statusCode}] => Data: ${response.data}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // LoaderController loaderController = Get.put(LoaderController());
    MessagesHandlerController msgController =
        Get.put(MessagesHandlerController());
    // LoginController loginController = Get.put(LoginController());
    // loaderController.loading(true);
    print(
      'ERROR[${err.response!.statusCode}] => PATH: ${err.response!.data}',
    );

    if (err.response!.statusCode == 401) {
      // loginController.getRefreshToken();
    } else if (err.response!.statusCode == 403) {
      // loginController.getRefreshToken();
    } else if (err.response!.statusCode == 500) {
      msgController.showErrorMessage('Server error'.tr);
    }

    handler.next(err);
    // loaderController.loading(false);
    return null;
  }
}
