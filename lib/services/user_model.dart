import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class FFUser  {
  final String? firstname;
  final String? lastname;
  final String? profilPicture;
  final String? birthday;
  final String? streetname;
  final String? postcode;
  final String? place;
  final bool? notification;
 String? email;
  final String? phonenumber;
  final bool? callOrText;
  final bool? meeting;
  final bool? safety;
  final String? password;
  
  FFUser({
    this.lastname,
    this.profilPicture,
    this.birthday,
    this.streetname,
    this.postcode,
    this.notification,
    this.place,
    this.email,
    this.phonenumber,
    this.callOrText,
    this.meeting,
    this.safety,
    this.password,
    this.firstname,
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
        streetname,
        place,
        postcode,
        notification,
        callOrText,
        safety,
        meeting,
        birthday,
      ];
}
