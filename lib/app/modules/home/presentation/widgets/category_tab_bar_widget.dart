import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../controllers/home_controller.dart';

class CategoryTabBarWidget extends StatelessWidget {
  final HomeController controller;
  const CategoryTabBarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller.tabController,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey[400],
      indicatorColor: AppColors.stroke,
      dividerColor: Colors.transparent,
      tabs: const [
        Tab(text: AppConstants.NOW_PLAYING),
        Tab(text: AppConstants.UPCOMING),
        Tab(text: AppConstants.TOP_RATED),
        Tab(text: AppConstants.POPULAR),
      ],
    );
  }
}
