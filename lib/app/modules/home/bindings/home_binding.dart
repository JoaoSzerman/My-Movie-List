import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../controllers/home_controller.dart';
import '../data/data.dart';
import '../domain/domain.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieRemoteDatasource>(
      () => MovieRemoteDatasourceImpl(Get.find<Dio>()),
    );
    Get.lazyPut<MovieRepository>(
      () => MovieRepositoryImpl(Get.find<MovieRemoteDatasource>()),
    );
    Get.lazyPut(() => GetTrendingMovies(Get.find<MovieRepository>()));
    Get.lazyPut(() => GetNowPlayingMovies(Get.find<MovieRepository>()));
    Get.lazyPut(() => GetUpcomingMovies(Get.find<MovieRepository>()));
    Get.lazyPut(() => GetTopRatedMovies(Get.find<MovieRepository>()));
    Get.lazyPut(() => GetPopularMovies(Get.find<MovieRepository>()));

    Get.lazyPut<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(Get.find<Dio>()),
    );
    Get.lazyPut<SearchRepository>(
      () => SearchRepositoryImpl(Get.find<SearchRemoteDataSource>()),
    );
    Get.lazyPut(() => SearchMovies(Get.find<SearchRepository>()));

    Get.lazyPut(
      () => HomeController(
        searchMovies: Get.find<SearchMovies>(),
        getTrendingMovies: Get.find<GetTrendingMovies>(),
        getNowPlaying: Get.find<GetNowPlayingMovies>(),
        getUpcoming: Get.find<GetUpcomingMovies>(),
        getTopRated: Get.find<GetTopRatedMovies>(),
        getPopular: Get.find<GetPopularMovies>(),
      ),
    );
  }
}
