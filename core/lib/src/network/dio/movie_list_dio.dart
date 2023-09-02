import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domains/error/client_server_error.dart';
import '../../domains/error/general_error.dart';
import '../models/movies_model_resource.dart';
import '../movie_list_network.dart';

@named
@Injectable(as: MovieListNetwork)
class MovieListDio implements MovieListNetwork {
  final Dio dio;

  MovieListDio(this.dio);

  @override
  Future<MoviesModelResource> getNowPlaying(
    int page, [
    String language = 'en-US',
  ]) async {
    try {
      final response = await dio.get('movie/now_playing', queryParameters: {
        'language': language,
        'page': page.toString(),
      });
      final jsonDecode = json.decode(response.data);
      final movieModelResources = MoviesModelResource.fromJson(jsonDecode);

      return movieModelResources;
    } on DioException catch (dioError) {
      final dioResponse = dioError.response;
      if (dioError.type == DioExceptionType.unknown && dioResponse != null) {
        final jsonDecode = json.decode(dioResponse.data);
        final movieModelResources = MoviesModelResource.fromJson(jsonDecode);
        return movieModelResources;
      } else {
        throw ClientServerError(
            statusCode: dioError.response?.statusCode,
            message: dioError.response?.statusMessage);
      }
    } catch (error) {
      throw GeneralError(message: error.toString());
    }
  }

  @override
  Future<MoviesModelResource> popularMovies(
    int page, [
    String region = 'ID',
  ]) async {
    try {
      final response = await dio.get('movie/popular', queryParameters: {
        'page': page.toString(),
        'region': region,
      });
      final jsonDecode = json.decode(response.data);
      final movieModelResources = MoviesModelResource.fromJson(jsonDecode);

      return movieModelResources;
    } on DioException catch (dioError) {
      final dioResponse = dioError.response;
      if (dioError.type == DioExceptionType.unknown && dioResponse != null) {
        final jsonDecode = json.decode(dioResponse.data);
        final movieModelResources = MoviesModelResource.fromJson(jsonDecode);
        return movieModelResources;
      } else {
        throw ClientServerError(
          statusCode: dioError.response?.statusCode,
          message: dioError.response?.statusMessage,
        );
      }
    } catch (error) {
      throw GeneralError(message: error.toString());
    }
  }
}
