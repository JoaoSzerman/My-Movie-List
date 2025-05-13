import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/search_remote_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<List<MovieEntity>> searchMovies(String query) =>
      datasource.searchMovies(query);
}
