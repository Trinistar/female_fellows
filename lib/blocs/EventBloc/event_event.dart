part of 'event_bloc.dart';

sealed class EventEvent {
  const EventEvent();
}

class EventUpdate extends EventEvent {
  EventUpdate({required this.updateEvent});

  final Event updateEvent;
}

class NewEvent extends EventEvent {
  NewEvent(
    this.eventPicture, {
    required this.newEvent,
  });

  final Event newEvent;
  final XFile eventPicture;

  //materials
}

class LoadEvent extends EventEvent {
  LoadEvent({
    this.isAdmin = false,
    required this.eventId,
  });

  final String eventId;
  final bool isAdmin;
}
