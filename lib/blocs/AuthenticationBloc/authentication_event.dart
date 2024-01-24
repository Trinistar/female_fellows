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
  const RegisterWithMailEvent({required this.email, required this.password, required this.profile,});

  final String email;
  final String password;
  final FFUser profile;

  @override
  String toString() {
    return 'RegisterWithMailEvent { email: $email }';
  }

  @override
  List<Object> get props => <Object>[email, password, profile];
}
