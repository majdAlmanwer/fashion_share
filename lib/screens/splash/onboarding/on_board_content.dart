import 'package:fashion_share/utils/app_color.dart';
import 'package:fashion_share/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardContent extends StatelessWidget {
  OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  String image;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: getPercentScreenHeight(50),
          width: getPercentScreenWidth(50),
        ),
        const Spacer(),
        Text(
          title.tr,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black45,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        const Spacer(),
        const Spacer(),
      ],
    );
  }
}

// Dot indicator widget
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? sblueColor : Colors.white,
        border: isActive ? null : Border.all(color: sblueColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
