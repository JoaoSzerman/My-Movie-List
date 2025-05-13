import '../../../../core/core.dart';
import '../domain.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<List<MovieEntity>> call({int page = 1}) async {
    return await repository.getPopular(page: page);
  }
}
