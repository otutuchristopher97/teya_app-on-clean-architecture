import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:teya/src/core/services/network_utils.dart';
import 'package:teya/src/modules/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:teya/src/modules/dashboard/domain/respositories/dashboard_repository.dart';
import 'package:teya/src/modules/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:teya/src/modules/dashboard/domain/usecases/fetch_albums.dart';
import 'package:teya/src/modules/dashboard/presentation/logic/dashboard_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    final dio = Dio();
    Get.put(NetworkUtils(dio), permanent: true);

    Get.lazyPut<DashboardRemoteDataSource>(
        () => DashboardRemoteDataSourceImpl(networkUtils: Get.find()));
    Get.lazyPut<DashboardRepository>(
        () => DashboardRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => FetchAlbums(Get.find()));

    Get.put(
      DashboardController(
        fetchAlbumsUsecase: Get.find(),
      ),
    );
  }
}
