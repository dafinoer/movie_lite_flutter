part of 'movies_screen_page.dart';

class _PopularMovies extends StatelessWidget {
  const _PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is PopularMoviesSuccess) {
          return SliverList.separated(
            itemCount: state.movies.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => _MovieItemWidget(
              imageUrl: state.movies[index].posterPath?.toUrlPosterPath() ?? '',
              title: state.movies[index].title,
            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
