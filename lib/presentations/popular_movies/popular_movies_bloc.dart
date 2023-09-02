import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tix_clone_flutter/app_configure.dart';

part 'popular_movies_event.dart';

part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc(this.getPopularMovies) : super(PopularMoviesInitial()) {
    on<GetPopularMoviesEvent>((event, emit) async {
      try {
        emit(const PopularMoviesLoading());
        final response = await getPopularMovies.call(1);
        emit(PopularMoviesSuccess(response));
      } catch (e) {
        emit(const PopularMoviesError());
      }
    });
  }

  factory PopularMoviesBloc.create() =>
      PopularMoviesBloc(getIt.get())..add(const GetPopularMoviesEvent());
}
