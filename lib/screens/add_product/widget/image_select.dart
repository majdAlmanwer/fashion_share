import 'package:fashion_share/controller/image_picker_controller.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectDialog extends StatefulWidget {
  @override
  State<ImageSelectDialog> createState() => _ImageSelectDialogState();
}

class _ImageSelectDialogState extends State<ImageSelectDialog> {
  final imageController = Get.put(ImagePickerController());

  XFile? image;

  List<XFile> images = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        decoration: BoxDecoration(
            // border: Border.none,
            borderRadius: BorderRadius.circular(16),
            color: Colors.white

            // ],
            ),
        height: getPercentScreenHeight(25),
        width: getPercentScreenWidth(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                'Pick Image From',
                style: const TextStyle(
                    fontFamily: 'segoeuiBold', fontSize: 20, color: fontgrey),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          imageController.pickImageGallery();
                        },
                        child: Icon(
                          Icons.photo_library_outlined,
                          color: sblueColor,
                          size: getPercentScreenWidth(10),
                        )),
                    SizedBox(height: 12),
                    Text(
                      'Gallery',
                      style: const TextStyle(
                          fontFamily: 'segoeuiBold',
                          fontSize: 16,
                          color: fontgrey),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          imageController.pickImageCamera();
                        },
                        child: Icon(
                          Icons.photo_camera,
                          color: sblueColor,
                          size: getPercentScreenWidth(10),
                        )),
                    SizedBox(height: 12),
                    Text(
                      'Camera',
                      style: const TextStyle(
                          fontFamily: 'segoeuiBold',
                          fontSize: 16,
                          color: fontgrey),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // actions: [
      //   TextButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     child: Text('Close'),
      //   ),
      // ],
    );
  }
}
