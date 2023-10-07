import 'package:fashion_share/utils/app_config.dart';
import 'package:fashion_share/widget/titel_row.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ContactUsBody extends StatefulWidget {
  const ContactUsBody({super.key});

  @override
  State<ContactUsBody> createState() => _ContactUsBodyState();
}

class _ContactUsBodyState extends State<ContactUsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getPercentScreenHeight(100),
      width: getPercentScreenWidth(100),
      child: Column(
        children: [
          TitleRow(
            title: 'Contact Us'.tr,
            widget: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () {
                  Get.back();
                }),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            // color: Colors.amber,
            height: getPercentScreenHeight(80),
            width: getPercentScreenWidth(90),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: getPercentScreenHeight(8),
                            width: getPercentScreenWidth(10),
                            child: Image.asset('assets/images/WhatsApp.png')),
                        SizedBox(
                          width: getPercentScreenWidth(3),
                        ),
                        Text(
                          '+963925489358',
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: getPercentScreenHeight(8),
                            width: getPercentScreenWidth(10),
                            child: Image.asset('assets/images/Facebook.png')),
                        SizedBox(
                          width: getPercentScreenWidth(2),
                        ),
                        Text(
                          'FaceBook',
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: getPercentScreenHeight(8),
                            width: getPercentScreenWidth(10),
                            child: Image.asset('assets/images/Instagram.png')),
                        SizedBox(
                          width: getPercentScreenWidth(2),
                        ),
                        Text(
                          'Instagram',
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: getPercentScreenHeight(8),
                            width: getPercentScreenWidth(10),
                            child: Image.asset('assets/images/fi_mail.png')),
                        SizedBox(
                          width: getPercentScreenWidth(2),
                        ),
                        Text(
                          'asd@gmail.com',
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: getPercentScreenHeight(8),
                            width: getPercentScreenWidth(10),
                            child:
                                Image.asset('assets/images/fi_phone-call.png')),
                        SizedBox(
                          width: getPercentScreenWidth(2),
                        ),
                        Text(
                          '+963956842365',
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
