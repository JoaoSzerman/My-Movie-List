import 'package:flutter_test/flutter_test.dart';
import 'package:my_movie_list/app/core/core.dart';
import 'package:my_movie_list/app/modules/search/controllers/search_controller.dart';

class FakeSearchMovies implements SearchMovies {
  @override
  Future<List<MovieEntity>> call(String query) async {
    return [
      MovieEntity(
        id: 99,
        title: 'Fake Movie',
        overview: 'Fake',
        posterPath: 'http://fake.jpg',
        backdropPath: '',
        voteAverage: 8.5,
        releaseDate: DateTime(2020, 1, 1),
      ),
    ];
  }

  @override
  // TODO: implement repository
  SearchRepository get repository => throw UnimplementedError();
}

void main() {
  late SearchController controller;

  setUp(() {
    controller = SearchController(searchMovies: FakeSearchMovies());
  });

  test('quando query é vazia, limpa resultados e não dispara busca', () async {
    controller.results.value = [
      MovieEntity(
        id: 1,
        title: 'X',
        overview: '',
        posterPath: '',
        backdropPath: '',
        voteAverage: 0.0,
        releaseDate: null,
      ),
    ];

    await controller.onSearch(''); // método real
    expect(controller.query.value, '');
    expect(controller.results, isEmpty);
    expect(controller.isLoading.value, isFalse);
  });

  test(
    'quando query não é vazia, popula results e reconhece loading',
    () async {
      await controller.onSearch('abc');
      expect(controller.query.value, 'abc');
      expect(controller.results, hasLength(1));
      expect(controller.results.first.title, 'Fake Movie');
      expect(controller.isLoading.value, isFalse);
    },
  );
}
