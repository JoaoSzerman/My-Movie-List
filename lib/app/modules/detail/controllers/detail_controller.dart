import 'package:get/get.dart';

import '../domain/domain.dart';

class DetailController extends GetxController {
  final GetMovieDetail getMovieDetail;
  final GetMovieReviews getMovieReviews;
  final GetMovieCredits getMovieCredits;

  DetailController({
    required this.getMovieDetail,
    required this.getMovieReviews,
    required this.getMovieCredits,
  });

  final movie = Rxn<MovieDetailEntity>();
  final reviews = <ReviewEntity>[].obs;
  final credits = <CastEntity>[].obs;

  final isLoadingMovie = false.obs;
  final isLoadingReviews = false.obs;
  final isLoadingCredits = false.obs;

  late final int movieId;

  @override
  void onInit() {
    super.onInit();
    movieId = Get.arguments as int;

    _fetchDetail();
    _fetchCredits();
    _fetchReviews();
  }

  Future<void> _fetchDetail() async {
    isLoadingMovie.value = true;
    movie.value = await getMovieDetail(movieId);
    isLoadingMovie.value = false;
  }

  Future<void> _fetchCredits() async {
    isLoadingCredits.value = true;
    credits.assignAll(await getMovieCredits(movieId));
    isLoadingCredits.value = false;
  }

  Future<void> _fetchReviews() async {
    isLoadingReviews.value = true;
    reviews.assignAll(await getMovieReviews(movieId));
    isLoadingReviews.value = false;
  }
}
