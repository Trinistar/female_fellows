part of 'signedup_event_bloc.dart';

sealed class SignedupEventsState extends Equatable {
  const SignedupEventsState();
  
  @override
  List<Object> get props => [];
}

final class SignedupEventsInitial extends SignedupEventsState {}

class SignedupEventsLoading extends SignedupEventsState {}

class SignedupEventsLoaded extends SignedupEventsState {
  const SignedupEventsLoaded(this.favorites);

  final List<Event> favorites;

  @override
  List<Object> get props => <Object>[favorites];
}

class SignedupEventsNotLoaded extends SignedupEventsState {}
