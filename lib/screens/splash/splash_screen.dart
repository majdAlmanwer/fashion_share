import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/splash_controller.dart';
import '../../utils/app_color.dart';
import '../../utils/app_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  SplashController splashController = Get.put(SplashController());

  // @override
  @override
  void initState() {
    super.initState();
    startTime();
    // splashController.checkAndConnectivity();
    // notificationController.startNotifications();
    // SplashController splashController = Get.put(SplashController());
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    // var duration = await splashController.route();
    return Timer(duration, (() => splashController.checkAndConnectivity()));
  }

  @override
  dispose() {
    startTime();
    print('internet checker is dispooooooosssseess');

    super.dispose();
  }

  // route() {

  //   Get.offAllNamed(AppRoutes.loginscreen);
  //   // Navigator.pushReplacement(
  //   //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
  // }

  @override
  build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: getPercentScreenWidth(10),
      height: getPercentScreenHeight(10),
      decoration: const BoxDecoration(
        color: sblueColor,
        // image: DecorationImage(
        //     image: AssetImage(
        //       'assets/images/splash.png',
        //     ),
        //     fit: BoxFit.contain),
      ),
      child: Center(
        child: Container(
          width: getPercentScreenWidth(70),
          height: getPercentScreenHeight(50),
          decoration: const BoxDecoration(
            color: sblueColor,
          ),
          child: Image.asset('assets/images/splash.png', fit: BoxFit.contain),
        ),
      ),
    );
  }
}
