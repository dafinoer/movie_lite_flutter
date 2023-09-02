import 'package:core/core.dart';
import 'package:core/src/data/repository/search_repository.dart';
import 'package:injectable/injectable.dart';

import '../../data/repository/movie_repository_impl.dart';

@injectable
class SearchPopularMovies {
  final SearchRepository searchRepository;

  SearchPopularMovies(this.searchRepository);

  Future<List<MovieEntity>> call(String text) {
    return searchRepository.search(text);
  }
}
