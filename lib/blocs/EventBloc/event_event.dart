part of 'event_bloc.dart';

sealed class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object> get props => [];
}

class NewEvent extends EventEvent {
  final String date;
  final String host;
  final String location;
  final String eventTitle;
  final String eventDescription;
  final String contactPerson;
  final String eventEmail;
  final String evntPhoneNumber;

  //categorys
  final bool? sport;
  final bool? tandem;
  final bool? outdoor;
  //materials
  final String? planer;
  final String? book;
  final String? food;
  final String? information;
  final String? clothes;
  NewEvent({
    required this.evntPhoneNumber,
    required this.eventEmail,
    required this.location,
    this.sport,
    this.tandem,
    this.outdoor,
    required this.date,
    required this.host,
    required this.eventTitle,
    required this.eventDescription,
    required this.contactPerson,
    this.planer,
    this.book,
    this.food,
    this.information,
    this.clothes,
  });
}
