import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vs_femalefellows/helper_functions.dart';
import 'package:vs_femalefellows/models/address.dart';
import 'package:vs_femalefellows/models/category.dart';
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
  final String host;
  final String? participants; //array
  final String title;
  final Address location;
  final String description;
  final String contactPerson;
  final String email;
  final String phoneNumber;
  final EventMaterials? material;
  final bool? isfavorit;
  String? id;
  final List<int>? categories;
  final EventDates? dates;

  Event({
    this.dates,
    this.categories,
    required this.whatsAppLink,
    required this.email,
    required this.phoneNumber,
    this.isfavorit,
    required this.host,
    this.participants,
    required this.title,
    required this.location,
    required this.description,
    required this.contactPerson,
    required this.material,
    this.id,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable(explicitToJson: true)
@TimestampConverter()
class EventDates {
  EventDates({this.created, this.updated, this.eventDate});

  @JsonKey(fromJson: HelperFunctions.dateTimeFromTimestamp, toJson: HelperFunctions.dateTimeAsIs)
  final Timestamp? created;
  @JsonKey(fromJson: HelperFunctions.dateTimeFromTimestamp, toJson: HelperFunctions.dateTimeAsIs)
  final Timestamp? updated;
  @JsonKey(fromJson: HelperFunctions.dateTimeFromTimestamp, toJson: HelperFunctions.dateTimeAsIs)
  final Timestamp? eventDate;

  factory EventDates.fromJson(Map<String, dynamic> json) => _$EventDatesFromJson(json);
  Map<String, dynamic> toJson() => _$EventDatesToJson(this);
}
