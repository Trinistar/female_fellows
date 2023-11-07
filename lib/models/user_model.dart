import 'package:json_annotation/json_annotation.dart';
import 'package:vs_femalefellows/models/address.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FFUser  {
  final String? firstname;
  final String? lastname;
  final String? profilPicture;
  final String? birthday;
  final bool? notification;
 String? email;
  final String? phonenumber;
  final bool? callOrText;
  final bool? meeting;
  final bool? safety;
  final String? password;
  final Address? address;
  
  FFUser({
    this.lastname,
    this.profilPicture,
    this.birthday,
    this.notification,
    this.email,
    this.phonenumber,
    this.callOrText,
    this.meeting,
    this.safety,
    this.password,
    this.firstname,
    this.address
  });

  factory FFUser.fromJson(Map<String, dynamic> json) =>
      _$FFUserFromJson(json);
  Map<String, dynamic> toJson() => _$FFUserToJson(this);


  List<Object?> get props => [
        email,
        firstname,
        lastname,
        phonenumber,
        password,
        profilPicture,
        notification,
        callOrText,
        safety,
        meeting,
        birthday,
        address
      ];
}
