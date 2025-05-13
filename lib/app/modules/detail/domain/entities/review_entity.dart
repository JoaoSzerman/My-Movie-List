class ReviewEntity {
  final String id;
  final String author;
  final String content;
  final double? rating;

  ReviewEntity({
    required this.id,
    required this.author,
    required this.content,
    this.rating,
  });
}
