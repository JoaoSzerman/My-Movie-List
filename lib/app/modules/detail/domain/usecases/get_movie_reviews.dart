import '../domain.dart';

class GetMovieReviews {
  final DetailRepository repository;
  GetMovieReviews(this.repository);

  Future<List<ReviewEntity>> call(int movieId, {int page = 1}) =>
      repository.getMovieReviews(movieId, page: page);
}
