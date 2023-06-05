import 'package:flutter/material.dart';
import 'package:teya/src/core/components/textformfields/custom_textformfield.dart';
import 'package:teya/src/core/resources/colors/pallet.dart';

import 'package:teya/src/modules/dashboard/domain/params/fetch_album_params.dart';
import 'package:teya/src/modules/dashboard/presentation/logic/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:teya/src/modules/dashboard/presentation/widgets/album_item.dart';

import '../../../../core/components/texts/custom_text.dart';
import '../../../onboarding/presentation/logic/auth_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardController dashboardController = Get.find();
  AuthController authController = Get.find();
  bool _isInit = true;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_isInit) {
      await dashboardController.fetchAlbums(const FetchAlbumParams(limit: 100));
      setState(() {
        _isInit = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Obx(
            () => dashboardController.isLoadingAlbums.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: 'Top 100 iTunes Album',
                            weight: FontWeight.w700,
                            size: 18,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          IconButton(
                              onPressed: () {
                                authController.logout();
                              },
                              icon: const Icon(
                                Icons.logout_outlined,
                                color: Pallet.primary,
                              ))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: CustomTextFormField(
                                key: const ValueKey("search_album"),
                                hintText: "Search Albums",
                                enableBorder: false,
                                controller:
                                    dashboardController.searchAlbumsController,
                                onChanged: dashboardController
                                    .onReferralSearchTextChanged,
                                icon: const Icon(
                                  Icons.search,
                                  color: Pallet.blackNeutral,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (ctx, index) {
                            return AlbumItem(
                              album: dashboardController.filteredAlbums[index],
                            );
                          },
                          itemCount: dashboardController.filteredAlbums.length,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
