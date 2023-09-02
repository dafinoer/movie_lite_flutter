import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:tix_clone_flutter/app_configure.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchPopularMovies searchPopularMovies;

  SearchCubit(this.searchPopularMovies) : super(SearchInitial());

  factory SearchCubit.create() => SearchCubit(getIt.get());


  void onSearch(String value) async {
    try {
      emit(const SearchLoadingState());
      final response = await searchPopularMovies.call(value);
      emit(SearchSuccessState(response));
    } catch (e) {
      emit(const SearchErrorState());
    }
  }
}
