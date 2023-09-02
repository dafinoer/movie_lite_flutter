import 'dart:convert';

import 'package:core/src/data/extensions/extension_movie_model_resource.dart';
import 'package:injectable/injectable.dart';

import '../../../core.dart';
import '../../network/dio/movie_list_dio.dart';
import '../../network/movie_list_network.dart';
import 'movie_repository.dart';

@Injectable(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieListNetwork movieListNetwork;

  MovieRepositoryImpl(@Named.from(MovieListDio) this.movieListNetwork);

  @override
  Future<List<MovieEntity>> nowPlaying(int page, [int limit = 20]) async {
    final movies = await movieListNetwork.getNowPlaying(page);
    final toEntity = movies.results.map((e) => e.toEntity).toList(
          growable: false,
        );
    if (limit < 20) return toEntity.take(limit).toList(growable: false);

    return toEntity;
  }

  @override
  Future<List<MovieEntity>> popularMovies(int page) async {
    final popularMoviesResponse = await movieListNetwork.popularMovies(page);
    final toListEntity = popularMoviesResponse.results
        .map((e) => e.toEntity)
        .toList(growable: false);
    return toListEntity;
  }
}
