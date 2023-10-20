import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class InitialFormStatus extends LoginState {}

class LoginValidation extends LoginState {
  LoginValidation({required this.isValidEmail, required this.isValidPassword});
  final bool isValidEmail;
  final bool isValidPassword;
}

class FormSubmitting extends LoginState {}

class SubmissionSuccess extends LoginState {
  final User currentuser;
  SubmissionSuccess({required this.currentuser});
}

class SubmissionFailure extends LoginState {
}
