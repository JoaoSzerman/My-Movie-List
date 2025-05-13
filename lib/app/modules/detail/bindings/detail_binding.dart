import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../controllers/detail_controller.dart';
import '../data/data.dart';
import '../domain/domain.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailRemoteDataSource>(
      () => MovieDetailRemoteDataSourceImpl(Get.find<Dio>()),
    );

    Get.lazyPut<DetailRepository>(
      () => DetailRepositoryImpl(Get.find<MovieDetailRemoteDataSource>()),
    );

    Get.lazyPut(() => GetMovieDetail(Get.find<DetailRepository>()));
    Get.lazyPut(() => GetMovieReviews(Get.find<DetailRepository>()));
    Get.lazyPut(() => GetMovieCredits(Get.find<DetailRepository>()));

    Get.lazyPut(
      () => DetailController(
        getMovieDetail: Get.find<GetMovieDetail>(),
        getMovieReviews: Get.find<GetMovieReviews>(),
        getMovieCredits: Get.find<GetMovieCredits>(),
      ),
    );
  }
}
