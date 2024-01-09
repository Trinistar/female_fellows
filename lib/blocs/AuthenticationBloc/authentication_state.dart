part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

class FormSignup extends AuthenticationState {}

class SignUpSuccess extends AuthenticationState {
  final User currentuser;
  final FFUser userdata;

  SignUpSuccess({required this.currentuser, required this.userdata});
}

class SignUpFailure extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class UnauthenticatedUser extends AuthenticationState {}

class AuthenticatedUser extends AuthenticationState {
  AuthenticatedUser({
    required this.user,
    this.tokenResult,
  });

  final User? user;
  final IdTokenResult? tokenResult;
}


/* class RegistrationValidation extends RegistrationState {
  RegistrationValidation({required this.isValidEmail, required this.isValidPassword});
  final bool isValidEmail;
  final bool isValidPassword;
} */