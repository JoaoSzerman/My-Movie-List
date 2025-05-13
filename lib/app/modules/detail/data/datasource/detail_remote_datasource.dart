import 'package:dio/dio.dart';
import 'package:my_movie_list/app/core/constants/api_constants.dart';

import '../data.dart';

abstract class MovieDetailRemoteDataSource {
  Future<MovieDetailModel> getMovieDetail(int movieId);
  Future<List<ReviewModel>> getMovieReviews(int movieId, {int page});
  Future<List<CastModel>> getMovieCredits(int movieId);
}

class MovieDetailRemoteDataSourceImpl implements MovieDetailRemoteDataSource {
  final Dio client;
  MovieDetailRemoteDataSourceImpl(this.client);

  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final res = await client.get(
      '${ApiConstants.MOVIE}/$movieId',
      queryParameters: {'language': 'en-US'},
    );
    return MovieDetailModel.fromJson(res.data as Map<String, dynamic>);
  }

  @override
  Future<List<ReviewModel>> getMovieReviews(int movieId, {int page = 1}) async {
    final res = await client.get(
      '${ApiConstants.MOVIE}/$movieId/${ApiConstants.REVIEWS}',
      queryParameters: {'language': 'en-US', 'page': page},
    );
    final list =
        (res.data['results'] as List)
            .cast<Map<String, dynamic>>()
            .map((m) => ReviewModel.fromJson(m))
            .toList();
    return list;
  }

  @override
  Future<List<CastModel>> getMovieCredits(int movieId) async {
    final res = await client.get(
      '${ApiConstants.MOVIE}/$movieId/${ApiConstants.CREDITS}',
      queryParameters: {'language': 'en-US'},
    );
    final list =
        (res.data['cast'] as List)
            .cast<Map<String, dynamic>>()
            .map((c) => CastModel.fromJson(c))
            .toList();
    return list;
  }
}
