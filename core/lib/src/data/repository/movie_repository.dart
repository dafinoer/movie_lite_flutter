import 'package:core/src/data/repository/search_repository.dart';

import '../../../core.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> nowPlaying(int page, [int limit = 20]);

  Future<List<MovieEntity>> popularMovies(int page);
}
