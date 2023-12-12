import 'package:json_annotation/json_annotation.dart';
import 'package:vs_femalefellows/models/address.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/notifications.dart';



part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FFUser {
  final String? firstname;
  final String? lastname;
  final String? profilPicture;
  final String? birthday;
  final Notifications? notification;
  String? email;
  final bool? newsletter;
  final String? password;
  final Address? address;
  final LocalOrNewcomer? localOrNewcomer;
  final Socialmedia? socialmedia;
  final List<String> favorites = List.empty(growable: true);

  FFUser({
    this.lastname,
    this.profilPicture,
    this.birthday,
    this.notification,
    this.email,
    this.newsletter,
    this.password,
    this.firstname,
    this.localOrNewcomer,
    this.address,
    this.socialmedia,
  });

  factory FFUser.fromJson(Map<String, dynamic> json) => _$FFUserFromJson(json);
  Map<String, dynamic> toJson() => _$FFUserToJson(this);

  List<Object?> get props => [
    favorites,
        email,
        firstname,
        lastname,
        password,
        profilPicture,
        notification,
        newsletter,
        birthday,
        address,
        localOrNewcomer,
        socialmedia,
      ];
}
