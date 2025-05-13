import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../core.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  const AppBottomNav({super.key, required this.currentIndex});

  void _onTap(int idx) {
    switch (idx) {
      case 0:
        if (Get.currentRoute != Routes.HOME) Get.offAllNamed(Routes.HOME);
        break;
      case 1:
        if (Get.currentRoute != Routes.SEARCH) {
          Get.offAllNamed(Routes.SEARCH);
        }
        break;
      case 2:
        if (Get.currentRoute != Routes.WATCHLIST) {
          Get.offAllNamed(Routes.WATCHLIST);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.primary,
      selectedItemColor: AppColors.stroke,
      unselectedItemColor: AppColors.hintText,
      currentIndex: currentIndex,
      onTap: _onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppConstants.HOME,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: AppConstants.SEARCH,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: AppConstants.WATCHLIST,
        ),
      ],
    );
  }
}
