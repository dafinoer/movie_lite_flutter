//@GeneratedMicroModule;CorePackageModule;package:core/src/core_dependencies.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:dio/dio.dart' as _i12;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i1;

import 'data/repository/movie_repository.dart' as _i16;
import 'data/repository/movie_repository_impl.dart' as _i17;
import 'data/repository/private_repository.dart' as _i18;
import 'data/repository/private_repository_impl.dart' as _i19;
import 'data/repository/search_repository.dart' as _i7;
import 'data/repository/search_repository_impl.dart' as _i8;
import 'datastore/api_token_datastore.dart' as _i9;
import 'datastore/di/data_store_module.dart' as _i24;
import 'datastore/movies_datastore.dart' as _i4;
import 'domains/models/app_setup.dart' as _i13;
import 'domains/usecase/get_now_playing.dart' as _i22;
import 'domains/usecase/get_popular_movies.dart' as _i23;
import 'domains/usecase/save_token_api_key.dart' as _i20;
import 'domains/usecase/search_popular_movies.dart' as _i21;
import 'network/cache_response_network.dart' as _i11;
import 'network/di/network_module.dart' as _i25;
import 'network/dio/interceptor/apitoken_interceptor.dart' as _i10;
import 'network/dio/interceptor/now_playing_movie_interceptor.dart' as _i5;
import 'network/dio/interceptor/popular_movies_interceptor.dart' as _i6;
import 'network/dio/movie_list_dio.dart' as _i15;
import 'network/movie_list_network.dart' as _i14;

class CorePackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) async {
    final dataStoreModule = _$DataStoreModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i3.Box<String>>(
      () => dataStoreModule.openBoxApiToken(),
      instanceName: 'securityBox',
      preResolve: true,
    );
    await gh.factoryAsync<_i3.Box<String>>(
      () => dataStoreModule.openBoxMovies(),
      instanceName: 'moviesBox',
      preResolve: true,
    );
    gh.lazySingleton<_i4.MoviesDataStore>(() =>
        _i4.MoviesDataStore(gh<_i3.Box<String>>(instanceName: 'moviesBox')));
    gh.factory<_i5.NowPlayingMovieInterceptor>(() =>
        networkModule.nowPlayingMovieInterceptor(gh<_i4.MoviesDataStore>()));
    gh.factory<_i6.PopularMoviesInterceptor>(() =>
        networkModule.popularMoviesInterceptor(gh<_i4.MoviesDataStore>()));
    gh.factory<_i7.SearchRepository>(
        () => _i8.SearchRepositoryImpl(gh<_i4.MoviesDataStore>()));
    gh.lazySingleton<_i9.ApiTokenDataStore>(() => _i9.ApiTokenDataStore(
        gh<_i3.Box<String>>(instanceName: 'securityBox')));
    gh.factory<_i10.ApiTokenInterceptor>(
        () => networkModule.apiTokenInterceptor(gh<_i9.ApiTokenDataStore>()));
    gh.factory<_i11.CacheResponseNetwork>(
        () => _i11.CacheResponseNetwork(gh<_i4.MoviesDataStore>()));
    gh.singleton<_i12.Dio>(networkModule.dio(
      gh<_i13.AppSetup>(),
      gh<_i10.ApiTokenInterceptor>(),
      gh<_i5.NowPlayingMovieInterceptor>(),
      gh<_i6.PopularMoviesInterceptor>(),
    ));
    gh.factory<_i14.MovieListNetwork>(
      () => _i15.MovieListDio(gh<_i12.Dio>()),
      instanceName: 'MovieListDio',
    );
    gh.factory<_i16.MovieRepository>(() => _i17.MovieRepositoryImpl(
        gh<_i14.MovieListNetwork>(instanceName: 'MovieListDio')));
    gh.factory<_i18.PrivateRepository>(
        () => _i19.PrivateRepositoryImpl(gh<_i9.ApiTokenDataStore>()));
    gh.factory<_i20.SaveTokenApiKey>(
        () => _i20.SaveTokenApiKey(gh<_i18.PrivateRepository>()));
    gh.factory<_i21.SearchPopularMovies>(
        () => _i21.SearchPopularMovies(gh<_i7.SearchRepository>()));
    gh.factory<_i22.GetNowPlaying>(
        () => _i22.GetNowPlaying(gh<_i16.MovieRepository>()));
    gh.factory<_i23.GetPopularMovies>(
        () => _i23.GetPopularMovies(gh<_i16.MovieRepository>()));
  }
}

class _$DataStoreModule extends _i24.DataStoreModule {}

class _$NetworkModule extends _i25.NetworkModule {}
