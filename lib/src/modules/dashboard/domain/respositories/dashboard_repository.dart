import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import 'package:teya/src/modules/dashboard/data/models/album_feed.dart';
import 'package:teya/src/modules/dashboard/domain/params/fetch_album_params.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<AlbumModel>>>? fetchAlbums(
      FetchAlbumParams params);
}
