import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '_constanta_keys.dart';

@lazySingleton
class MoviesDataStore {
  final Box<String> _box;

  MoviesDataStore(@Named(moviesBox) this._box);

  String? getMovies() => _box.get(moviesNowPlayingKey);

  String? getPopularMovies() => _box.get(moviesPopularKey);

  Future<void> writeMovies(String movies) =>
      _box.put(moviesNowPlayingKey, movies);

  Future<void> writePopularMovie(String movies) => _box.put(
        moviesPopularKey,
        movies,
      );

  Future<void> onClean() => _box.clear();
}
