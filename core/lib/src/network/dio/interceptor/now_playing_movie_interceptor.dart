import 'package:dio/dio.dart';

import '../../cache_response_network.dart';

class NowPlayingMovieInterceptor extends Interceptor {
  final CacheResponseNetwork cacheResponseNetwork;

  NowPlayingMovieInterceptor(this.cacheResponseNetwork);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.requestOptions.path == 'movie/now_playing') {
      final lastValue = await cacheResponseNetwork.getResponseFromLocal();
      final response =
          err.response ?? Response(requestOptions: err.requestOptions);
      response.data = lastValue;
      err = err.copyWith(response: response);
    }

    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final request = response.requestOptions;
    final queryPage = request.queryParameters['page'];
    if (request.path == 'movie/now_playing' && queryPage == "1") {
      await cacheResponseNetwork.moviesDataStore.writeMovies(response.data);
    }
    super.onResponse(response, handler);
  }
}
