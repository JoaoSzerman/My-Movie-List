import 'package:dio/dio.dart';

import '../../../../core/core.dart';

abstract class MovieRemoteDatasource {
  Future<List<MovieModel>> trendingMovies();
  Future<MovieModel> fetchMovieDetails(int id);

  Future<List<MovieModel>> getNowPlaying({required int page});
  Future<List<MovieModel>> getUpcoming({required int page});
  Future<List<MovieModel>> getTopRated({required int page});
  Future<List<MovieModel>> getPopular({required int page});
}

class MovieRemoteDatasourceImpl implements MovieRemoteDatasource {
  final Dio client;
  MovieRemoteDatasourceImpl(this.client);

  @override
  Future<List<MovieModel>> trendingMovies() async {
    final resp = await client.get(
      '${ApiConstants.TRENDING}${ApiConstants.MOVIE}${ApiConstants.DAY}',
      queryParameters: {'language': 'en-US'},
    );
    return (resp.data['results'] as List<dynamic>)
        .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
        .take(10)
        .toList();
  }

  @override
  Future<MovieModel> fetchMovieDetails(int id) async {
    final resp = await client.get('${ApiConstants.MOVIE}/$id');
    return MovieModel.fromJson(resp.data as Map<String, dynamic>);
  }

  @override
  Future<List<MovieModel>> getNowPlaying({required int page}) async {
    final resp = await client.get(
      '${ApiConstants.MOVIE}${ApiConstants.NOW_PLAYING}',
      queryParameters: {'language': 'en-US', 'page': page},
    );
    return (resp.data['results'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<MovieModel>> getUpcoming({required int page}) async {
    final resp = await client.get(
      '${ApiConstants.MOVIE}${ApiConstants.UPCOMING}',
      queryParameters: {'language': 'en-US', 'page': page},
    );
    return (resp.data['results'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<MovieModel>> getTopRated({required int page}) async {
    final resp = await client.get(
      '${ApiConstants.MOVIE}${ApiConstants.TOP_RATED}',
      queryParameters: {'language': 'en-US', 'page': page},
    );
    return (resp.data['results'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<MovieModel>> getPopular({required int page}) async {
    final resp = await client.get(
      '${ApiConstants.MOVIE}${ApiConstants.POPULAR}',
      queryParameters: {'language': 'en-US', 'page': page},
    );
    return (resp.data['results'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList();
  }
}
