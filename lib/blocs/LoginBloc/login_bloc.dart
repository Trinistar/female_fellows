import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/blocs/LoginBloc/login_event.dart';
import 'package:vs_femalefellows/blocs/LoginBloc/login_state.dart';
import 'package:vs_femalefellows/services/authrepository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authpage = AuthRepository();

  LoginBloc() : super(InitialFormStatus()) {
    on<LoginEmailChanged>((event, emit) {
      print(event.email);
      if (event.email!.length >= 3) {
        emit(LoginValidation(
          isValidEmail: true,
          isValidPassword: true,
        ));
      } else {
        emit(LoginValidation(
          isValidEmail: false,
          isValidPassword: false,
        ));
      }
    });
    on<LoginPasswordChanged>(((event, emit) {
      if (event.password!.length >= 3) {
        emit(LoginValidation(
          isValidEmail: true,
          isValidPassword: true,
        ));
      } else {
        emit(LoginValidation(
          isValidEmail: false,
          isValidPassword: false,
        ));
      }
    }));
    on<LoginSubmitted>((event, emit) async {
      emit(FormSubmitting());
      try {
        final User? currentuser =
            await _authpage.login(email: event.email, password: event.password);
        if (currentuser != null) {
          emit(SubmissionSuccess(currentuser: currentuser));
        } else {
          emit(SubmissionFailure());
        }
      } catch (e) {
        emit(SubmissionFailure());
      }
    });
  }
}
