import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:get/get.dart';

import '../utils/app_config.dart';

class CircleShimmerLoader extends StatefulWidget {
  const CircleShimmerLoader({super.key});

  @override
  State<CircleShimmerLoader> createState() => _CircleShimmerLoaderState();
}

class _CircleShimmerLoaderState extends State<CircleShimmerLoader> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
        height: getPercentScreenHeight(8),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          // padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 8,
              ),
              FadeShimmer(
                height: 50,
                width: 50,
                radius: 50,
                millisecondsDelay: 100,
                fadeTheme: FadeTheme.light,
                baseColor: Colors.grey[800],
                highlightColor: Colors.grey[600],
              ),
              const SizedBox(
                width: 8,
              ),
              FadeShimmer(
                height: 50,
                millisecondsDelay: 200,
                width: 50,
                radius: 50,
                fadeTheme: FadeTheme.light,
                baseColor: Colors.grey[800],
                highlightColor: Colors.grey[600],
              ),
              const SizedBox(
                width: 8,
              ),
              FadeShimmer(
                height: 50,
                millisecondsDelay: 200,
                width: 50,
                radius: 50,
                fadeTheme: FadeTheme.light,
                baseColor: Colors.grey[800],
                highlightColor: Colors.grey[600],
              ),
              const SizedBox(
                width: 8,
              ),
              FadeShimmer(
                height: 50,
                millisecondsDelay: 200,
                width: 50,
                radius: 50,
                fadeTheme: FadeTheme.light,
                baseColor: Colors.grey[800],
                highlightColor: Colors.grey[600],
              ),
              const SizedBox(
                width: 8,
              ),
              FadeShimmer(
                height: 50,
                millisecondsDelay: 200,
                width: 50,
                radius: 50,
                fadeTheme: FadeTheme.light,
                baseColor: Colors.grey[800],
                highlightColor: Colors.grey[600],
              ),
              const SizedBox(
                width: 8,
              ),
              // FadeShimmer(
              //   height: 50,
              //   millisecondsDelay: 200,
              //   width: 50,
              //   radius: 50,
              //   fadeTheme: FadeTheme.light,
              //   baseColor: Colors.grey[800],
              //   highlightColor: Colors.grey[600],
              // ),
            ],
          ),
        )).paddingOnly(top: 8);
  }
}
