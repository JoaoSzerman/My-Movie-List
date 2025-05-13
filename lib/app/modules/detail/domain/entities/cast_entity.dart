class CastEntity {
  final int id;
  final String name;
  final String character;
  final String? profilePath;

  CastEntity({
    required this.id,
    required this.name,
    required this.character,
    this.profilePath,
  });
}
