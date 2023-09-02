import 'dart:convert';

import 'package:core/src/data/extensions/extension_movie_model_resource.dart';
import 'package:injectable/injectable.dart';

import '../../datastore/movies_datastore.dart';
import '../../domains/models/movie_entity.dart';
import '../../network/models/movies_model_resource.dart';
import 'search_repository.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final MoviesDataStore moviesDataStore;

  SearchRepositoryImpl(this.moviesDataStore);

  @override
  Future<List<MovieEntity>> search(String value) async {
    if (value.isEmpty) return const <MovieEntity>[];

    final latestResponse = moviesDataStore.getPopularMovies();
    if (latestResponse != null) {
      final jsonDecodeResponse = json.decode(latestResponse);
      final movies = MoviesModelResource.fromJson(jsonDecodeResponse);
      final toEntityList = movies.results.map((e) => e.toEntity).toList();
      final filterList = toEntityList
          .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
          .toList(growable: false);

      return filterList;
    }

    return const <MovieEntity>[];
  }
}
