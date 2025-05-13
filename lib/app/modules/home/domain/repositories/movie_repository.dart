import '../../../../core/core.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getTrendingMovies();
  Future<List<MovieEntity>> getNowPlaying({int page = 1});
  Future<List<MovieEntity>> getUpcoming({int page = 1});
  Future<List<MovieEntity>> getTopRated({int page = 1});
  Future<List<MovieEntity>> getPopular({int page = 1});
}
