import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(Get.find<Dio>()),
    );

    Get.lazyPut<SearchRepository>(
      () => SearchRepositoryImpl(Get.find<SearchRemoteDataSource>()),
    );

    Get.lazyPut(() => SearchMovies(Get.find<SearchRepository>()));

    Get.lazyPut(() => SearchController(searchMovies: Get.find<SearchMovies>()));
  }
}
