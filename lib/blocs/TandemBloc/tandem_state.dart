part of 'tandem_bloc.dart';

sealed class TandemState {
  const TandemState();
}

final class TandemInitial extends TandemState {}

final class TandemNewcomersLoaded extends TandemState {
  TandemNewcomersLoaded({required this.tandems});

  final List<FFUser> tandems;
}

final class TandemLocalsLoaded extends TandemState {
  TandemLocalsLoaded({required this.tandems});

  final List<FFUser> tandems;
}

final class TandemsNotLoaded extends TandemState {}
