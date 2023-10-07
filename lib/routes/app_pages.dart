import 'package:fashion_share/routes/routes.dart';
import 'package:fashion_share/screens/add_product/add_product_screen.dart';
import 'package:fashion_share/screens/auth/login_screen.dart';
import 'package:fashion_share/screens/home/home_screen.dart';
import 'package:fashion_share/screens/home/product_details/details_screen.dart';
import 'package:fashion_share/screens/product_list/product_list_screen.dart';
import 'package:fashion_share/screens/setting/components/favorite/favorite_screen.dart';
import 'package:fashion_share/screens/splash/onboarding/onboarding_screen.dart';
import 'package:fashion_share/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

final pages = <GetPage>[
  GetPage(
    name: AppRoutes.homepage,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.productdetails,
    page: () => const ProductDetails(),
  ),
  GetPage(
    name: AppRoutes.splashscreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.loginscreen,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: AppRoutes.onboard,
    page: () => const OnBoardingScreen(),
  ),
  GetPage(
    name: AppRoutes.productlistscreen,
    page: () => const ProductScreen(),
  ),
  GetPage(
    name: AppRoutes.favoritescreen,
    page: () => const FavoriteScreen(),
  ),
  GetPage(
    name: AppRoutes.addproduct,
    page: () => const AddProductScreen(),
  ),
];
