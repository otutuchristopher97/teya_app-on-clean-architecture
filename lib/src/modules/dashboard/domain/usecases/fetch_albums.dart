import 'package:dartz/dartz.dart';

import 'package:teya/src/core/usecases/usecase.dart';
import 'package:teya/src/modules/dashboard/data/models/album_feed.dart';
import 'package:teya/src/modules/dashboard/domain/params/fetch_album_params.dart';
import 'package:teya/src/modules/dashboard/domain/respositories/dashboard_repository.dart';

import '../../../../core/error/failure.dart';

class FetchAlbums
    with UseCases<Either<Failure, List<AlbumModel>>, FetchAlbumParams> {
  final DashboardRepository repository;

  FetchAlbums(this.repository);

  @override
  Future<Either<Failure, List<AlbumModel>>?>? call(
    FetchAlbumParams params,
  ) async {
    return await repository.fetchAlbums(params);
  }
}
