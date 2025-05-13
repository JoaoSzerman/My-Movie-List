import 'package:my_movie_list/app/core/constants/api_constants.dart';

import '../../domain/domain.dart';

class MovieDetailModel extends MovieDetailEntity {
  MovieDetailModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.voteAverage,
    super.releaseDate,
    super.runtime,
    super.genres,
    super.tagline,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    final genres =
        (json['genres'] as List<dynamic>?)
            ?.map(
              (g) => GenreEntity(id: g['id'] as int, name: g['name'] as String),
            )
            .toList() ??
        [];

    DateTime? parsedDate;
    final dateStr = json['release_date'] as String?;
    if (dateStr != null && dateStr.isNotEmpty) {
      parsedDate = DateTime.tryParse(dateStr);
    }

    return MovieDetailModel(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String? ?? '',
      posterPath:
          json['poster_path'] != null
              ? '${ApiConstants.POSTER_PATH}${json['poster_path']}'
              : '',
      backdropPath:
          json['backdrop_path'] != null
              ? '${ApiConstants.BACKDROP_PATH}${json['backdrop_path']}'
              : '',
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: parsedDate,
      runtime: json['runtime'] as int?,
      genres: genres,
      tagline: json['tagline'] as String?,
    );
  }
}
