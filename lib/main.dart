import 'package:fashion_share/routes/app_pages.dart';
import 'package:fashion_share/routes/routes.dart';
import 'package:fashion_share/translation/app_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashscreen,
      getPages: pages,
      title: 'Fashion Share',
      translationsKeys: AppTranslation.translationKeys,
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      theme: ThemeData(),
    );
  }
}
