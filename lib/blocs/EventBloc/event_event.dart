part of 'event_bloc.dart';

sealed class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object> get props => [];
}

class NewEvent extends EventEvent{
  final String date;
  final String host;
//array
  final String eventTitle;
  final String eventDescription;
  final String contactPerson;
  final String material;
  //categorys
  final bool? sport;
  final bool? tandem;
  final bool? outdoor;
  NewEvent({
    this.sport,
    this.tandem,
    this.outdoor,
    required this.date,
    required this.host,
    required this.eventTitle,
    required this.eventDescription,
    required this.contactPerson,
    required this.material,
  });
}
