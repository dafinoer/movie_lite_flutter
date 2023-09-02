import 'package:core/core.dart';

import '../../network/models/movie_model_resource.dart';

extension ExtensionMovieModelResource on MovieModelResource {
  MovieEntity get toEntity => MovieEntity(
        id: id,
        originalTitle: originalTitle,
        title: title,
        overview: overview,
        backdropPath: backdropPath,
        posterPath: posterPath,
        voteAverage: voteAverage,
        voteCount: voteCount,
        adult: adult,
      );
}
