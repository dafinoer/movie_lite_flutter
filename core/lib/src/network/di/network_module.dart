import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../datastore/api_token_datastore.dart';
import '../../datastore/movies_datastore.dart';
import '../../domains/models/app_setup.dart';
import '../cache_response_network.dart';
import '../dio/interceptor/apitoken_interceptor.dart';
import '../dio/interceptor/now_playing_movie_interceptor.dart';
import '../dio/interceptor/popular_movies_interceptor.dart';

@module
abstract class NetworkModule {
  @injectable
  ApiTokenInterceptor apiTokenInterceptor(
          ApiTokenDataStore apiTokenDataStore) =>
      ApiTokenInterceptor(apiTokenDataStore);

  @injectable
  NowPlayingMovieInterceptor nowPlayingMovieInterceptor(
    MoviesDataStore moviesDataStore,
  ) =>
      NowPlayingMovieInterceptor(
        CacheResponseNetwork(moviesDataStore),
      );

  @injectable
  PopularMoviesInterceptor popularMoviesInterceptor(
    MoviesDataStore moviesDataStore,
  ) =>
      PopularMoviesInterceptor(
        CacheResponseNetwork(moviesDataStore),
      );

  @Singleton()
  Dio dio(
    AppSetup appSetup,
    ApiTokenInterceptor apiTokenInterceptor,
    NowPlayingMovieInterceptor nowPlayingMovieInterceptor,
    PopularMoviesInterceptor popularMoviesInterceptor,
  ) {
    final option = BaseOptions(
      baseUrl: appSetup.baseUrl,
      connectTimeout: Duration(milliseconds: 5000),
      sendTimeout: Duration(milliseconds: 5000),
      responseType: ResponseType.plain,
    );
    final dio = Dio(option)
      ..interceptors.addAll([
        apiTokenInterceptor,
        nowPlayingMovieInterceptor,
        popularMoviesInterceptor,
      ]);

    return dio;
  }
}
