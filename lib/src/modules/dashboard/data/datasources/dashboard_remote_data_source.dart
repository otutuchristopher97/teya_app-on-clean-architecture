// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:teya/src/modules/dashboard/data/models/album_feed.dart';
import 'package:teya/src/modules/dashboard/domain/params/fetch_album_params.dart';
import 'package:teya/src/core/services/network_utils.dart';
import 'package:teya/src/core/exceptions/api_response_exception.dart';
import 'package:teya/src/core/resources/string/app_strings.dart';

abstract class DashboardRemoteDataSource {
  Future<List<AlbumModel>>? fetchAlbums(FetchAlbumParams params);
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final NetworkUtils networkUtils;

  DashboardRemoteDataSourceImpl({required this.networkUtils});

  @override
  Future<List<AlbumModel>>? fetchAlbums(FetchAlbumParams params) async {
    final response = await networkUtils.dioGetRequest(
      '/us/rss/topalbums/limit=${params.limit}/json',
    );

    print(
      '/us/rss/topalbums/limit=${params.limit}/json',
    );
    List<AlbumModel> albums = [];
    try {
      AlbumFeed feed = AlbumFeed.fromJson(response!);
      return feed.feed?.entry ?? [];
    } catch (e) {
      throw ApiResponseException(
        exceptionMessage: AppString.GENERAL_ERROR_MSG,
      );
    }
    return albums;
  }
}
