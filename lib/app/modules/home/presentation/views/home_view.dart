import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../controllers/home_controller.dart';
import '../widgets/widgets.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: const AppBarWidget(
        title: AppConstants.WHAT_WATCH,
        centerTitle: false,
        showBackButton: false,
      ),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(controller: controller),
              const SizedBox(height: 20),
              Text(
                AppConstants.TRENDING,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.copyWith(color: Colors.white),
              ),
              TrendingListWidget(controller: controller),
              const SizedBox(height: 24),
              CategoryTabBarWidget(controller: controller),
              const SizedBox(height: 12),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    // Now Playing
                    CategoryGridWidget(
                      movies: controller.nowPlaying,
                      isLoading: controller.isLoadingNowPlaying,
                      onLoadMore: controller.loadMoreNowPlaying,
                    ),
                    // Upcoming
                    CategoryGridWidget(
                      movies: controller.upcoming,
                      isLoading: controller.isLoadingUpcoming,
                      onLoadMore: controller.loadMoreUpcoming,
                    ),
                    // Top Rated
                    CategoryGridWidget(
                      movies: controller.topRated,
                      isLoading: controller.isLoadingTopRated,
                      onLoadMore: controller.loadMoreTopRated,
                    ),
                    // Popular
                    CategoryGridWidget(
                      movies: controller.popular,
                      isLoading: controller.isLoadingPopular,
                      onLoadMore: controller.loadMorePopular,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }
}
