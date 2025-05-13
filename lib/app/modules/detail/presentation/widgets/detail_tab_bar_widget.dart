import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class DetailTabBarWidget extends StatelessWidget {
  const DetailTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey[400],
      indicatorColor: AppColors.stroke,
      dividerColor: Colors.transparent,
      tabs: const [
        Tab(text: AppConstants.ABOUT),
        Tab(text: AppConstants.REVIEW),
        Tab(text: AppConstants.CAST),
      ],
    );
  }
}
