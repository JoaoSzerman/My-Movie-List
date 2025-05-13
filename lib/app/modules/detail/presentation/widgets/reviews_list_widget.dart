import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie_list/app/core/theme/app_colors.dart';

import '../../../../core/constants/constants.dart';
import '../../domain/domain.dart';

class ReviewsListWidget extends StatelessWidget {
  final RxList<ReviewEntity> reviews;
  final RxBool isLoading;

  const ReviewsListWidget({
    super.key,
    required this.reviews,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          if (isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (reviews.isEmpty) {
            return Text(
              AppConstants.NO_REVIEW,
              style: const TextStyle(color: Colors.white),
            );
          }
          return Column(
            children:
                reviews.map((r) {
                  final hasRating = r.rating != null;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                              hasRating
                                  ? MainAxisAlignment.spaceBetween
                                  : MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.person_pin_rounded,
                                  color: AppColors.stroke,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  r.author,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            if (hasRating)
                              Row(
                                children: [
                                  Text(
                                    r.rating!.toStringAsFixed(1),
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Colors.amber,
                                  ),
                                ],
                              ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          r.content,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          );
        }),
      ],
    );
  }
}
