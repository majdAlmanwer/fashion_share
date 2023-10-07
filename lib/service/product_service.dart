import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../api/api.dart';
import '../model/product_list_model.dart';

class ProductService {
  static ProductService? _instance;

  var dio = Dio();
  factory ProductService() => _instance ??= ProductService._();

  ProductService._();

  GetStorage box = GetStorage();

  Future<ProductListModel> getAllProducts(dynamic data) async {
    var response = await Api().dio.get('/products', data: data);
    print(' product respons is *******  ${response.data}');
    return ProductListModel.fromJson(response.data);
  }

  Future<ProductListModel> getNextPage(int currentPage) async {
    final response = await Api().dio.get('/products?page=${currentPage++}');
    print(' product respons is *******  ${response.data}');
    return ProductListModel.fromJson(response.data);
  }

  Future<dynamic> addProduct({dynamic data}) async {
    var token = box.read('token');
    print('token token  token  token token  token $token ');
    var response = await Api().tokenDio.post('/products',
        data: data,
        options: Options(headers: {
          "accept": "*/*",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));
    return response.data;
  }
}
