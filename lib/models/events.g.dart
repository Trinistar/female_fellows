// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      sport: json['sport'] as bool?,
      tandem: json['tandem'] as bool?,
      outdoor: json['outdoor'] as bool?,
      isfavorit: json['isfavorit'] as bool,
      date: json['date'] as String,
      host: json['host'] as String,
      participants: json['participants'] as String,
      eventTitle: json['eventTitle'] as String,
      location: json['location'] as String,
      eventDescription: json['eventDescription'] as String,
      contactPerson: json['contactPerson'] as String,
      material: json['material'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'date': instance.date,
      'host': instance.host,
      'participants': instance.participants,
      'eventTitle': instance.eventTitle,
      'location': instance.location,
      'eventDescription': instance.eventDescription,
      'contactPerson': instance.contactPerson,
      'material': instance.material,
      'isfavorit': instance.isfavorit,
      'sport': instance.sport,
      'tandem': instance.tandem,
      'outdoor': instance.outdoor,
    };
