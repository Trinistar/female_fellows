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

  FFUser({
    this.favorites = const[],
    this.participatingEvents = const[],
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
  });

  factory FFUser.fromJson(Map<String, dynamic> json) => _$FFUserFromJson(json);
  Map<String, dynamic> toJson() => _$FFUserToJson(this);

  List<Object?> get props => [
        favorites,
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
