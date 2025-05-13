import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/constants.dart';
import '../../domain/domain.dart';

class MovieHeaderWidget extends StatelessWidget {
  final MovieDetailEntity movie;
  const MovieHeaderWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var bannerHeight = Get.width * 0.55;
    var posterWidth = Get.width * 0.25;
    var posterHeight = Get.width * 0.4;
    final overlap = posterHeight / 2;

    final backdropUrl =
        '${ApiConstants.BACKDROP_PATH_780}${movie.backdropPath}';
    final posterUrl = '${ApiConstants.POSTER_PATH}${movie.posterPath}';

    return SizedBox(
      height: bannerHeight + overlap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: bannerHeight,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: backdropUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(color: Colors.black12),
              errorWidget: (_, __, ___) => Container(color: Colors.black26),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: bannerHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  stops: [0.5, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            top: bannerHeight - overlap,
            left: 16,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: posterUrl,
                    width: posterWidth,
                    height: posterHeight,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => Container(color: Colors.black12),
                    errorWidget:
                        (_, __, ___) => Container(color: Colors.black26),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  height: overlap,
                  width: Get.width * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star_border,
                            size: 20,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            movie.voteAverage.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        movie.title,
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge!.copyWith(color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
