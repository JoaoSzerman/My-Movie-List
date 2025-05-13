import '../domain.dart';

class GetMovieCredits {
  final DetailRepository repository;
  GetMovieCredits(this.repository);

  Future<List<CastEntity>> call(int movieId) =>
      repository.getMovieCredits(movieId);
}
