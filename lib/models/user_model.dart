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
  final bool? safety;
  final String? password;
  final Address? address;
  final LocalOrNewcomer? localOrNewcomer;
  final Socialmedia? socialmedia;

  FFUser({
    this.lastname,
    this.profilPicture,
    this.birthday,
    this.notification,
    this.email,
    this.safety,
    this.password,
    this.firstname,
    this.localOrNewcomer,
    this.address,
    this.socialmedia,
  });

  factory FFUser.fromJson(Map<String, dynamic> json) => _$FFUserFromJson(json);
  Map<String, dynamic> toJson() => _$FFUserToJson(this);

  List<Object?> get props => [
        email,
        firstname,
        lastname,
        password,
        profilPicture,
        notification,
        safety,
        birthday,
        address,
        localOrNewcomer,
        socialmedia,
      ];
}
