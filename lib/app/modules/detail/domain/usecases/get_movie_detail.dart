import '../domain.dart';

class GetMovieDetail {
  final DetailRepository repo;
  GetMovieDetail(this.repo);
  Future<MovieDetailEntity> call(int id) => repo.getMovieDetail(id);
}
