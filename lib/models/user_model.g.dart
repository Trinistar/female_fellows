// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FFUser _$FFUserFromJson(Map<String, dynamic> json) => FFUser(
      lastname: json['lastname'] as String?,
      profilPicture: json['profilPicture'] as String?,
      birthday: json['birthday'] as String?,
      notification: json['notification'] as bool?,
      email: json['email'] as String?,
      phonenumber: json['phonenumber'] as String?,
      callOrText: json['callOrText'] as bool?,
      meeting: json['meeting'] as bool?,
      safety: json['safety'] as bool?,
      password: json['password'] as String?,
      firstname: json['firstname'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FFUserToJson(FFUser instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'profilPicture': instance.profilPicture,
      'birthday': instance.birthday,
      'notification': instance.notification,
      'email': instance.email,
      'phonenumber': instance.phonenumber,
      'callOrText': instance.callOrText,
      'meeting': instance.meeting,
      'safety': instance.safety,
      'password': instance.password,
      'address': instance.address?.toJson(),
    };
