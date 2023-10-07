import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';
import '../utils/app_config.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onTap, required this.title});

  Function()? onTap;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          // boxShadow: const [
          //   BoxShadow(
          //     blurStyle: BlurStyle.normal,
          //     color: sblueColor,
          //     offset: Offset(2.0, 5.0), //(x,y)
          //     blurRadius: 10.0,
          //   ),
          // ],
          border: Border.all(color: sblueColor, width: 5.0),
          color: sblueColor,
          borderRadius: BorderRadius.circular(25),
        ),
        width: getPercentScreenWidth(90),
        height: getPercentScreenHeight(6),
        // color: SPrimaryColor,
        child: TextButton(
          onPressed: onTap,
          child: Text(
            textAlign: TextAlign.center,
            title.tr,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontFamily: 'segoeuiBold'),
          ),
        )).paddingOnly(top: getPercentScreenHeight(5));
  }
}
