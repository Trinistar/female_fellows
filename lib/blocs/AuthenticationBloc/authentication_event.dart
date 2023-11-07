part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class AuthenticationUserChangedEvent extends AuthenticationEvent {
  const AuthenticationUserChangedEvent(this.user);

  final User? user;

  @override
  List<Object?> get props => <Object?>[user];
}

class SignOutEvent extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';

  @override
  List<Object> get props => <Object>[];
}

class InputChanged extends AuthenticationEvent {
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

  InputChanged({
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
}

class Signup extends AuthenticationEvent {
  final String firstname;
  final String lastname;
  final String profilPicture;
  final String birthday;
  final String streetname;
  final String postcode;
  final String place;
  final bool? notification;
final String email;
  final String phonenumber;
  final bool? callOrText;
  final bool? meeting;
  final bool? safety;
  final String password;

  Signup(
      {required this.firstname,
      required this.password,
      required this.lastname,
      required this.profilPicture,
      required this.birthday,
      required this.streetname,
      required this.postcode,
      required this.place,
      this.notification,
      required this.email,
      required this.phonenumber,
      this.callOrText,
      this.meeting,
      this.safety});
}

class SignInWithMailEvent extends AuthenticationEvent {
  const SignInWithMailEvent({required this.email, required this.password});

  final String email;
  final String password;

  @override
  String toString() {
    return 'LogInWithMailEvent { email: $email }';
  }

  @override
  List<Object> get props => <Object>[email, password];
}

class RegisterWithMailEvent extends AuthenticationEvent {
  const RegisterWithMailEvent({required this.email, required this.password});

  final String email;
  final String password;

  @override
  String toString() {
    return 'RegisterWithMailEvent { email: $email }';
  }

  @override
  List<Object> get props => <Object>[email, password];
}
