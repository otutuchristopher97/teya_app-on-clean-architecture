import 'package:teya/src/modules/onboarding/presentation/logic/auth_controller.dart';
import 'package:teya/src/modules/onboarding/presentation/logic/splashscreen_controller.dart';
import 'package:get/get.dart';
import 'package:teya/src/modules/onboarding/presentation/logic/walkthrough_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() => SplashscreenController(), fenix: true);
    Get.lazyPut(() => WalkthroughController(), fenix: true);
  }
}
