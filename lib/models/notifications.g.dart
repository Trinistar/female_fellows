// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notifications _$NotificationsFromJson(Map<String, dynamic> json) =>
    Notifications(
      contactViaWhatsApp: json['contactViaWhatsApp'] as bool? ?? false,
      contactViaPhone: json['contactViaPhone'] as bool? ?? false,
      phonenumber: json['phonenumber'] as String? ?? '',
      contactViaEmail: json['contactViaEmail'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationsToJson(Notifications instance) =>
    <String, dynamic>{
      'contactViaWhatsApp': instance.contactViaWhatsApp,
      'phonenumber': instance.phonenumber,
      'contactViaPhone': instance.contactViaPhone,
      'contactViaEmail': instance.contactViaEmail,
    };
