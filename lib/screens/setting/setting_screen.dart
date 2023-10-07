import 'package:fashion_share/screens/setting/body.dart';
import 'package:fashion_share/widget/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/app_color.dart';
import '../../widget/custom_alert_dialog.dart';
import '../../widget/nav_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    super.key,
  });
  // final int? index=1;
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SettingBody(),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) {
                return CustomAlertDialog();
              },
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: sblueColor,
        ),
      ),
    );
  }
}
