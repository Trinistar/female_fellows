import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vs_femalefellows/helper_functions.dart';
import 'package:vs_femalefellows/models/address.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/notifications.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FFUser {
  final String? firstname;
  final String? lastname;
  final String? profilPicture;
  @JsonKey(fromJson: HelperFunctions.dateTimeFromTimestamp, toJson: HelperFunctions.dateTimeAsIs)
  final Timestamp? birthday;
  final Notifications? notification;
  String? email;
  final bool? newsletter;
  final Address? address;
  final LocalOrNewcomer? localOrNewcomer;
  final Socialmedia? socialMedia;
  @JsonKey(defaultValue: [])
  List<String> favorites;
  @JsonKey(defaultValue: [])
  List<String> participatingEvents;
  String? id;
  UserLocation? location;
  

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
  });

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
      ];
}

/// An entity of Cloud Firestore location document.
class UserLocation {
  UserLocation({
    required this.geo,
    required this.name,
    required this.isVisible,
  });

  factory UserLocation.fromJson(Map<String, dynamic> json) => UserLocation(
        geo: Geo.fromJson(json['geo'] as Map<String, dynamic>),
        name: json['name'] as String,
        isVisible: (json['isVisible'] ?? false) as bool,
      );

  factory UserLocation.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) =>
      UserLocation.fromJson(documentSnapshot.data()! as Map<String, dynamic>);

  final Geo geo;
  final String name;
  final bool isVisible;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'geo': geo.toJson(),
        'name': name,
        'isVisible': isVisible,
      };
}

/// An entity of `geo` field of Cloud Firestore location document.
class Geo {
  Geo({
    required this.geohash,
    required this.geopoint,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        geohash: json['geohash'] as String,
        geopoint: json['geopoint'] as GeoPoint,
      );

  final String geohash;
  final GeoPoint geopoint;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'geohash': geohash,
        'geopoint': geopoint,
      };
}
