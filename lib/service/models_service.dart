import 'package:dio/dio.dart';
import 'package:fashion_share/controller/loader_controller.dart';
import 'package:get/get.dart';
import '../api/api.dart';
import '../model/models_model.dart';

class ModelsService {
  static ModelsService? _instance;

  var dio = Dio();
  factory ModelsService() => _instance ??= ModelsService._();

  ModelsService._();

  LoaderController loaderController = Get.put(LoaderController());
  Future<dynamic> getAllModels(dynamic data) async {
    loaderController.loading(true);
    var response = await Api().dio.get('/data', data: data);

    print(ModelsModel.fromJson(response.data));
    loaderController.loading(false);
    return ModelsModel.fromJson(response.data);
  }
}
