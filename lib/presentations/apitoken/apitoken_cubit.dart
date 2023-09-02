import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:core/core.dart';
import 'package:tix_clone_flutter/app_configure.dart';

part 'apitoken_state.dart';

class ApiTokenCubit extends Cubit<ApiTokenState> {
  final SaveTokenApiKey saveTokenApiKey;

  ApiTokenCubit(this.saveTokenApiKey) : super(const ApiTokenInitial());

  factory ApiTokenCubit.create() => ApiTokenCubit(getIt.get());

  void onSaveApiToken(String apiToken) async {
    try {
      emit(const ApiTokenLoading());
      await saveTokenApiKey.saveToken(apiToken);
      emit(const ApiTokenSuccess());
    } catch (e) {
      emit(const ApiTokenError());
    }
  }
}
