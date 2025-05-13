import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_movie_list/app/core/core.dart';
import 'package:my_movie_list/app/modules/search/presentation/widgets/search_result_card.dart';
import 'package:my_movie_list/app/routes/app_pages.dart';

void main() {
  testWidgets('SearchResultCard mostra título, nota e ano', (tester) async {
    final entity = MovieEntity(
      id: 10,
      title: 'Titulo X',
      overview: '',
      posterPath: 'https://img.test/x.jpg',
      backdropPath: '',
      voteAverage: 7.8,
      releaseDate: DateTime(2021, 6, 5),
    );

    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: '/',
        getPages: AppPages.routes,
        home: Scaffold(body: SearchResultCard(entity: entity)),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Titulo X'), findsOneWidget);
    expect(find.text('7.8'), findsOneWidget);
    expect(find.text('• 2021'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });
}
