import '../entities/movie_entity.dart';
import '../repositories/search_repository.dart';

class SearchMovies {
  final SearchRepository repository;
  SearchMovies(this.repository);

  Future<List<MovieEntity>> call(String query) {
    return repository.searchMovies(query);
  }
}
