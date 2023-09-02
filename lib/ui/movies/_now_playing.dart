part of 'movies_screen_page.dart';

class _NowPlaying extends StatelessWidget {
  const _NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NowPlayingCubit, NowPlayingState>(
      listener: (context, state) {
        if (state is NowPlayingError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.messageError ?? 'Response Failure'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is NowPlayingLoading) {
          return const AspectRatio(
            aspectRatio: 16 / 9,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is NowPlayingSuccess) {
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: Swiper(
              itemCount: state.movies.length,
              controller: SwiperController(),
              loop: true,
              pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  activeColor: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              itemBuilder: (context, index) => CachedNetworkImage(
                imageUrl:
                    state.movies[index].backdropPath?.toUrlBackdropPath() ?? '',
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => Center(
                  child: Icon(
                    Icons.broken_image,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
