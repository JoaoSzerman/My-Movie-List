import '../../domain/domain.dart';
import '../data.dart';

class DetailRepositoryImpl implements DetailRepository {
  final MovieDetailRemoteDataSource remote;
  DetailRepositoryImpl(this.remote);

  @override
  Future<MovieDetailEntity> getMovieDetail(int movieId) =>
      remote.getMovieDetail(movieId);

  @override
  Future<List<ReviewEntity>> getMovieReviews(int movieId, {int page = 1}) =>
      remote.getMovieReviews(movieId, page: page);

  @override
  Future<List<CastEntity>> getMovieCredits(int movieId) =>
      remote.getMovieCredits(movieId);
}
