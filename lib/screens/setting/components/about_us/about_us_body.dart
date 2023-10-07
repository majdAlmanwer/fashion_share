import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/utils/app_color.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widget/titel_row.dart';

class AboutUsBody extends StatefulWidget {
  const AboutUsBody({super.key});

  @override
  State<AboutUsBody> createState() => _AboutUsBodyState();
}

class _AboutUsBodyState extends State<AboutUsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getPercentScreenHeight(100),
      width: getPercentScreenWidth(100),
      child: Column(
        children: [
          TitleRow(
            title: 'About Us'.tr,
            widget: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          Container(
            // color: Colors.amber,
            height: getPercentScreenHeight(70),
            width: getPercentScreenWidth(90),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: getPercentScreenHeight(10),
                width: getPercentScreenWidth(60),
                child: Image.asset('assets/images/Logo.png'),
              ),
              Container(
                height: getPercentScreenHeight(4),
                child: const AutoSizeText('V . 1.0 '),
              ),
              Container(
                height: getPercentScreenHeight(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: getPercentScreenHeight(5),
                            width: getPercentScreenWidth(8),
                            child: Image.asset('assets/images/fi_mail.png')),
                        SizedBox(
                          width: getPercentScreenWidth(2),
                        ),
                        Text(
                          'abcd@gmail.com',
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: getPercentScreenHeight(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Powered By'.tr,
                          style: const TextStyle(
                              color: Colors.black45, fontSize: 15),
                        ),
                        SizedBox(
                          width: getPercentScreenWidth(2),
                        ),
                        const Text(
                          'badaeldevelopment.com',
                          style: TextStyle(color: sblueColor, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Text(
                '© 2023 Badael Development, Inc. All rights reserved',
                style: TextStyle(color: Colors.black45, fontSize: 15),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
