import 'package:get/get.dart';

import '../modules/detail/bindings/detail_binding.dart';
import '../modules/detail/presentation/views/detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/presentation/views/home_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/presentation/views/search_view.dart';
import '../modules/watchlist/bindings/watchlist_binding.dart';
import '../modules/watchlist/views/watchlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.WATCHLIST,
      page: () => const WatchlistView(),
      binding: WatchlistBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
  ];
}
