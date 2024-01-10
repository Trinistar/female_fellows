part of 'event_bloc.dart';

sealed class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object> get props => [];
}
class EventUpdate extends EventEvent{
  final Event updateEvent;
  EventUpdate({required this.updateEvent});
}

class NewEvent extends EventEvent {
  final Event newEvent;

  //materials

  NewEvent({
    required this.newEvent,
  });
}
