import 'package:flutter/material.dart';

class OverviewWidget extends StatelessWidget {
  final String overview;
  const OverviewWidget({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          overview,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
