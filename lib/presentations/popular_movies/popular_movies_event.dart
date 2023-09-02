part of 'popular_movies_bloc.dart';

abstract class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();
}


class GetPopularMoviesEvent extends PopularMoviesEvent {
  const GetPopularMoviesEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}