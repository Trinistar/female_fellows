import 'package:json_annotation/json_annotation.dart';

part 'events.g.dart';

@JsonSerializable(explicitToJson: true)
class Event {
  final String date;
  final String host;
  final String participants; //array
  final String eventTitle;
  final String location;
  final String eventDescription;
  final String contactPerson;
  final String material;
  //final EventMaterial material;
  final bool isfavorit;
  //categorys
  final bool? sport;
  final bool? tandem;
  final bool? outdoor;

  Event({
    this.sport,
    this.tandem,
    this.outdoor,
    required this.isfavorit,
    required this.date,
    required this.host,
    required this.participants,
    required this.eventTitle,
    required this.location,
    required this.eventDescription,
    required this.contactPerson,
    required this.material,
  });
    factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);

  List<Object?>get props=>[
    sport,
    tandem,
    outdoor,
    isfavorit,
    date,
    host,
    participants,
    eventTitle,
    location,
    eventDescription,
    contactPerson,
    material,

  ];
}
