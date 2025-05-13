import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../controllers/watchlist_controller.dart';

class WatchlistView extends GetView<WatchlistController> {
  const WatchlistView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: AppConstants.WATCHLIST,
        centerTitle: false,
        showBackButton: false,
      ),
      backgroundColor: AppColors.primary,
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppConstants.MAINTENANCE,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(width: 8),
            Icon(Icons.warning, color: Colors.amber),
          ],
        ),
      ),

      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
    );
  }
}
