import 'package:dio/dio.dart';

import '../../../constants/constants.dart';
import '../models/movie_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<MovieModel>> searchMovies(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio client;

  SearchRemoteDataSourceImpl(this.client);

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final resp = await client.get(
      ApiConstants.SEARCH_MOVIE,
      queryParameters: {'query': query},
    );
    return (resp.data['results'] as List<dynamic>)
        .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
