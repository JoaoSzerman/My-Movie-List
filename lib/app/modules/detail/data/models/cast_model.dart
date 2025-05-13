import 'package:my_movie_list/app/core/constants/api_constants.dart';

import '../../domain/domain.dart';

class CastModel extends CastEntity {
  CastModel({
    required super.id,
    required super.name,
    required super.character,
    super.profilePath,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      id: json['id'] as int,
      name: json['name'] as String,
      character: json['character'] as String,
      profilePath:
          json['profile_path'] != null
              ? '${ApiConstants.PROFILE_PATH}${json['profile_path']}'
              : null,
    );
  }
}
