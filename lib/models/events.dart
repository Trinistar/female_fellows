import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vs_femalefellows/models/address.dart';
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
  final String whatsAppLink;
  final Timestamp date;
  final String host;
  final String? participants; //array
  final String eventTitle;
  final Address location;
  final String eventDescription;
  final String contactPerson;
  final String eventEmail;
  final String eventPhoneNumber;
  final EventMaterials? material;
  final bool? isfavorit;

  Event({
    required this.whatsAppLink,
    required this.eventEmail,
    required this.eventPhoneNumber,
    this.isfavorit,
    required this.date,
    required this.host,
    this.participants,
    required this.eventTitle,
    required this.location,
    required this.eventDescription,
    required this.contactPerson,
    required this.material,
    this.eventId,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
