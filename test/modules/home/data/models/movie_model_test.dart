import 'package:flutter_test/flutter_test.dart';
import 'package:my_movie_list/app/core/core.dart'; // expõe MovieModel

void main() {
  group('MovieModel.fromJson', () {
    test('deve converter corretamente um JSON completo', () {
      final json = {
        'id': 42,
        'title': 'Teste',
        'overview': 'Descrição',
        'poster_path': '/path.jpg',
        'backdrop_path': '/backdrop.jpg',
        'vote_average': 9.1,
        'release_date': '2022-08-15',
        'genre_ids': [12, 34],
        'genres': [
          {'name': 'Ação'},
          {'name': 'Drama'},
        ],
        'runtime': 123,
      };

      final model = MovieModel.fromJson(json);

      expect(model.id, 42);
      expect(model.title, 'Teste');
      expect(model.overview, 'Descrição');
      expect(model.posterPath, 'https://image.tmdb.org/t/p/w500/path.jpg');
      expect(
        model.backdropPath,
        'https://image.tmdb.org/t/p/original/backdrop.jpg',
      );
      expect(model.voteAverage, 9.1);
      expect(model.releaseDate, DateTime(2022, 8, 15));
      expect(model.genreIds, [12, 34]);
      expect(model.genreNames, ['Ação', 'Drama']);
      expect(model.runtime, 123);
    });
  });
}
