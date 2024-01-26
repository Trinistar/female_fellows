part of 'tandem_bloc.dart';

sealed class TandemEvent extends Equatable {
  const TandemEvent();

  @override
  List<Object> get props => [];
}

class LoadAllTandemNewcomersEvent extends TandemEvent {
  LoadAllTandemNewcomersEvent();
}

class LoadAllTandemLocalsEvent extends TandemEvent {
  LoadAllTandemLocalsEvent();
}

class UnloadAllTandemsEvent extends TandemEvent {}
