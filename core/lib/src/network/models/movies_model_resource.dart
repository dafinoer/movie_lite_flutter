import 'package:core/src/network/models/movie_model_resource.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies_model_resource.g.dart';

@JsonSerializable(createToJson: false)
class MoviesModelResource {
  final List<MovieModelResource> results;

  MoviesModelResource({required this.results});

  factory MoviesModelResource.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelResourceFromJson(json);
}
