import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared/domain/domain.dart';
import '../../../routes/app_pages.dart';
import '../domain/domain.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  final SearchMovies searchMovies;
  final GetTrendingMovies getTrendingMovies;
  final GetNowPlayingMovies getNowPlaying;
  final GetUpcomingMovies getUpcoming;
  final GetTopRatedMovies getTopRated;
  final GetPopularMovies getPopular;

  HomeController({
    required this.searchMovies,
    required this.getTrendingMovies,
    required this.getNowPlaying,
    required this.getUpcoming,
    required this.getTopRated,
    required this.getPopular,
  });

  var tabIndex = 0.obs;
  void changeTabIndex(int idx) => tabIndex.value = idx;
  late final TabController tabController;

  var trending = <MovieEntity>[].obs;
  var isLoadingTrending = false.obs;

  var nowPlaying = <MovieEntity>[].obs;
  var nowPlayingPage = 1.obs;
  var hasMoreNowPlaying = true.obs;
  var isLoadingNowPlaying = false.obs;
  var isLoadingMoreNowPlaying = false.obs;

  var upcoming = <MovieEntity>[].obs;
  var upcomingPage = 1.obs;
  var hasMoreUpcoming = true.obs;
  var isLoadingUpcoming = false.obs;
  var isLoadingMoreUpcoming = false.obs;

  var topRated = <MovieEntity>[].obs;
  var topRatedPage = 1.obs;
  var hasMoreTopRated = true.obs;
  var isLoadingTopRated = false.obs;
  var isLoadingMoreTopRated = false.obs;

  var popular = <MovieEntity>[].obs;
  var popularPage = 1.obs;
  var hasMorePopular = true.obs;
  var isLoadingPopular = false.obs;
  var isLoadingMorePopular = false.obs;

  var searchResults = <MovieEntity>[].obs;
  var isSearching = false.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this)
      ..addListener(_handleTabSelection);

    _loadTrending();
    _loadNowPlaying();
  }

  void _handleTabSelection() {
    if (!tabController.indexIsChanging) {
      switch (tabController.index) {
        case 0:
          if (nowPlaying.isEmpty) _loadNowPlaying();
          break;
        case 1:
          if (upcoming.isEmpty) _loadUpcoming();
          break;
        case 2:
          if (topRated.isEmpty) _loadTopRated();
          break;
        case 3:
          if (popular.isEmpty) _loadPopular();
          break;
      }
    }
  }

  Future<void> _loadTrending() async {
    isLoadingTrending.value = true;
    trending.value = await getTrendingMovies();
    isLoadingTrending.value = false;
  }

  Future<void> _loadNowPlaying({bool loadMore = false}) async {
    if (loadMore) {
      if (!hasMoreNowPlaying.value || isLoadingMoreNowPlaying.value) return;
      isLoadingMoreNowPlaying.value = true;
      final next = nowPlayingPage.value + 1;
      final fetched = await getNowPlaying(page: next);
      if (fetched.isNotEmpty) {
        nowPlayingPage.value = next;
        nowPlaying.addAll(
          fetched.where((m) => !nowPlaying.any((e) => e.id == m.id)),
        );
      } else {
        hasMoreNowPlaying.value = false;
      }
      isLoadingMoreNowPlaying.value = false;
    } else {
      isLoadingNowPlaying.value = true;
      nowPlayingPage.value = 1;
      hasMoreNowPlaying.value = true;
      final fetched = await getNowPlaying(page: 1);
      nowPlaying.assignAll(fetched);
      isLoadingNowPlaying.value = false;
    }
  }

  void loadMoreNowPlaying() => _loadNowPlaying(loadMore: true);

  Future<void> _loadUpcoming({bool loadMore = false}) async {
    if (loadMore) {
      if (!hasMoreUpcoming.value || isLoadingMoreUpcoming.value) return;
      isLoadingMoreUpcoming.value = true;
      final next = upcomingPage.value + 1;
      final fetched = await getUpcoming(page: next);
      if (fetched.isNotEmpty) {
        upcomingPage.value = next;
        upcoming.addAll(
          fetched.where((m) => !upcoming.any((e) => e.id == m.id)),
        );
      } else {
        hasMoreUpcoming.value = false;
      }
      isLoadingMoreUpcoming.value = false;
    } else {
      isLoadingUpcoming.value = true;
      upcomingPage.value = 1;
      hasMoreUpcoming.value = true;
      final fetched = await getUpcoming(page: 1);
      upcoming.assignAll(fetched);
      isLoadingUpcoming.value = false;
    }
  }

  void loadMoreUpcoming() => _loadUpcoming(loadMore: true);

  Future<void> _loadTopRated({bool loadMore = false}) async {
    if (loadMore) {
      if (!hasMoreTopRated.value || isLoadingMoreTopRated.value) return;
      isLoadingMoreTopRated.value = true;
      final next = topRatedPage.value + 1;
      final fetched = await getTopRated(page: next);
      if (fetched.isNotEmpty) {
        topRatedPage.value = next;
        topRated.addAll(
          fetched.where((m) => !topRated.any((e) => e.id == m.id)),
        );
      } else {
        hasMoreTopRated.value = false;
      }
      isLoadingMoreTopRated.value = false;
    } else {
      isLoadingTopRated.value = true;
      topRatedPage.value = 1;
      hasMoreTopRated.value = true;
      final fetched = await getTopRated(page: 1);
      topRated.assignAll(fetched);
      isLoadingTopRated.value = false;
    }
  }

  void loadMoreTopRated() => _loadTopRated(loadMore: true);

  Future<void> _loadPopular({bool loadMore = false}) async {
    if (loadMore) {
      if (!hasMorePopular.value || isLoadingMorePopular.value) return;
      isLoadingMorePopular.value = true;
      final next = popularPage.value + 1;
      final fetched = await getPopular(page: next);
      if (fetched.isNotEmpty) {
        popularPage.value = next;
        popular.addAll(fetched.where((m) => !popular.any((e) => e.id == m.id)));
      } else {
        hasMorePopular.value = false;
      }
      isLoadingMorePopular.value = false;
    } else {
      isLoadingPopular.value = true;
      popularPage.value = 1;
      hasMorePopular.value = true;
      final fetched = await getPopular(page: 1);
      popular.assignAll(fetched);
      isLoadingPopular.value = false;
    }
  }

  void loadMorePopular() => _loadPopular(loadMore: true);

  Future<void> onSearch(String query) async {
    if (query.trim().isEmpty) return;
    isSearching.value = true;
    searchResults.value = await searchMovies(query);
    isSearching.value = false;
    Get.offAllNamed(Routes.SEARCH, arguments: query);
    changeTabIndex(1);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
