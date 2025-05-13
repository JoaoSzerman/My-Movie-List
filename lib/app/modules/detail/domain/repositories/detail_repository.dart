import '../domain.dart';

abstract class DetailRepository {
  Future<MovieDetailEntity> getMovieDetail(int movieId);
  Future<List<ReviewEntity>> getMovieReviews(int movieId, {int page});
  Future<List<CastEntity>> getMovieCredits(int movieId);
}
