import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:teya/localization/app_translation.dart';
import 'package:teya/main_bindings.dart';
import 'package:teya/src/core/navigation/app_router.dart';
import 'package:teya/src/core/resources/string/app_strings.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  MainBinding mainBinding = MainBinding();
  mainBinding.dependencies();
  
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.APP_NAME,
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      fallbackLocale: const Locale('en', 'US'),
      locale: Get.deviceLocale,
      initialRoute: AppRouter.it.initialRoute,
      getPages: AppRouter.it.all,
      routingCallback: (route) async {},
    );
  }
}
