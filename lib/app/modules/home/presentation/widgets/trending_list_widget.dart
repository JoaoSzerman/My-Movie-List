import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../../../core/core.dart';
import '../../controllers/home_controller.dart';

class TrendingListWidget extends StatelessWidget {
  final HomeController controller;
  const TrendingListWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width * 0.45,
      child: Obx(() {
        if (controller.isLoadingTrending.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          padding: const EdgeInsets.only(left: 16, top: 5),
          scrollDirection: Axis.horizontal,
          itemCount: controller.trending.length,
          separatorBuilder: (_, __) => const SizedBox(width: 20),
          itemBuilder: (_, i) {
            final movie = controller.trending[i];
            return SizedBox(
              width: 120,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  MovieCardWidget(entity: movie, large: true),
                  Positioned(
                    bottom: -5,
                    left: -16,
                    child: SizedBox(
                      width: Get.width * 0.25,
                      height: Get.width * 0.15,
                      child: StrokeText(
                        text: '${i + 1}',
                        textStyle: const TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        strokeColor: AppColors.stroke,
                        strokeWidth: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
