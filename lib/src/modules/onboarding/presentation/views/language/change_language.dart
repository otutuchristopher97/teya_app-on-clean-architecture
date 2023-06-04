import 'package:teya/src/core/components/back_page_button.dart';
import 'package:teya/src/core/components/texts/custom_text.dart';
import 'package:teya/src/core/resources/colors/pallet.dart';
import 'package:teya/src/core/resources/string/string_constant.dart';
import 'package:teya/src/core/utils/util_functions.dart';
import 'package:teya/src/modules/onboarding/data/model/language.dart';
import 'package:teya/src/modules/onboarding/presentation/logic/splashscreen_controller.dart';
import 'package:teya/src/modules/onboarding/presentation/views/language/widgets/language_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  SplashscreenController splashscreenController = Get.find();
  List<Language> otherLanguages = [];
  @override
  void initState() {
    super.initState();
    fetchOtherLanguages();
  }

  void fetchOtherLanguages() {
    otherLanguages = splashscreenController.languages
        .where((p0) => p0.isCurrent == false)
        .toList();
    otherLanguages.sort((a, b) => a.englishName.compareTo(b.englishName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          color: Pallet.white,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: Row(
                  children: [
                    const BackPageButton(),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomText(
                      text: StringConfig.text.languageSettings,
                      key: const Key("language_settings"),
                      size: 16,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: StringConfig.text.yourLanguage,
                          key: const Key("current_language"),
                          weight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LanguageCard(
                            language:
                                splashscreenController.currentLanguage.value,
                            onCardTap: () {}),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: StringConfig.text.otherLanguage,
                          key: const Key("other_languages"),
                          weight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          itemBuilder: (ctx, index) {
                            return LanguageCard(
                                language: otherLanguages[index],
                                onCardTap: () {
                                  var locale =
                                      Locale(otherLanguages[index].locale);
                                  Get.updateLocale(locale);
                                  splashscreenController.resetDeviceLanguage(
                                      otherLanguages[index].locale);
                                  fetchOtherLanguages();
                                  UtilFunctions.displaySuccessBox(
                                    StringConfig.text.success,
                                    StringConfig.text.languageSettingsUpdated,
                                  );
                                });
                          },
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: otherLanguages.length,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
