import 'package:fashion_share/screens/add_product/widget/rent_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/add_product/add_product_screen.dart';

class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: AlertDialog(
        // clipBehavior: Clip.hardEdge,
        elevation: 30,

        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.all(12),
        insetPadding: EdgeInsets.all(5),

        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.off(const AddProductScreen());
              },
              child: Image.asset(
                'assets/images/Basic dialog.png',
                // height: getPercentScreenHeight(25),
                // width: getPercentScreenWidth(100),
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {
                Get.off(const RentProductScreen());
              },
              child: Image.asset(
                'assets/images/Basic dialog (1).png',
                // height: getPercentScreenHeight(25),
                // width: getPercentScreenWidth(90),
                fit: BoxFit.fitWidth,
              ),
            )
          ],
        ),
        // actions: [
        //   TextButton(
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //     child: Text('Close'),
        //   ),
        // ],
      ),
    );
  }
}
