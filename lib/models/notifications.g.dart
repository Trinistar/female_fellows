// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notifications _$NotificationsFromJson(Map<String, dynamic> json) =>
    Notifications(
      contactwhatsapp: json['contactwhatsapp'] as bool? ?? false,
      contactcall: json['contactcall'] as bool? ?? false,
      phonenumber: json['phonenumber'] as String? ?? '',
      contactemail: json['contactemail'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationsToJson(Notifications instance) =>
    <String, dynamic>{
      'contactwhatsapp': instance.contactwhatsapp,
      'phonenumber': instance.phonenumber,
      'contactcall': instance.contactcall,
      'contactemail': instance.contactemail,
    };
