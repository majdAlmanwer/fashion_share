import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  XFile? image;
  List<XFile> images = [];
  Future<dynamic> pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      // if (image == null) return;

      images.add(image!);
      print(image.path);
      update();
      Get.back();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      images.add(image!);
      update();
      Get.back();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
