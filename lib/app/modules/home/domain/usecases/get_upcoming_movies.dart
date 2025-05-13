import '../../../../core/core.dart';
import '../domain.dart';

class GetUpcomingMovies {
  final MovieRepository repository;

  GetUpcomingMovies(this.repository);

  Future<List<MovieEntity>> call({int page = 1}) async {
    return await repository.getUpcoming(page: page);
  }
}
