import 'package:firebase_auth/firebase_auth.dart';


class FFUser  {
  final String? firstname;
  final String? lastname;
  final String? profilpicture;
  final String? birthday;
  final String? streetname;
  final String? postcode;
  final String? place;
  final bool? notification;
  final String? email;
  final String? phonenumber;
  final bool? callortext;
  final bool? meeting;
  final bool? safty;
  final String? password;
  
   FFUser({
    this.lastname,
    this.profilpicture,
    this.birthday,
    this.streetname,
    this.postcode,
    this.notification,
    this.place,
    this.email,
    this.phonenumber,
    this.callortext,
    this.meeting,
    this.safty,
    this.password,
    this.firstname,
  });


  List<Object?> get props => [
        email,
        firstname,
        lastname,
        phonenumber,
        password,
        profilpicture,
        streetname,
        place,
        postcode,
        notification,
        callortext,
        safty,
        meeting,
        birthday,
      ];
}
