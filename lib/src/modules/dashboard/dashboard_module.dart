import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:get/get.dart';
import 'package:teya/src/modules/dashboard/presentation/views/detail_screen.dart';

import 'package:teya/src/modules/module.dart';

import 'package:teya/src/modules/dashboard/presentation/views/dashboard.dart';

class DashboardModule extends Module {
  static final dashboardScreen = GetPage(
    name: '/dashboard',
    page: () => const DashboardView(),
  );

  // static final detailScreen = GetPage(
  //   name: '/detailScreen',
  //   page: () => const DetailScreen(),
  // );

  @override
  void register(List<GetPage> routes) {
    routes.addAll([
      dashboardScreen,
    ]);
  }
}
