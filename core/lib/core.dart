/// Support for doing something awesome.
///
/// More dartdocs go here.
library core;

export 'src/domains/models/app_setup.dart';
export 'src/domains/models/movie_entity.dart';
export 'src/domains/usecase/get_now_playing.dart';
export 'src/domains/usecase/save_token_api_key.dart';
export 'src/domains/usecase/get_popular_movies.dart';
export 'src/domains/usecase/search_popular_movies.dart';
export 'src/domains/error/client_server_error.dart';
export 'src/domains/error/general_error.dart';
export 'src/domains/error/no_connection.dart';

export 'src/core_dependencies.module.dart';
export 'src/core_dependencies.dart';
