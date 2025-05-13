import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';
import '../../controllers/search_controller.dart' as ctrler;
import '../widgets/widgets.dart';

class SearchView extends GetView<ctrler.SearchController> {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: const AppBarWidget(
        title: AppConstants.SEARCH,
        centerTitle: false,
        showBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            SearchBarWidget(
              controller: controller,
              textController: TextEditingController(
                text: controller.query.value,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                final q = controller.query.value;
                final loading = controller.isLoading.value;
                final results = controller.results;

                if (q.isEmpty) {
                  return const InitialSearchWidget();
                }

                if (loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (results.isEmpty) {
                  return const NoResultsWidget();
                }

                return ListView.separated(
                  itemCount: results.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, i) => SearchResultCard(entity: results[i]),
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),
    );
  }
}
