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

class SetEventParticipationEvent extends AuthenticationEvent {
  SetEventParticipationEvent({
    required this.eventId,
    required this.userId,
    required this.eventParticipant,
    required this.userData,
  });

  final String eventId;
  final String userId;
  final EventParticipant eventParticipant;
  final FFUser userData;

  @override
  List<Object> get props => <Object>[];
}

class RevokeEventParticipationEvent extends AuthenticationEvent {
  RevokeEventParticipationEvent({
    required this.eventId,
    required this.userId,
    required this.participation,
    required this.userData,
  });

  final String eventId;
  final String userId;
  final Map<String, dynamic> participation;
  final FFUser userData;

  @override
  List<Object> get props => <Object>[];
}

class UpdateUserProfileEvent extends AuthenticationEvent {
  UpdateUserProfileEvent(this.userId, {required this.userProfile});

  final String userId;
  final FFUser userProfile;
}

class InputChanged extends AuthenticationEvent {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phonenumber;
  final String? password;

  InputChanged({
    this.lastname,
    this.email,
    this.phonenumber,
    this.password,
    this.firstname,
  });
}

class Signup extends AuthenticationEvent {
  //User//
  final String email;
  final String password;
  //FFUser//
  final String firstname;
  final String lastname;
  final String profilPicture;
  final String birthday;
  final bool? newsletter;
  //Adress//
  final String streetname;
  final String zipCode;
  final String place;
  //Notifications//
  final bool? whatsapp;
  final bool? call;
  final bool? contactemail;
  final String phonenumber;
  //Enum LocalOrNot
  final LocalOrNewcomer localOrNewcomer;
  //Enum Socialmedia;
  final Socialmedia? socialmedia;

  Signup({
    //User//
    required this.password,
    required this.email,
    //FFUser//
    required this.firstname,
    required this.lastname,
    required this.profilPicture,
    required this.birthday,
    this.newsletter,
    //Adress//
    required this.streetname,
    required this.zipCode,
    required this.place,
    //Notfications//
    this.whatsapp,
    this.call,
    this.contactemail,
    required this.phonenumber,

    //Enum LocalOrNot
    required this.localOrNewcomer,
    //Enum Socialmedia
    this.socialmedia,
  });
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
