import 'package:injectable/injectable.dart';

import '../datastore/movies_datastore.dart';

@injectable
class CacheResponseNetwork {
  final MoviesDataStore moviesDataStore;

  CacheResponseNetwork(this.moviesDataStore);

  Future<String?> getResponseFromLocal() {
    return Future.value(moviesDataStore.getMovies());
  }

  Future<String?> getResponsePopularMovies() {
    return Future.value(moviesDataStore.getPopularMovies());
  }

  Future<void> writeCache(String response) {
    return moviesDataStore.writeMovies(response);
  }

  Future<void> writeCachePopularMovies(String response) =>
      moviesDataStore.writePopularMovie(response);
}
