import 'package:get/get.dart';

class SizeConfig {
  static double get screenHeight => Get.height;

  static double get screenWidth => Get.width;

  static double get verticalHeightScaled => Get.height * 0.025;
  static double get horizontalWidthScaled => Get.width * 0.025;
  static double get midHeightScaled => verticalHeightScaled * 15;

  static double get normalTextSize => 12;
  static double get mediumTextSize => 24;
}
