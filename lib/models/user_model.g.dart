// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FFUser _$FFUserFromJson(Map<String, dynamic> json) => FFUser(
      id: json['id'] as String?,
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
      location: json['location'] == null
          ? null
          : UserLocation.fromJson(json['location'] as Map<String, dynamic>),
      aboutMe: json['aboutMe'] as String? ?? '',
      tandemTypeFilter: $enumDecodeNullable(
              _$TandemTypeFilterEnumMap, json['tandemTypeFilter']) ??
          TandemTypeFilter.nearby,
      languages: json['languages'] == null
          ? null
          : UserLanguages.fromJson(json['languages'] as Map<String, dynamic>),
      localMatch: json['localMatch'] as String?,
      newcomerMatches: (json['newcomerMatches'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      matchConfirmed: json['matchConfirmed'] as bool? ?? false,
      eventParticipant: json['eventParticipant'] == null
          ? null
          : EventParticipant.fromJson(
              json['eventParticipant'] as Map<String, dynamic>),
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']) ?? Role.USER,
      eventDateRange: json['eventDateRange'] == null
          ? null
          : EventDateRange.fromJson(
              json['eventDateRange'] as Map<String, dynamic>),
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
      'id': instance.id,
      'location': instance.location?.toJson(),
      'aboutMe': instance.aboutMe,
      'tandemTypeFilter': _$TandemTypeFilterEnumMap[instance.tandemTypeFilter],
      'languages': instance.languages?.toJson(),
      'localMatch': instance.localMatch,
      'newcomerMatches': instance.newcomerMatches,
      'matchConfirmed': instance.matchConfirmed,
      'eventParticipant': instance.eventParticipant?.toJson(),
      'role': _$RoleEnumMap[instance.role],
      'eventDateRange': instance.eventDateRange?.toJson(),
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

const _$TandemTypeFilterEnumMap = {
  TandemTypeFilter.all: 'all',
  TandemTypeFilter.nearby: 'nearby',
};

const _$RoleEnumMap = {
  Role.ADMIN: 'ADMIN',
  Role.USER: 'USER',
};

EventDateRange _$EventDateRangeFromJson(Map<String, dynamic> json) =>
    EventDateRange(
      start: HelperFunctions.dateTimeFromTimestamp(json['start'] as Timestamp?),
      end: HelperFunctions.dateTimeFromTimestamp(json['end'] as Timestamp?),
    );

Map<String, dynamic> _$EventDateRangeToJson(EventDateRange instance) =>
    <String, dynamic>{
      'start': HelperFunctions.dateTimeAsIs(instance.start),
      'end': HelperFunctions.dateTimeAsIs(instance.end),
    };

UserLanguages _$UserLanguagesFromJson(Map<String, dynamic> json) =>
    UserLanguages(
      main: json['main'] == null
          ? null
          : FFLanguage.fromJson(json['main'] as Map<String, dynamic>),
      additional: (json['additional'] as List<dynamic>?)
          ?.map((e) => FFLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserLanguagesToJson(UserLanguages instance) =>
    <String, dynamic>{
      'main': instance.main?.toJson(),
      'additional': instance.additional?.map((e) => e.toJson()).toList(),
    };

FFLanguage _$FFLanguageFromJson(Map<String, dynamic> json) => FFLanguage(
      json['isoCode'] as String,
      json['name'] as String,
      json['nativeName'] as String? ?? json['name'] as String,
    );

Map<String, dynamic> _$FFLanguageToJson(FFLanguage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isoCode': instance.isoCode,
      'nativeName': instance.nativeName,
    };
