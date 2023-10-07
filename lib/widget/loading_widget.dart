import 'package:fashion_share/utils/app_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../utils/app_config.dart';

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({super.key});

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget> {
  @override
  Widget build(BuildContext context) {
    return GetSnackBar(
        maxWidth: getPercentScreenWidth(75),

        // showProgressIndicator: true,
        titleText: Column(
          children: [
            Center(
              child: CircularProgressIndicator(color: sblueColor),
            ),
            SizedBox(
              height: getPercentScreenHeight(3),
            ),
            // Image.asset('assets/images/Icon -1.png',
            //     fit: BoxFit.contain,
            //     scale: 0.1,
            //     width: getPercentScreenWidth(10),
            //     height: getPercentScreenHeight(10)),
            Text('Loading'.tr + '.......',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: sblueColor)),
          ],
        ),
        messageText: Text(
          ''.tr,
        ),
        borderRadius: 30.0,
        // duration: const Duration(seconds: 2),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        snackPosition: SnackPosition.TOP,
        backgroundColor: blueColor);
  }
}

// showLoaderDialog(BuildContext context) {
//   AlertDialog alert = AlertDialog(
//     content: new Row(
//       children: [
//         CircularProgressIndicator(),
//         Container(margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
//       ],
//     ),
//   );
//   showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
