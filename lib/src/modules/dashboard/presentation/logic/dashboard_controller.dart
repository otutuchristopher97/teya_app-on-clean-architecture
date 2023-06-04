import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:teya/src/modules/dashboard/data/models/album_feed.dart';
import 'package:teya/src/modules/dashboard/domain/params/fetch_album_params.dart';

import 'package:teya/src/modules/dashboard/domain/usecases/fetch_albums.dart';
import 'package:teya/src/core/utils/util_functions.dart';

class DashboardController extends GetxController {
  FetchAlbums fetchAlbumsUsecase;

  DashboardController({
    required this.fetchAlbumsUsecase,
  });

  final isLoadingAlbums = false.obs;
  RxList<AlbumModel> filteredAlbums = (List<AlbumModel>.of([])).obs;
  List<AlbumModel> albums = [];
  TextEditingController searchAlbumsController =
      TextEditingController(text: "");

  Future<List<AlbumModel>> fetchAlbums(FetchAlbumParams params) async {
    albums.clear();
    isLoadingAlbums.value = true;

    dynamic response = await fetchAlbumsUsecase(params);

    response!.fold((failure) {
      UtilFunctions.displayErrorBox(failure.message);
    }, (success) {
      albums.addAll(success as List<AlbumModel>);
    });
    filteredAlbums.value = albums;
    isLoadingAlbums.value = false;
    return albums;
  }

  void onReferralSearchTextChanged(text) {
    filteredAlbums.value = albums.where((element) {
      if (element.title?.label == null) {
        return false;
      }
      return element.title!.label!
          .toLowerCase()
          .contains(text.toString().toLowerCase());
    }).toList();
    filteredAlbums.sort((a, b) {
      //sorting in ascending order
      return a.title!.label!.compareTo(b.title!.label!);
    });
  }
}
