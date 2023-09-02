part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();
}

class PopularMoviesInitial extends PopularMoviesState {
  @override
  List<Object> get props => [];
}


class PopularMoviesLoading extends PopularMoviesState {
  const PopularMoviesLoading();

  @override
  List<Object?> get props => [];
}


class PopularMoviesSuccess extends PopularMoviesState {
  final List<MovieEntity> movies;

  const PopularMoviesSuccess(this.movies);

  @override
  List<Object?> get props => [movies];
}


class PopularMoviesError extends PopularMoviesState {
  final String? error;

  const PopularMoviesError({this.error});

  @override
  List<Object?> get props => [error];
}