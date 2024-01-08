import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vs_femalefellows/models/materials.dart';

part 'events.g.dart';

class TimestampConverter implements JsonConverter<Timestamp, dynamic> {
  const TimestampConverter();

  @override
  Timestamp fromJson(dynamic json) => json as Timestamp;

  @override
  dynamic toJson(Timestamp object) => object;
}

@JsonSerializable(explicitToJson: true)
@TimestampConverter()
class Event {
  final Timestamp date;
  final String host;
  final String participants; //array
  final String eventTitle;
  final String location;
  final String eventDescription;
  final String contactPerson;
  final String eventEmail;
  final String eventPhoneNumber;
  final EventMaterials? material;
  final bool isfavorit;
  
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

/*   Map<String, dynamic> toJson() {
    return {
      'date': date,
      'host': host,
      'participants': participants,
      'eventTitle': eventTitle,
      'location': location,
      'eventDescription': eventDescription,
      'contactPerson': contactPerson,
      'eventEmail': eventEmail,
      'eventPhoneNumber': eventPhoneNumber,
      'material': material?.toJson(),
      'isfavorit': isfavorit,
      'sport': sport,
      'tandem': tandem,
      'outdoor': outdoor,
    };
  } */
}
