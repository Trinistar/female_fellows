part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthenticationUserChangedEvent extends AuthenticationEvent {
  const AuthenticationUserChangedEvent(this.user);

  final User? user;
}

class SignOutEvent extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
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
}

class SetTandemMatchEvent extends AuthenticationEvent {
  SetTandemMatchEvent({
    required this.tandemMatch,
    required this.profile,
    this.otherId,
  });

  final Map<String, dynamic> tandemMatch;
  final FFUser profile;
  final String? otherId;
}

class UpdateTandemMatchEvent extends AuthenticationEvent {
  UpdateTandemMatchEvent({
    required this.update,
    required this.profile,
  });

  final Map<String, dynamic> update;
  final FFUser profile;
}

class UpdateUserProfileEvent extends AuthenticationEvent {
  UpdateUserProfileEvent(this.userId, {this.latitude, this.longitude, required this.userProfile});

  final String userId;
  final FFUser userProfile;
  final double? latitude;
  final double? longitude;
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

class RegisterWithMailEvent extends AuthenticationEvent {
  const RegisterWithMailEvent(
    this.picture, {
    required this.email,
    required this.password,
    required this.profile,
  });

  final String email;
  final String password;
  final FFUser profile;
  final XFile? picture;

  @override
  String toString() {
    return 'RegisterWithMailEvent { email: $email }';
  }
}
