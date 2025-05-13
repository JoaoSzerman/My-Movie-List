import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../core.dart';

class MovieCardWidget extends StatelessWidget {
  final MovieEntity entity;
  final bool large;

  const MovieCardWidget({super.key, required this.entity, this.large = false});

  @override
  Widget build(BuildContext context) {
    final width = large ? 120.0 : 100.0;
    final imageHeight = large ? 160.0 : 140.0;

    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL, arguments: entity.id),
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: entity.posterPath,
                width: width,
                height: imageHeight,
                fit: BoxFit.cover,
                placeholder:
                    (_, __) => SizedBox(
                      width: width,
                      height: imageHeight,
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                errorWidget:
                    (_, __, ___) => Container(
                      width: width,
                      height: imageHeight,
                      color: Colors.grey[800],
                      child: const Icon(Icons.error, color: Colors.red),
                    ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
