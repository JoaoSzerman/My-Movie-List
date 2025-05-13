import '../../../../core/core.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_remote_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDatasource remote;
  MovieRepositoryImpl(this.remote);

  @override
  Future<List<MovieEntity>> getTrendingMovies() {
    return remote.trendingMovies();
  }

  @override
  Future<List<MovieEntity>> getNowPlaying({int page = 1}) {
    return remote.getNowPlaying(page: page);
  }

  @override
  Future<List<MovieEntity>> getUpcoming({int page = 1}) {
    return remote.getUpcoming(page: page);
  }

  @override
  Future<List<MovieEntity>> getTopRated({int page = 1}) {
    return remote.getTopRated(page: page);
  }

  @override
  Future<List<MovieEntity>> getPopular({int page = 1}) {
    return remote.getPopular(page: page);
  }
}
