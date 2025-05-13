import '../entities/movie_entity.dart';

abstract class SearchRepository {
  Future<List<MovieEntity>> searchMovies(String query);
}
