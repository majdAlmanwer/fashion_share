import 'package:get/get.dart';

class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

// OnBoarding content list
final List<OnBoard> demoData = [
  OnBoard(
    image: "assets/images/onBoard-1.png",
    title: "Welcome to a World of Style".tr,
    description:
        "Welcome to our clothing rental and resale community! Discover a world of stylish options as you browse through a diverse collection of clothes available for rent or purchase."
            .tr,
  ),
  OnBoard(
    image: "assets/images/onBoard-2.png",
    title: "Rent and Sell with Confidence".tr,
    description:
        "Rent with confidence and ease. You can seamlessly rent clothes from fellow fashion enthusiasts or earn extra income by listing your own wardrobe for others to enjoy."
            .tr,
  ),
  OnBoard(
    image: "assets/images/onBoard-3.png",
    title: "Find Your Perfect Fit".tr,
    description:
        "Effortlessly find the perfect fit. Our advanced search and filtering options allow you to browse by size, color, and more, ensuring you discover clothing items tailored to your preferences."
            .tr,
  ),
];
