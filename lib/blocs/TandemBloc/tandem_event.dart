part of 'tandem_bloc.dart';

sealed class TandemEvent {
  const TandemEvent();
}

class LoadAllTandemNewcomersEvent extends TandemEvent {
  LoadAllTandemNewcomersEvent(this.profile);

  final FFUser profile;
}

class LoadAllTandemLocalsEvent extends TandemEvent {
  LoadAllTandemLocalsEvent(this.profile);

  final FFUser profile;
}

class UpdateTandemFilterEvent extends TandemEvent {
  UpdateTandemFilterEvent(this.profile);

  final FFUser profile;
}

class UnloadAllTandemsEvent extends TandemEvent {}
