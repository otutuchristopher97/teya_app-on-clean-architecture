import 'package:get/get.dart';

String _name(String name, Map<String, dynamic> parameters) {
  String route = name;

  parameters.forEach((key, value) {
    route = route.replaceFirst(':$key', value.toString());
  });
  return route;
}

extension RoutesExtension on GetPage {
  Future<T?>? navigate<T>({
    Map<String, dynamic> parameters = const {},
    dynamic arguments,
  }) {
    return Get.toNamed(
      _name(name, parameters),
      arguments: arguments,
      preventDuplicates: false,
    );
  }

  Future<T?>? navigateToFirst<T>({
    Map<String, dynamic> parameters = const {},
    dynamic arguments,
  }) {
    return Get.offAllNamed(_name(name, parameters), arguments: arguments);
  }

  void navigateUntilPage() {
    Get.until((route) => Get.currentRoute == name);
  }
}
