import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class InitialSearchWidget extends StatelessWidget {
  const InitialSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search, size: 80, color: AppColors.hintText),
          const SizedBox(height: 24),
          Text(
            AppConstants.FIND_MOVIE,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: AppColors.hintText),
          ),
          const SizedBox(height: 8),
          Text(
            AppConstants.FIND_MOVIE_SMALL,
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
