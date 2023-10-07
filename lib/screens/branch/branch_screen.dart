import 'package:auto_size_text/auto_size_text.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/app_color.dart';
import '../../widget/titel_row.dart';

class BranchScreen extends StatelessWidget {
  BranchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TitleRow(
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
                title: 'Branch'),
            Container(
              height: getPercentScreenHeight(50),
              width: getPercentScreenWidth(100),
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(51.509364, -0.128928),
                  zoom: 13.2,
                ),
                nonRotatedChildren: [
                  RichAttributionWidget(
                    attributions: [
                      TextSourceAttribution(
                        'OpenStreetMap contributors',
                        onTap: () => launchUrl(
                            Uri.parse('https://openstreetmap.org/copyright')),
                      ),
                    ],
                  ),
                ],
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                ],
              ),
            ),
            Container(
              height: getPercentScreenHeight(12),
              width: getPercentScreenWidth(92),
              // padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Branch'.tr + ' : ',
                    style: const TextStyle(
                        fontFamily: 'segoeuiBold',
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            // int id =int.parse(data['product']['brands'].replaceAll(RegExp(r'[^0-9]'), ''))
                            // proList[index].model!,
                            'Bab Tuma',
                            maxFontSize: 16,
                            minFontSize: 15,
                            maxLines: 1,

                            // 'camry',
                            // s.model!,
                            style: TextStyle(
                                fontFamily: 'segoeui',
                                // fontSize: 15,
                                color: fontgrey),
                          ),
                          AutoSizeText(
                            // int id =int.parse(data['product']['brands'].replaceAll(RegExp(r'[^0-9]'), ''))
                            // proList[index].model!,
                            'Open  :  ' + 'Opens: Sun - Thu/9 AM - 8 PM',
                            maxFontSize: 16,
                            minFontSize: 15,
                            maxLines: 1,

                            // 'camry',
                            // s.model!,
                            style: TextStyle(
                                fontFamily: 'segoeui',
                                // fontSize: 15,
                                color: fontgrey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: getPercentScreenWidth(5),
                            child:
                                Image.asset('assets/images/WhatsApp FAB.png'),
                          ),
                          SizedBox(
                            width: getPercentScreenWidth(2),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: getPercentScreenWidth(5),
                            child:
                                Image.asset('assets/images/phone-button.png'),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
