import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vs_femalefellows/services/authrepository.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
    final AuthRepository _authpage = AuthRepository();
  RegistrationBloc() : super(RegistrationInitial()) {
    on<Signup>((event, emit)async { 
     emit(FormSignup());
      try {
        final User? currentuser =
            await _authpage.signUp(email: event.email, password: event.password);
        if (currentuser != null) {
          emit(SignUpSuccess(currentuser: currentuser));
        } else {
          emit(SignUpFailure());
        }
      } catch (e) {
        emit(SignUpFailure());
      }
    });
  }
}
