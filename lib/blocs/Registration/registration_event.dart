part of 'registration_bloc.dart';

sealed class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class InputChanged extends RegistrationEvent {
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

  InputChanged(
  {   this.lastname,
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
}

class Signup extends RegistrationEvent {
  final String firstname;
  final String lastname;
  final String profilpicture;
  final String birthday;
  final String streetname;
  final String postcode;
  final String place;
  final bool notification;
  final String email;
  final String phonenumber;
  final bool callortext;
  final bool meeting;
  final bool safty;
  final String password;

  Signup(
      {required this.firstname,
      required this.password,
      required this.lastname,
      required this.profilpicture,
      required this.birthday,
      required this.streetname,
      required this.postcode,
      required this.place,
      required this.notification,
      required this.email,
      required this.phonenumber,
      required this.callortext,
      required this.meeting,
      required this.safty});
}
