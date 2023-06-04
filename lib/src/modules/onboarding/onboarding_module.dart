import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:get/get.dart';

import 'package:teya/src/modules/module.dart';
import 'package:teya/src/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:teya/src/modules/onboarding/presentation/views/language/change_language.dart';
import 'package:teya/src/modules/onboarding/presentation/views/login/create_account_screen.dart';
import 'package:teya/src/modules/onboarding/presentation/views/login/login_screen.dart';

import 'package:teya/src/modules/onboarding/presentation/views/splashscreen/splashscreen.dart';
import 'package:teya/src/modules/onboarding/presentation/walkthrough/walkthrough.dart';

class OnboardingModule extends Module {
  static final splashScreen = GetPage(
    name: '/splashscreen',
    page: () => const SplashScreen(),
  );

  static final loginScreen = GetPage(
    name: '/loginscreen',
    page: () => const LoginScreen(),
    binding: OnboardingBinding(),
  );

  static final createAccountScreen = GetPage(
    name: '/createaccount',
    page: () => const CreateAccountScreen(),
    binding: OnboardingBinding(),
  );

  static final walkThroughScreen = GetPage(
    name: '/walkthrough',
    page: () => const WalkThroughScreen(),
    binding: OnboardingBinding(),
  );

  static final changeLanguageScreen = GetPage(
    name: '/changeLanguageScreen',
    page: () => const ChangeLanguage(),
    binding: OnboardingBinding(),
  );


  @override
  void register(List<GetPage> routes) {
    routes.addAll([
      splashScreen,
      loginScreen,
      createAccountScreen,
      walkThroughScreen,
      changeLanguageScreen
    ]);
  }
}
