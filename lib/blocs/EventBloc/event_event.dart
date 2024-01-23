part of 'event_bloc.dart';

sealed class EventEvent {
  const EventEvent();

}

class EventUpdate extends EventEvent {
  EventUpdate({required this.updateEvent});

  final Event updateEvent;
}

class NewEvent extends EventEvent {
  NewEvent({
    required this.newEvent,
  });

  final Event newEvent;

  //materials
}

class LoadEvent extends EventEvent {
  LoadEvent({required this.eventId});

  final String eventId;
}
