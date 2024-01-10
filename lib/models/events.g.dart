// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      whatsAppLink: json['whatsAppLink'] as String,
      eventEmail: json['eventEmail'] as String,
      eventPhoneNumber: json['eventPhoneNumber'] as String,
      isfavorit: json['isfavorit'] as bool?,
      date: const TimestampConverter().fromJson(json['date']),
      host: json['host'] as String,
      participants: json['participants'] as String?,
      eventTitle: json['eventTitle'] as String,
      location: Address.fromJson(json['location'] as Map<String, dynamic>),
      eventDescription: json['eventDescription'] as String,
      contactPerson: json['contactPerson'] as String,
      material: json['material'] == null
          ? null
          : EventMaterials.fromJson(json['material'] as Map<String, dynamic>),
      eventId: json['eventId'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'whatsAppLink': instance.whatsAppLink,
      'date': const TimestampConverter().toJson(instance.date),
      'host': instance.host,
      'participants': instance.participants,
      'eventTitle': instance.eventTitle,
      'location': instance.location.toJson(),
      'eventDescription': instance.eventDescription,
      'contactPerson': instance.contactPerson,
      'eventEmail': instance.eventEmail,
      'eventPhoneNumber': instance.eventPhoneNumber,
      'material': instance.material?.toJson(),
      'isfavorit': instance.isfavorit,
      'eventId': instance.eventId,
    };
