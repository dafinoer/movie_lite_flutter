import 'package:core/src/data/repository/movie_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../core.dart';

@injectable
class GetPopularMovies {
  final MovieRepository movieRepository;

  GetPopularMovies(this.movieRepository);

  Future<List<MovieEntity>> call(int page) {
    return movieRepository.popularMovies(page);
  }
}
