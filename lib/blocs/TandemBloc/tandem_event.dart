part of 'tandem_bloc.dart';

sealed class TandemEvent extends Equatable {
  const TandemEvent();

  @override
  List<Object> get props => [];
}

class LoadAllTandemNewcomersEvent extends TandemEvent {}

class LoadAllTandemLocalsEvent extends TandemEvent {}

class UnloadAllTandemsEvent extends TandemEvent {}

