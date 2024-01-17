part of 'event_bloc.dart';

sealed class EventState {
  const EventState();
}

final class EventInitial extends EventState {}

class FormEvent extends EventState {}

class CreateSuccess extends EventState {
  final Event eventdata;
  final DocumentReference<Map<String, dynamic>> eventRef;

  CreateSuccess({required this.eventdata, required this.eventRef});
}

class UpdateEventSuccess extends EventState {}

class EventFailure extends EventState {}

class UpdateEventFailure extends EventState {}

class EventStore extends EventState {
  final List<Event> events;

  EventStore({required this.events});
}

class EventLoaded extends EventState {
  EventLoaded({required this.event});

  final Event event;
}

class EventNotLoaded extends EventState {}

