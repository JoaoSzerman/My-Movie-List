import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.mood_bad, size: 80, color: AppColors.hintText),
          const SizedBox(height: 24),
          Text(
            AppConstants.MOVIE_NOT_FOUND,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: AppColors.hintText),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            AppConstants.MOVIE_NOT_FOUND_SMALL,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.hintText),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
