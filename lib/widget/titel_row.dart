import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_config.dart';

class TitleRow extends StatelessWidget {
  const TitleRow(
      {Key? key,
      required this.title,
      this.icon,
      this.widget,
      this.height,
      this.showIconPadding = true})
      : super(key: key);
  final String title;
  final Icon? icon;
  final double? height;
  final bool showIconPadding;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.normal,
            color: Colors.black45,
            offset: Offset(1.0, 1.0), //(x,y)
            blurRadius: 5.0,
          ),
        ],
        color: Colors.white,
      ),
      width: getPercentScreenWidth(100),
      height: height ?? getPercentScreenHeight(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget!,
          Container(

              // alignment: Alignment.centerRight,
              height: getPercentScreenHeight(3),
              // width: getPercentScreenWidth(30),
              child: FittedBox(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'segoeuiBold',
                  ),
                  maxLines: 1,
                ),
              )),
        ],
      ).paddingOnly(
          left: getPercentScreenWidth(4),
          right: getPercentScreenWidth(4),
          bottom: getPercentScreenHeight(1),
          top: getPercentScreenHeight(2)),
    );
  }
}
// IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//               size: 25,
//             ),
//             onPressed:   () {
//                 Get.back();
//               }),,
//           ),