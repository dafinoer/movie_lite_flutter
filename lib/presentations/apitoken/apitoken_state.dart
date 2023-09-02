part of 'apitoken_cubit.dart';

abstract class ApiTokenState extends Equatable {
  const ApiTokenState();
}

class ApiTokenInitial extends ApiTokenState {
  const ApiTokenInitial();

  @override
  List<Object> get props => [];
}

class ApiTokenLoading extends ApiTokenState {
  const ApiTokenLoading();

  @override
  List<Object?> get props => [];
}

class ApiTokenSuccess extends ApiTokenState {
  const ApiTokenSuccess();

  @override
  List<Object?> get props => [];
}

class ApiTokenError extends ApiTokenState {
  const ApiTokenError();

  @override
  List<Object?> get props => [];
}
