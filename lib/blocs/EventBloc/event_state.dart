part of 'event_bloc.dart';

sealed class EventState extends Equatable {
  const EventState();
  
  @override
  List<Object> get props => [];
}

final class EventInitial extends EventState {}
class FormEvent extends EventState{}

class CreateSuccess extends EventState{
  final Event eventdata;

  CreateSuccess({required this.eventdata});
}
class EventFailure extends EventState{}
