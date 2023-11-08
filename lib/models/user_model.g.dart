// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FFUser _$FFUserFromJson(Map<String, dynamic> json) => FFUser(
      lastname: json['lastname'] as String?,
      profilPicture: json['profilPicture'] as String?,
      birthday: json['birthday'] as String?,
      notification: json['notification'] == null
          ? null
          : Notifications.fromJson(
              json['notification'] as Map<String, dynamic>),
      email: json['email'] as String?,
      safety: json['safety'] as bool?,
      password: json['password'] as String?,
      firstname: json['firstname'] as String?,
      localOrNewcomer: $enumDecodeNullable(_$LocalOrNotEnumMap, json['localOrNot']),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      socialmedia:
          $enumDecodeNullable(_$SocialmediaEnumMap, json['socialmedia']),
    );

Map<String, dynamic> _$FFUserToJson(FFUser instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'profilPicture': instance.profilPicture,
      'birthday': instance.birthday,
      'notification': instance.notification?.toJson(),
      'email': instance.email,
      'safety': instance.safety,
      'password': instance.password,
      'address': instance.address?.toJson(),
      'localOrNot': _$LocalOrNotEnumMap[instance.localOrNewcomer],
      'socialmedia': _$SocialmediaEnumMap[instance.socialmedia],
    };

const _$LocalOrNotEnumMap = {
  LocalOrNewcomer.local: 'local',
  LocalOrNewcomer.newcomer: 'newcomer',
};

const _$SocialmediaEnumMap = {
  Socialmedia.insta: 'insta',
  Socialmedia.facebook: 'facebook',
  Socialmedia.linkedin: 'linkedin',
  Socialmedia.newspaper: 'newspaper',
  Socialmedia.friends: 'friends',
  Socialmedia.everythingelse: 'everythingelse',
};
