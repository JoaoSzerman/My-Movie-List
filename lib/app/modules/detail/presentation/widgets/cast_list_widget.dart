import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie_list/app/core/constants/app_constants.dart';

import '../../domain/domain.dart';

class CastListWidget extends StatelessWidget {
  final RxList<CastEntity> cast;
  final RxBool isLoading;

  const CastListWidget({
    super.key,
    required this.cast,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Obx(() {
          if (isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (cast.isEmpty) {
            return const Text(
              AppConstants.NO_CAST,
              style: TextStyle(color: Colors.white),
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
            ),
            itemCount: cast.length,
            itemBuilder: (_, i) {
              final c = cast[i];
              final hasImage =
                  c.profilePath != null && c.profilePath!.isNotEmpty;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child:
                        hasImage
                            ? CachedNetworkImage(
                              imageUrl: c.profilePath!,
                              width: Get.width * 0.2,
                              height: Get.width * 0.2,
                              fit: BoxFit.cover,
                              placeholder:
                                  (_, __) => Container(
                                    width: Get.width * 0.2,
                                    height: Get.width * 0.2,
                                    color: Colors.grey[800],
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  ),
                              errorWidget:
                                  (_, __, ___) => Container(
                                    width: Get.width * 0.2,
                                    height: Get.width * 0.2,
                                    color: Colors.grey,
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white30,
                                    ),
                                  ),
                            )
                            : Container(
                              width: Get.width * 0.2,
                              height: Get.width * 0.2,
                              color: Colors.grey,
                              child: const Icon(
                                Icons.person,
                                color: Colors.white30,
                              ),
                            ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    c.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: Colors.white),
                  ),
                ],
              );
            },
          );
        }),
      ],
    );
  }
}
