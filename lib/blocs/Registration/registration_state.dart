part of 'registration_bloc.dart';

sealed class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

final class RegistrationInitial extends RegistrationState {}

class FormSignup extends RegistrationState {}

class SignUpSuccess extends RegistrationState {
  final User currentuser;

  SignUpSuccess({required this.currentuser});
}

class SignUpFailure extends RegistrationState {}



/* class RegistrationValidation extends RegistrationState {
  RegistrationValidation({required this.isValidEmail, required this.isValidPassword});
  final bool isValidEmail;
  final bool isValidPassword;
} */