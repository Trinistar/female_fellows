// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notifications _$NotificationsFromJson(Map<String, dynamic> json) =>
    Notifications(
      contactwhatsapp: json['whatsapp'] as bool? ?? false,
      contactcall: json['call'] as bool? ?? false,
      phonenumber: json['phonenumber'] as String? ?? '',
      contactemail: json['emailbool'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationsToJson(Notifications instance) =>
    <String, dynamic>{
      'whatsapp': instance.contactwhatsapp,
      'phonenumber': instance.phonenumber,
      'call': instance.contactcall,
      'emailbool': instance.contactemail,
    };
