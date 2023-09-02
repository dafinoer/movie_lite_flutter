import 'package:json_annotation/json_annotation.dart';

part 'movie_model_resource.g.dart';

@JsonSerializable(createToJson: false)
class MovieModelResource {
  final int id;
  final String originalTitle;
  final String title;
  final String overview;
  final String? backdropPath;
  final String? posterPath;
  final bool adult;
  final double voteAverage;
  final int voteCount;

  MovieModelResource({
    required this.id,
    required this.originalTitle,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    this.adult = false,
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });

  factory MovieModelResource.fromJson(Map<String, dynamic> json) =>
      _$MovieModelResourceFromJson(json);
}
