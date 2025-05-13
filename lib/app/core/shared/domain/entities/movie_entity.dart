class MovieEntity {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final DateTime? releaseDate;
  final List<int> genreIds;
  final List<String> genreNames;
  final int? runtime;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    this.releaseDate,
    this.genreIds = const [],
    this.genreNames = const [],
    this.runtime,
  });
}
