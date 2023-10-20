abstract class LoginEvent {}

class LoginEmailChanged extends LoginEvent {
  final String? email;

  LoginEmailChanged({this.email});
}

class LoginPasswordChanged extends LoginEvent {
  final String? password;

  LoginPasswordChanged({this.password});
}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;
  LoginSubmitted({required this.email, required this.password});
}
