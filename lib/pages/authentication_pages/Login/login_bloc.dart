import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vs_femalefellows/pages/auth_page.dart';
import 'package:vs_femalefellows/pages/authentication_pages/Login/form_submission_status.dart';
import 'package:vs_femalefellows/pages/authentication_pages/Login/login_event.dart';
import 'package:vs_femalefellows/pages/authentication_pages/Login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Authpage? authpage;

  LoginBloc({this.authpage}) : super(LoginState());

  Stream<LoginState> signInWithEmailAndPassword(LoginEvent event) async* {
    // Username updated
    if (event is LoginEmailChanged) {
      yield state.copyWith(email: event.email);

      // Password updated
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form submitted
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authpage!.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailure(Exception()));
      }
    }
  }
}

