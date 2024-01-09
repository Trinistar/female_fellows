// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FFUser _$FFUserFromJson(Map<String, dynamic> json) => FFUser(
      favorites: (json['favorites'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lastname: json['lastname'] as String?,
      profilPicture: json['profilPicture'] as String?,
      birthday: json['birthday'] as String?,
      notification: json['notification'] == null
          ? null
          : Notifications.fromJson(
              json['notification'] as Map<String, dynamic>),
      email: json['email'] as String?,
      newsletter: json['newsletter'] as bool?,
      password: json['password'] as String?,
      firstname: json['firstname'] as String?,
      localOrNewcomer: $enumDecodeNullable(
          _$LocalOrNewcomerEnumMap, json['localOrNewcomer']),
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
      'newsletter': instance.newsletter,
      'password': instance.password,
      'address': instance.address?.toJson(),
      'localOrNewcomer': _$LocalOrNewcomerEnumMap[instance.localOrNewcomer],
      'socialmedia': _$SocialmediaEnumMap[instance.socialmedia],
      'favorites': instance.favorites,
    };

const _$LocalOrNewcomerEnumMap = {
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
