part of 'event_bloc.dart';

sealed class EventState extends Equatable {
  const EventState();

  @override
  List<Object> get props => [];
}

final class EventInitial extends EventState {}

class FormEvent extends EventState {}

class CreateSuccess extends EventState {
  final Event eventdata;
  final DocumentReference<Map<String, dynamic>> eventRef;

  CreateSuccess({required this.eventdata, required this.eventRef});
}

class EventFailure extends EventState {}

class EventStore extends EventState {
  final List<Event> events;

  EventStore({required this.events});
}
