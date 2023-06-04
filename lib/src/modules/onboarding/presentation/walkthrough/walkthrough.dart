import 'package:teya/src/core/components/custom_bordered_button.dart';
import 'package:teya/src/core/components/custom_elevated_button.dart';
import 'package:teya/src/core/components/texts/custom_text.dart';
import 'package:teya/src/core/resources/colors/pallet.dart';
import 'package:teya/src/core/resources/sizes/size_config.dart';
import 'package:teya/src/core/resources/string/app_assets.dart';
import 'package:teya/src/core/resources/string/string_constant.dart';
import 'package:teya/src/modules/onboarding/data/model/walkthrough_model.dart';
import 'package:teya/src/modules/onboarding/onboarding_module.dart';
import 'package:teya/src/modules/onboarding/presentation/logic/splashscreen_controller.dart';
import 'package:teya/src/modules/onboarding/presentation/logic/walkthrough_controller.dart';
import 'package:teya/src/modules/onboarding/presentation/walkthrough/widgets/slide_dots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});
  @override
  WalkThroughScreenState createState() => WalkThroughScreenState();
}

class WalkThroughScreenState extends State<WalkThroughScreen> {
  WalkthroughController controller = Get.find();
  SplashscreenController splashscreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<WalkthroughModel> sliderItems = [
      WalkthroughModel(
          title: StringConfig.text.illustratorOneTitle,
          subtitle: StringConfig.text.illustratorOneMsg,
          image: AppSvgAssets.wk_illustrator1),
      WalkthroughModel(
          title: StringConfig.text.illustratorTwoTitle,
          subtitle: StringConfig.text.illustratorTwoMsg,
          image: AppSvgAssets.wk_illustrator2),
      WalkthroughModel(
          title: StringConfig.text.illustratorThreeTitle,
          subtitle: StringConfig.text.illustratorThreeMsg,
          image: AppSvgAssets.wk_illustrator3),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          onPageChanged: controller.onPageChanged,
                          controller: controller.pageController,
                          itemCount: 3,
                          itemBuilder: (ctx, i) => SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: SizeConfig.verticalHeightScaled * 5,
                                ),
                                SizedBox(
                                  key: const Key("image"),
                                  height: SizeConfig.midHeightScaled,
                                  width: SizeConfig.screenWidth,
                                  child: Image.asset(sliderItems[i].image),
                                ),
                                SizedBox(
                                  height: SizeConfig.verticalHeightScaled,
                                ),
                                CustomText(
                                    key: const Key("title"),
                                    text: sliderItems[i].title,
                                    size: 18,
                                    isCentered: true,
                                    weight: FontWeight.bold),
                                SizedBox(
                                  height: SizeConfig.verticalHeightScaled,
                                ),
                                CustomText(
                                  key: const Key("desc"),
                                  size: 12,
                                  isCentered: true,
                                  text: sliderItems[i].subtitle,
                                  color: Pallet.blackNeutral,
                                ),
                                SizedBox(
                                  height: SizeConfig.verticalHeightScaled * 1.5,
                                ),
                                SizedBox(
                                  height: 5,
                                  child: ListView.builder(
                                    itemBuilder: (ctx, index) {
                                      return Obx(
                                        (() => SlideDots(
                                            isActive:
                                                controller.currentPage.value ==
                                                    index)),
                                      );
                                    },
                                    itemCount: sliderItems.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      child: CustomElevatedButton(
                        key: const Key("signup"),
                        label: StringConfig.text.createAccount,
                        onPressed: () {
                          Get.toNamed(
                              OnboardingModule.createAccountScreen.name);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      child: CustomBorderedButton(
                        key: const Key("signin"),
                        label: StringConfig.text.iHaveAccount,
                        onPressed: () {
                          Get.toNamed(OnboardingModule.loginScreen.name);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Positioned(
            top: 60,
            right: 20,
            child: Container(
                width: 90,
                height: 40,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 229, 227, 227),
                ),
                child: Obx(
                  () => GestureDetector(
                    onTap: () {
                      Get.toNamed(OnboardingModule.changeLanguageScreen.name);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          splashscreenController.currentLanguage.value.logoUrl,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomText(
                          text: splashscreenController
                              .currentLanguage.value.shortName,
                          key: const Key("title"),
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
