part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}


class SearchLoadingState extends SearchState {
  const SearchLoadingState();

  @override
  List<Object> get props => [];
}

class SearchSuccessState extends SearchState {
  final List<MovieEntity> movies;

  const SearchSuccessState(this.movies);

  @override
  List<Object> get props => [movies];
}

class SearchErrorState extends SearchState {
  const SearchErrorState();
  @override
  List<Object> get props => [];
}