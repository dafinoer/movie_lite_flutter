import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:core/core.dart';
import 'package:tix_clone_flutter/app_configure.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  final GetNowPlaying getNowPlaying;

  NowPlayingCubit(this.getNowPlaying) : super(const NowPlayingInitial());

  factory NowPlayingCubit.create() =>
      NowPlayingCubit(getIt.get())..onGetNowPlaying();

  void onGetNowPlaying() async {
    try {
      emit(const NowPlayingLoading());
      final result = await getNowPlaying.nowPlaying(1, 5);
      emit(NowPlayingSuccess(result));
    } on ClientServerError catch (clientError) {
      emit(NowPlayingError(messageError: clientError.message));
    } catch (e) {
      emit(const NowPlayingError());
    }
  }
}
