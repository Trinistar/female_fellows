// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      eventEmail: json['eventEmail'] as String,
      eventPhoneNumber: json['eventPhoneNumber'] as String,
      sport: json['sport'] as bool?,
      tandem: json['tandem'] as bool?,
      outdoor: json['outdoor'] as bool?,
      isfavorit: json['isfavorit'] as bool,
      date: const TimestampConverter().fromJson(json['date']),
      host: json['host'] as String,
      participants: json['participants'] as String,
      eventTitle: json['eventTitle'] as String,
      location: json['location'] as String,
      eventDescription: json['eventDescription'] as String,
      contactPerson: json['contactPerson'] as String,
      material: json['material'] == null
          ? null
          : EventMaterials.fromJson(json['material'] as Map<String, dynamic>),
      eventId: json['eventId'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'date': const TimestampConverter().toJson(instance.date),
      'host': instance.host,
      'participants': instance.participants,
      'eventTitle': instance.eventTitle,
      'location': instance.location,
      'eventDescription': instance.eventDescription,
      'contactPerson': instance.contactPerson,
      'eventEmail': instance.eventEmail,
      'eventPhoneNumber': instance.eventPhoneNumber,
      'material': instance.material?.toJson(),
      'isfavorit': instance.isfavorit,
      'sport': instance.sport,
      'tandem': instance.tandem,
      'outdoor': instance.outdoor,
      'eventId': instance.eventId,
    };
