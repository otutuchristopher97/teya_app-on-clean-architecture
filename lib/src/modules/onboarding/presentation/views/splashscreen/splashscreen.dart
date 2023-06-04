import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teya/src/core/resources/string/app_assets.dart';
import 'package:teya/src/core/resources/string/app_strings.dart';

import 'package:get/get.dart';

import '../../logic/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 2), () async {
      await authController.tryAutoLogin();
      // Get.offNamedUntil(
      //     OnboardingModule.walkThroughScreen.name, (route) => false);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (timer.isActive) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            key: const Key("logo"),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.splashscreen_logo),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppString.APP_NAME.toLowerCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
