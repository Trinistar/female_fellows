// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FFUser _$FFUserFromJson(Map<String, dynamic> json) => FFUser(
      favorites: (json['favorites'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      participatingEvents: (json['participatingEvents'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      lastname: json['lastname'] as String?,
      profilPicture: json['profilPicture'] as String?,
      birthday:
          HelperFunctions.dateTimeFromTimestamp(json['birthday'] as Timestamp?),
      notification: json['notification'] == null
          ? null
          : Notifications.fromJson(
              json['notification'] as Map<String, dynamic>),
      email: json['email'] as String?,
      newsletter: json['newsletter'] as bool?,
      firstname: json['firstname'] as String?,
      localOrNewcomer: $enumDecodeNullable(
          _$LocalOrNewcomerEnumMap, json['localOrNewcomer']),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      socialMedia:
          $enumDecodeNullable(_$SocialmediaEnumMap, json['socialMedia']),
    );

Map<String, dynamic> _$FFUserToJson(FFUser instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'profilPicture': instance.profilPicture,
      'birthday': HelperFunctions.dateTimeAsIs(instance.birthday),
      'notification': instance.notification?.toJson(),
      'email': instance.email,
      'newsletter': instance.newsletter,
      'address': instance.address?.toJson(),
      'localOrNewcomer': _$LocalOrNewcomerEnumMap[instance.localOrNewcomer],
      'socialMedia': _$SocialmediaEnumMap[instance.socialMedia],
      'favorites': instance.favorites,
      'participatingEvents': instance.participatingEvents,
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
