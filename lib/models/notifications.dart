import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications.g.dart';

@JsonSerializable()
@immutable
class  Notifications {
  const Notifications({
    this.contactViaWhatsApp = false,
    this.contactViaPhone =false,
    this.phonenumber = '',
    this.contactViaEmail= false,
  });
  factory Notifications.fromJson(Map<String,dynamic> json)=>_$NotificationsFromJson(json);
  Map<String, dynamic> toJson()=> _$NotificationsToJson(this);

@JsonKey(defaultValue:false)
final bool contactViaWhatsApp;
@JsonKey(defaultValue:'')
final String phonenumber ;
@JsonKey(defaultValue:false)
final bool contactViaPhone;
@JsonKey(defaultValue:false)
final bool contactViaEmail;

  
}