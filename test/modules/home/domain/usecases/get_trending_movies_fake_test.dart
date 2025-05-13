import 'package:flutter_test/flutter_test.dart';
import 'package:my_movie_list/app/core/core.dart';
import 'package:my_movie_list/app/modules/home/domain/repositories/movie_repository.dart';
import 'package:my_movie_list/app/modules/home/domain/usecases/get_trending_movies.dart';

class FakeMovieRepository implements MovieRepository {
  @override
  Future<List<MovieEntity>> getTrendingMovies() async {
    return [
      MovieEntity(
        id: 123,
        title: 'Trend',
        overview: 'desc',
        posterPath: '/p.jpg',
        backdropPath: '/b.jpg',
        voteAverage: 6.6,
        releaseDate: DateTime(2021, 5, 5),
      ),
    ];
  }

  @override
  Future<List<MovieEntity>> getNowPlaying({int page = 1}) =>
      throw UnimplementedError();
  @override
  Future<List<MovieEntity>> getUpcoming({int page = 1}) =>
      throw UnimplementedError();
  @override
  Future<List<MovieEntity>> getTopRated({int page = 1}) =>
      throw UnimplementedError();
  @override
  Future<List<MovieEntity>> getPopular({int page = 1}) =>
      throw UnimplementedError();
}

void main() {
  late GetTrendingMovies usecase;

  setUp(() {
    usecase = GetTrendingMovies(FakeMovieRepository());
  });

  test('GetTrendingMovies retorna exatamente o que o repositório dá', () async {
    final result = await usecase();
    expect(result, isA<List<MovieEntity>>());
    expect(result.first.id, 123);
    expect(result.first.title, 'Trend');
  });
}
