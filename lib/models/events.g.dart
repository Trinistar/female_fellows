// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      whatsAppLink: json['whatsAppLink'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      isfavorit: json['isfavorit'] as bool?,
      date: const TimestampConverter().fromJson(json['date']),
      host: json['host'] as String,
      participants: json['participants'] as String?,
      title: json['title'] as String,
      location: Address.fromJson(json['location'] as Map<String, dynamic>),
      description: json['description'] as String,
      contactPerson: json['contactPerson'] as String,
      material: json['material'] == null
          ? null
          : EventMaterials.fromJson(json['material'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'whatsAppLink': instance.whatsAppLink,
      'date': const TimestampConverter().toJson(instance.date),
      'host': instance.host,
      'participants': instance.participants,
      'title': instance.title,
      'location': instance.location.toJson(),
      'description': instance.description,
      'contactPerson': instance.contactPerson,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'material': instance.material?.toJson(),
      'isfavorit': instance.isfavorit,
      'id': instance.id,
    };
