import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tix_clone_flutter/utils/string_extension.dart';

import '../../presentations/now_playing/now_playing_cubit.dart';
import '../../presentations/popular_movies/popular_movies_bloc.dart';
import '../../presentations/search/search_cubit.dart';
import '../search/SearchPopularMovieDelegate.dart';

part '_now_playing.dart';

part '_popular_movies.dart';

part '_movie_item_widget.dart';

part '_title_popular_movie.dart';

class MoviesScreenPage extends StatelessWidget {
  const MoviesScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NowPlayingCubit.create()),
        BlocProvider(create: (context) => PopularMoviesBloc.create()),
        BlocProvider(create: (context) => SearchCubit.create()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Movie App',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Builder(
              builder: (newContext) =>
                  BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                    builder: (newContext, state) {
                      if (state is PopularMoviesSuccess) {
                        return IconButton(
                          onPressed: () {
                            showSearch(
                              context: newContext,
                              delegate: SearchPopularMovieDelegate(
                                newContext.read<SearchCubit>(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.search),
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
            )
          ],
        ),
        body: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _NowPlaying()),
            SliverToBoxAdapter(child: _TitlePopularMovie()),
            _PopularMovies(),
          ],
        ),
      ),
    );
  }
}

