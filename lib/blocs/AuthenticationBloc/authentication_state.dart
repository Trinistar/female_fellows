part of 'authentication_bloc.dart';

sealed class AuthenticationState {
  const AuthenticationState();
}

final class AuthenticationInitial extends AuthenticationState {}

class FormSignup extends AuthenticationState {}

class SignUpSuccess extends AuthenticationState {
  final User currentuser;
  final FFUser userdata;

  SignUpSuccess({required this.currentuser, required this.userdata});
}

class SignUpFailure extends AuthenticationState {}

class SignOutSuccess extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationLoadingFromLogin extends AuthenticationState {}

class Reauthenticate extends AuthenticationState {}

class UnauthenticatedUser extends AuthenticationState {
  UnauthenticatedUser({required this.userProfile});

  final FFUser? userProfile;
}

class AuthenticatedUser extends AuthenticationState {
  AuthenticatedUser({
    this.userProfile,
    this.user,
    this.tokenResult,
  });

  final User? user;
  final IdTokenResult? tokenResult;
  final FFUser? userProfile;

  AuthenticatedUser copyWith({
    User? user,
    IdTokenResult? tokenResult,
    FFUser? userProfile,
  }) {
    return AuthenticatedUser(
      userProfile: userProfile ?? this.userProfile,
      user: user ?? this.user,
      tokenResult: tokenResult ?? this.tokenResult,
    );
  }
}


/* class RegistrationValidation extends RegistrationState {
  RegistrationValidation({required this.isValidEmail, required this.isValidPassword});
  final bool isValidEmail;
  final bool isValidPassword;
} */