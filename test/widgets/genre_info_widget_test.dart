import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:my_movie_list/app/modules/detail/presentation/widgets/genre_info_widget.dart';

void main() {
  testWidgets('GenreInfoWidget exibe ano, duração e gêneros', (tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: GenreInfoWidget(
            genres: ['Ação', 'Comédia'],
            releaseDate: DateTime(2022, 12, 1),
            runtime: 95,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('2022'), findsOneWidget);
    expect(find.text('95 min'), findsOneWidget);
    expect(find.text('Ação'), findsOneWidget);
    expect(find.text('Comédia'), findsOneWidget);

    expect(find.byIcon(Icons.calendar_today_rounded), findsOneWidget);
    expect(find.byIcon(Icons.access_time), findsOneWidget);
    expect(find.byIcon(Icons.local_movies_outlined), findsNWidgets(2));
  });
}
