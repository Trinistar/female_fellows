// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FFUser _$FFUserFromJson(Map<String, dynamic> json) => FFUser(
      lastname: json['lastname'] as String?,
      profilPicture: json['profilpicture'] as String?,
      birthday: json['birthday'] as String?,
      streetname: json['streetname'] as String?,
      postcode: json['postcode'] as String?,
      notification: json['notification'] as bool?,
      place: json['place'] as String?,
      email: json['email'] as String?,
      phonenumber: json['phonenumber'] as String?,
      callOrText: json['callortext'] as bool?,
      meeting: json['meeting'] as bool?,
      safety: json['safty'] as bool?,
      password: json['password'] as String?,
      firstname: json['firstname'] as String?,
    );

Map<String, dynamic> _$FFUserToJson(FFUser instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'profilpicture': instance.profilPicture,
      'birthday': instance.birthday,
      'streetname': instance.streetname,
      'postcode': instance.postcode,
      'place': instance.place,
      'notification': instance.notification,
      'email': instance.email,
      'phonenumber': instance.phonenumber,
      'callortext': instance.callOrText,
      'meeting': instance.meeting,
      'safty': instance.safety,
      'password': instance.password,
    };
