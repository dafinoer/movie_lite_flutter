// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModelResource _$MovieModelResourceFromJson(Map<String, dynamic> json) =>
    MovieModelResource(
      id: json['id'] as int,
      originalTitle: json['original_title'] as String,
      title: json['title'] as String,
      overview: json['overview'] as String,
      backdropPath: json['backdrop_path'] as String?,
      posterPath: json['poster_path'] as String?,
      adult: json['adult'] as bool? ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] as int? ?? 0,
    );
