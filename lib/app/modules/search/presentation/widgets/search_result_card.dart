import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../../../routes/app_pages.dart';

class SearchResultCard extends StatelessWidget {
  final MovieEntity entity;
  const SearchResultCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final year =
        entity.releaseDate != null ? entity.releaseDate!.year.toString() : '';
    final rating = entity.voteAverage.toStringAsFixed(1);
    final hasImage = entity.posterPath.isNotEmpty;

    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL, arguments: entity.id),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:
                hasImage
                    ? CachedNetworkImage(
                      imageUrl: entity.posterPath,
                      width: Get.width * 0.2,
                      height: Get.width * 0.3,
                      fit: BoxFit.cover,
                      placeholder:
                          (_, __) => Container(
                            width: Get.width * 0.2,
                            height: Get.width * 0.3,
                            color: Colors.grey[800],
                          ),
                      errorWidget:
                          (_, __, ___) => Container(
                            width: Get.width * 0.2,
                            height: Get.width * 0.3,
                            color: Colors.grey[800],
                            child: const Icon(Icons.error, color: Colors.red),
                          ),
                    )
                    : Container(
                      width: Get.width * 0.2,
                      height: Get.width * 0.3,
                      color: Colors.grey[800],
                      child: const Icon(Icons.movie, color: Colors.white30),
                    ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            height: 120,
            width: Get.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entity.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(rating, style: const TextStyle(color: Colors.amber)),
                  ],
                ),
                const SizedBox(height: 4),
                Text("• $year", style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
