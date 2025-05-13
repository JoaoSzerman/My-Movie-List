import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../controllers/detail_controller.dart';
import '../widgets/widgets.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: const AppBarWidget(
        title: AppConstants.DETAIL,
        centerTitle: true,
        showBackButton: true,
      ),
      body: Obx(() {
        if (controller.isLoadingMovie.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final movie = controller.movie.value!;
        return DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieHeaderWidget(movie: movie),
              const SizedBox(height: 16),
              GenreInfoWidget(
                genres: movie.genres.map((g) => g.name).toList(),
                releaseDate: movie.releaseDate,
                runtime: movie.runtime,
              ),
              const SizedBox(height: 16),
              DetailTabBarWidget(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: TabBarView(
                    children: [
                      // ─── About Movie ───────────────────────────────────
                      SingleChildScrollView(
                        child: OverviewWidget(overview: movie.overview),
                      ),
                      // ─── Reviews ────────────────────────────────────────
                      SingleChildScrollView(
                        child: ReviewsListWidget(
                          reviews: controller.reviews,
                          isLoading: controller.isLoadingReviews,
                        ),
                      ),
                      // ─── Cast ───────────────────────────────────────────
                      SingleChildScrollView(
                        child: CastListWidget(
                          cast: controller.credits,
                          isLoading: controller.isLoadingCredits,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
