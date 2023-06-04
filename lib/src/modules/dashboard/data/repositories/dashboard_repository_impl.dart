import 'package:dartz/dartz.dart';
import 'package:teya/src/modules/dashboard/data/datasources/dashboard_remote_data_source.dart';

import 'package:teya/src/modules/dashboard/domain/respositories/dashboard_repository.dart';
import '../../../../core/error/failure.dart';
import 'package:teya/src/modules/dashboard/data/models/album_feed.dart';
import 'package:teya/src/modules/dashboard/domain/params/fetch_album_params.dart';
import 'package:teya/src/core/services/api_interceptor.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<AlbumModel>>> fetchAlbums(
      FetchAlbumParams params) {
    return apiInterceptor(
      () => remoteDataSource.fetchAlbums(params),
    );
  }
}
