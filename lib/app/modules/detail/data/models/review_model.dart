import '../../domain/domain.dart';

class ReviewModel extends ReviewEntity {
  ReviewModel({
    required super.id,
    required super.author,
    required super.content,
    super.rating,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final details = json['author_details'] as Map<String, dynamic>? ?? {};
    return ReviewModel(
      id: json['id'] as String,
      author: json['author'] as String,
      content: json['content'] as String,
      rating: (details['rating'] as num?)?.toDouble(),
    );
  }
}
