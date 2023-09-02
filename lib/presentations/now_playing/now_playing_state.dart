part of 'now_playing_cubit.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();
}

class NowPlayingInitial extends NowPlayingState {
  const NowPlayingInitial();

  @override
  List<Object> get props => [];
}

class NowPlayingLoading extends NowPlayingState {
  const NowPlayingLoading();

  @override
  List<Object> get props => [];
}

class NowPlayingSuccess extends NowPlayingState {
  const NowPlayingSuccess(this.movies);

  final List<MovieEntity> movies;

  @override
  List<Object> get props => [movies];
}

class NowPlayingError extends NowPlayingState {
  const NowPlayingError({this.messageError});

  final String? messageError;

  @override
  List<Object> get props => [];
}
