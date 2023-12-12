import 'package:json_annotation/json_annotation.dart';
import 'package:vs_femalefellows/models/materials.dart';

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
  final String eventEmail;
  final String eventPhoneNumber;
  final EventMaterials? material;
  //final EventMaterial material;
  final bool isfavorit;
  //categorys
  final bool? sport;
  final bool? tandem;
  final bool? outdoor;

  Event({
    required this.eventEmail,
   required this.eventPhoneNumber,
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

  List<Object?> get props => [
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
