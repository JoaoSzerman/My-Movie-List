import '../../../../core/core.dart';
import '../domain.dart';

class GetTrendingMovies {
  final MovieRepository repository;
  GetTrendingMovies(this.repository);

  Future<List<MovieEntity>> call() {
    return repository.getTrendingMovies();
  }
}
