import 'package:dio/dio.dart';
import 'package:fashion_share/model/user_model.dart';
import 'package:get_storage/get_storage.dart';

import '../api/api.dart';
import '../model/user_info_model.dart';

class UserService {
  static UserService? _instance;

  var dio = Dio();
  factory UserService() => _instance ??= UserService._();

  UserService._();
  Future<UserInfoModel> getUserInfo() async {
    GetStorage box = GetStorage();
    var token = box.read('token');
    var response = await Api().tokenDio.get('/user/info',
        options: Options(headers: {
          "accept": "*/*",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));

    print(UserInfoModel.fromJson(response.data));
    return UserInfoModel.fromJson(response.data);
  }

  Future<void> updateUserInfo([dynamic data]) async {
    GetStorage box = GetStorage();
    var token = box.read('token');
    var response = await Api().tokenDio.post('/user/info',
        data: data,
        options: Options(headers: {
          "accept": "*/*",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));

    print(response.data);
    // return UserModel.fromJson(response.data);
  }

  Future<dynamic> changePassword([dynamic data]) async {
    GetStorage box = GetStorage();
    var token = box.read('token');
    var response = await Api().tokenDio.post('/user/reset',
        data: data,
        options: Options(headers: {
          "accept": "*/*",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));

    print(response.data);
    // return UserModel.fromJson(response.data);
  }

  Future<dynamic> logout() async {
    GetStorage box = GetStorage();
    var token = box.read('token');
    var response = await Api().tokenDio.post('/logout',
        options: Options(headers: {
          "accept": "*/*",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));

    print(response.data);
    // return UserModel.fromJson(response.data);
  }
}
