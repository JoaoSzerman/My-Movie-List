import 'genre_entity.dart';

class MovieDetailEntity {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final DateTime? releaseDate;
  final int? runtime;
  final List<GenreEntity> genres;
  final String? tagline;

  MovieDetailEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    this.releaseDate,
    this.runtime,
    this.genres = const [],
    this.tagline,
  });
}
