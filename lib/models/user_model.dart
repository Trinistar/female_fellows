import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:language_picker/languages.dart';
import 'package:femalefellows/helper_functions.dart';
import 'package:femalefellows/models/address.dart';
import 'package:femalefellows/models/enums.dart';
import 'package:femalefellows/models/event_participant.dart';
import 'package:femalefellows/models/notifications.dart';
import 'package:femalefellows/models/tandem_match.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FFUser {
  FFUser({
    this.id,
    this.favorites = const [],
    this.participatingEvents = const [],
    this.lastname,
    this.profilPicture,
    this.birthday,
    this.notification,
    this.email,
    this.newsletter,
    this.firstname,
    this.localOrNewcomer,
    this.address,
    this.socialMedia,
    this.location,
    this.aboutMe = '',
    this.tandemTypeFilter = TandemTypeFilter.nearby,
    this.tandemMatch = 0.0,
    this.languages,
    this.localMatch,
    this.newcomerMatches,
    this.tandemMatches,
    this.matchConfirmed = false,
    this.eventParticipant,
    this.role = Role.USER,
    this.eventDateRange,
  });

  String? firstname;
  String? lastname;
  String? profilPicture;
  @JsonKey(
      fromJson: HelperFunctions.dateTimeFromTimestamp,
      toJson: HelperFunctions.dateTimeAsIs)
  Timestamp? birthday;
  Notifications? notification;
  String? email;
  bool? newsletter;
  Address? address;
  LocalOrNewcomer? localOrNewcomer;
  Socialmedia? socialMedia;
  @JsonKey(defaultValue: [])
  List<String> favorites;
  @JsonKey(defaultValue: [])
  List<String> participatingEvents;
  String? id;
  UserLocation? location;
  @JsonKey(defaultValue: '')
  String aboutMe;
  TandemTypeFilter? tandemTypeFilter;
  @JsonKey(includeFromJson: false, includeToJson: false)
  double? tandemMatch;
  UserLanguages? languages;
  String? localMatch;
  List<String>? newcomerMatches;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<TandemMatch>? tandemMatches;
  @JsonKey(defaultValue: false)
  bool matchConfirmed;
  EventParticipant? eventParticipant;
  Role? role;
  EventDateRange? eventDateRange;

  factory FFUser.fromJson(Map<String, dynamic> json) => _$FFUserFromJson(json);
  Map<String, dynamic> toJson() => _$FFUserToJson(this);

  List<Object?> get props => [
        id,
        favorites,
        participatingEvents,
        email,
        firstname,
        lastname,
        profilPicture,
        notification,
        newsletter,
        birthday,
        address,
        localOrNewcomer,
        socialMedia,
        aboutMe,
      ];
}

@JsonSerializable(explicitToJson: true)
class EventDateRange {
  EventDateRange({required this.start, required this.end});

  @JsonKey(
      fromJson: HelperFunctions.dateTimeFromTimestamp,
      toJson: HelperFunctions.dateTimeAsIs)
  final Timestamp start;
  @JsonKey(
      fromJson: HelperFunctions.dateTimeFromTimestamp,
      toJson: HelperFunctions.dateTimeAsIs)
  final Timestamp end;

  factory EventDateRange.fromJson(Map<String, dynamic> json) =>
      _$EventDateRangeFromJson(json);
  Map<String, dynamic> toJson() => _$EventDateRangeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserLanguages {
  UserLanguages({
    required this.main,
    required this.additional,
  });

  FFLanguage? main;
  List<FFLanguage>? additional;

  factory UserLanguages.fromJson(Map<String, dynamic> json) =>
      _$UserLanguagesFromJson(json);
  Map<String, dynamic> toJson() => _$UserLanguagesToJson(this);
}

@JsonSerializable()
class FFLanguage extends Language {
  FFLanguage(super.isoCode, super.name, super.nativeName);

  factory FFLanguage.fromJson(Map<String, dynamic> json) =>
      _$FFLanguageFromJson(json);
  Map<String, dynamic> toJson() => _$FFLanguageToJson(this);
}

/// An entity of Cloud Firestore location document.
class UserLocation {
  UserLocation({
    required this.data,
    required this.name,
    required this.isVisible,
  });

  factory UserLocation.fromJson(Map<String, dynamic> json) => UserLocation(
        data: GeoData.fromJson(
            (json['data'] ?? <String, dynamic>{}) as Map<String, dynamic>),
        name: json['name'] as String,
        isVisible: (json['isVisible'] ?? false) as bool,
      );

  factory UserLocation.fromDocumentSnapshot(
          DocumentSnapshot documentSnapshot) =>
      UserLocation.fromJson(documentSnapshot.data()! as Map<String, dynamic>);

  final GeoData? data;
  final String? name;
  final bool? isVisible;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data?.toJson(),
        'name': name,
        'isVisible': isVisible,
      };
}

/// An entity of `geo` field of Cloud Firestore location document.
class GeoData {
  GeoData({
    required this.geohash,
    required this.location,
  });

  factory GeoData.fromJson(Map<String, dynamic> json) => GeoData(
        geohash: (json['geohash'] ?? '') as String,
        location: (json['location'] ?? GeoPoint(0, 0)) as GeoPoint,
      );

  final String geohash;
  final GeoPoint location;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'geohash': geohash,
        'location': location,
      };
}
