import 'models/movies_model_resource.dart';

abstract class MovieListNetwork {
  Future<MoviesModelResource> getNowPlaying(
    int page, [
    String language = 'en-US',
  ]);

  Future<MoviesModelResource> popularMovies(int page, [String region = 'ID']);
}
