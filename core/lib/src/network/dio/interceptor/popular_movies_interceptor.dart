import 'package:dio/dio.dart';

import '../../cache_response_network.dart';

class PopularMoviesInterceptor extends Interceptor {
  final CacheResponseNetwork cacheResponseNetwork;

  PopularMoviesInterceptor(this.cacheResponseNetwork);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final request = err.requestOptions.path;
    if (request == 'movie/popular') {
      final latestResponse =
          await cacheResponseNetwork.getResponsePopularMovies();
      final newResponse =
          err.response ?? Response(requestOptions: err.requestOptions);
      newResponse.data = latestResponse;
      err = err.copyWith(response: newResponse);
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final request = response.requestOptions;
    final pageQuery = request.queryParameters['page'];
    if (request.path == 'movie/popular' && pageQuery == '1') {
      await cacheResponseNetwork.writeCachePopularMovies(response.data);
    }

    super.onResponse(response, handler);
  }
}
