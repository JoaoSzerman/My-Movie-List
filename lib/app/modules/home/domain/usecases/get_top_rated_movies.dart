import '../../../../core/core.dart';
import '../domain.dart';

class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<List<MovieEntity>> call({int page = 1}) async {
    return await repository.getTopRated(page: page);
  }
}
