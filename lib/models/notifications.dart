import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications.g.dart';

@JsonSerializable()
@immutable
class  Notifications {
  const Notifications({
    this.contactwhatsapp = false,
    this.contactcall =false,
    this.phonenumber = '',
    this.contactemail= false,
  });
  factory Notifications.fromJson(Map<String,dynamic> json)=>_$NotificationsFromJson(json);
  Map<String, dynamic> toJson()=> _$NotificationsToJson(this);

@JsonKey(defaultValue:false)
final bool contactwhatsapp;
@JsonKey(defaultValue:'')
final String phonenumber ;
@JsonKey(defaultValue:false)
final bool contactcall;
@JsonKey(defaultValue:false)
final bool contactemail;

  
}