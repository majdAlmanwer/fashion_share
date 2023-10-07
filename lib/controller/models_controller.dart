import 'package:get/get.dart';

import '../model/models_model.dart';
import '../service/models_service.dart';
import 'loader_controller.dart';

class ModelsController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());
  ModelsModel modelsList = ModelsModel();

  Future<dynamic> fetchModelsList() async {
    loaderController.loading(true);

    var data = {
      'models': [
        "size",
        "color",
        "section",
        "condition",
        "material",
        "branch",
        "category",
        "banner"
      ]
    };
    var getItems = await ModelsService().getAllModels(data);
    modelsList = getItems;

    update();
    print('11111111111111111111111111111 is ${modelsList.category!.length}');

    loaderController.loading(false);
    // update();
    // return productsList;
  }
}
