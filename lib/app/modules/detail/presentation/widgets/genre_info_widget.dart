import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/core.dart';

class GenreInfoWidget extends StatelessWidget {
  final List<String> genres;
  final DateTime? releaseDate;
  final int? runtime;

  const GenreInfoWidget({
    super.key,
    required this.genres,
    this.releaseDate,
    this.runtime,
  });

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.info, size: 15),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: AppColors.info, fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final year = releaseDate?.year.toString() ?? '';
    final duration = runtime != null ? '$runtime min' : '';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width * 0.7,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 12,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  _buildInfoItem(Icons.calendar_today_rounded, year),
                  _buildInfoItem(Icons.access_time, duration),
                  for (var genre in genres)
                    _buildInfoItem(Icons.local_movies_outlined, genre),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
