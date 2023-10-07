import 'package:fashion_share/screens/home/tabBarScreens/tab_bar_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return CustomTabBarView();
  }
}
