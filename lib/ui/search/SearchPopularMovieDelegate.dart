import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../presentations/search/search_cubit.dart';

class SearchPopularMovieDelegate extends SearchDelegate {
  final SearchCubit popularMovies;

  SearchPopularMovieDelegate(this.popularMovies);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pop();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    popularMovies.onSearch(query);

    return BlocBuilder<SearchCubit, SearchState>(
      bloc: popularMovies,
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: state.movies.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(state.movies[index].title),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
