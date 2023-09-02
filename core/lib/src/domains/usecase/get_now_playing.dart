import 'package:core/core.dart';
import 'package:core/src/data/repository/movie_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetNowPlaying {
  final MovieRepository movieRepository;

  GetNowPlaying(this.movieRepository);

  Future<List<MovieEntity>> nowPlaying(int page, limit) =>
      movieRepository.nowPlaying(page, limit);
}
