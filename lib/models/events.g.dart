// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      dates: json['dates'] == null
          ? null
          : EventDates.fromJson(json['dates'] as Map<String, dynamic>),
      categories:
          (json['categories'] as List<dynamic>?)?.map((e) => e as int).toList(),
      whatsAppLink: json['whatsAppLink'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      isfavorit: json['isfavorit'] as bool?,
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
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'whatsAppLink': instance.whatsAppLink,
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
      'categories': instance.categories,
      'dates': instance.dates?.toJson(),
      'picture': instance.picture,
    };

EventDates _$EventDatesFromJson(Map<String, dynamic> json) => EventDates(
      created:
          HelperFunctions.dateTimeFromTimestamp(json['created'] as Timestamp?),
      updated:
          HelperFunctions.dateTimeFromTimestamp(json['updated'] as Timestamp?),
      eventDate: HelperFunctions.dateTimeFromTimestamp(
          json['eventDate'] as Timestamp?),
    );

Map<String, dynamic> _$EventDatesToJson(EventDates instance) =>
    <String, dynamic>{
      'created': HelperFunctions.dateTimeAsIs(instance.created),
      'updated': HelperFunctions.dateTimeAsIs(instance.updated),
      'eventDate': HelperFunctions.dateTimeAsIs(instance.eventDate),
    };
