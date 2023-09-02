import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String originalTitle;
  final String title;
  final String overview;
  final String? backdropPath;
  final String? posterPath;
  final bool adult;
  final double voteAverage;
  final int voteCount;

  MovieEntity({
    required this.id,
    required this.originalTitle,
    required this.title,
    required this.overview,
    this.backdropPath,
    this.posterPath,
    this.adult = false,
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });

  @override
  List<Object?> get props => [
        id,
        originalTitle,
        title,
        overview,
        backdropPath,
        posterPath,
        adult,
        voteAverage,
        voteCount,
      ];
}
