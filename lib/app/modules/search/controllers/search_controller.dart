import 'package:get/get.dart';

import '../../../core/core.dart';

class SearchController extends GetxController {
  final SearchMovies _searchMovies;
  SearchController({required SearchMovies searchMovies})
    : _searchMovies = searchMovies;

  var query = ''.obs;
  var isLoading = false.obs;
  var results = <MovieEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    final q = Get.arguments as String? ?? '';
    if (q.isNotEmpty) {
      onSearch(q);
    }
  }

  Future<void> onSearch(String q) async {
    query.value = q;
    if (q.trim().isEmpty) {
      results.clear();
      return;
    }
    isLoading.value = true;
    final list = await _searchMovies(q);
    results.value = list;
    isLoading.value = false;
  }
}
