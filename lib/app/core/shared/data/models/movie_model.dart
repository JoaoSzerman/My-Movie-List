import '../../../core.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.voteAverage,
    super.releaseDate,
    super.genreIds,
    super.genreNames,
    super.runtime,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    DateTime? parsedDate;
    final release = json['release_date'] as String?;
    if (release != null && release.isNotEmpty) {
      parsedDate = DateTime.tryParse(release);
    }

    final rawIds = json['genre_ids'] as List<dynamic>?;
    final genreIds = rawIds != null ? List<int>.from(rawIds) : <int>[];

    final rawGenres = json['genres'] as List<dynamic>?;
    final genreNames =
        rawGenres != null
            ? rawGenres
                .map((g) => (g as Map<String, dynamic>)['name'] as String)
                .toList()
            : <String>[];

    return MovieModel(
      id: json['id'] as int,
      title: (json['title'] as String?) ?? (json['name'] as String?) ?? '',
      overview: (json['overview'] as String?) ?? '',
      posterPath:
          json['poster_path'] != null
              ? '${ApiConstants.POSTER_PATH}${json['poster_path']}'
              : '',
      backdropPath:
          json['backdrop_path'] != null
              ? '${ApiConstants.BACKDROP_PATH}${json['backdrop_path']}'
              : '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      releaseDate: parsedDate,
      genreIds: genreIds,
      genreNames: genreNames,
      runtime: json['runtime'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'overview': overview,
    'poster_path': posterPath,
    'backdrop_path': backdropPath,
    'vote_average': voteAverage,
    'release_date': releaseDate?.toIso8601String(),
    'genre_ids': genreIds,
    'genres':
        genreNames.map((name) => <String, dynamic>{'name': name}).toList(),
    'runtime': runtime,
  };
}
