import 'package:fashion_share/routes/routes.dart';
import 'package:fashion_share/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'on_board_content.dart';
import 'on_bord.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // Variables
  late PageController _pageController;
  int _pageIndex = 0;
  // Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Initialize page controller
    _pageController = PageController(initialPage: 0);
    // Automatic scroll behaviour
    // _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
    //   if (_pageIndex < 3) {
    //     _pageIndex++;
    //   } else {
    //     _pageIndex = 0;
    //   }

    //   _pageController.animateToPage(
    //     _pageIndex,
    //     duration: const Duration(milliseconds: 350),
    //     curve: Curves.easeIn,
    //   );
    // });
  }

  @override
  void dispose() {
    // Dispose everything
    _pageController.dispose();
    // _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        // Background gradient
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            // Carousel area
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: demoData.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnBoardContent(
                  title: demoData[index].title,
                  description: demoData[index].description,
                  image: demoData[index].image,
                ),
              ),
            ),
            // Indicator area
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    demoData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                ],
              ),
            ), // Privacy policy area

            // White space
            const SizedBox(
              height: 16,
            ),
            // Button area
            CustomButton(
              title: _pageIndex == 2 ? 'Get Started'.tr : 'Next'.tr,
              onTap: () {
                setState(() {
                  // _pageController.initialPage == _pageIndex;
                  if (_pageIndex < 2) {
                    _pageIndex++;
                  } else {
                    _pageIndex = 2;
                    Get.offAllNamed(AppRoutes.homepage);
                  }
                  _pageController.animateToPage(
                    _pageIndex,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeIn,
                  );
                });
              },
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
