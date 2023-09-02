// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesModelResource _$MoviesModelResourceFromJson(Map<String, dynamic> json) =>
    MoviesModelResource(
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieModelResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
