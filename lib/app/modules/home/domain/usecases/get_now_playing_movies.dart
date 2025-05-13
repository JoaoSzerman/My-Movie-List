import '../../../../core/core.dart';
import '../domain.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<List<MovieEntity>> call({int page = 1}) async {
    return await repository.getNowPlaying(page: page);
  }
}
