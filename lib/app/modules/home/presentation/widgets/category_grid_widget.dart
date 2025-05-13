import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';

class CategoryGridWidget extends StatelessWidget {
  final RxList<MovieEntity> movies;
  final RxBool isLoading;
  final VoidCallback onLoadMore;

  const CategoryGridWidget({
    super.key,
    required this.movies,
    required this.isLoading,
    required this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (isLoading.value && movies.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return NotificationListener<ScrollNotification>(
        onNotification: (notif) {
          if (!isLoading.value &&
              notif.metrics.pixels >= notif.metrics.maxScrollExtent - 200) {
            onLoadMore();
          }
          return false;
        },
        child: GridView.builder(
          padding: const EdgeInsets.only(right: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            childAspectRatio: 100 / 140,
          ),
          itemCount: movies.length,
          itemBuilder: (_, i) => MovieCardWidget(entity: movies[i]),
        ),
      );
    });
  }
}
