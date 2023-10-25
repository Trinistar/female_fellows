import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vs_femalefellows/services/authrepository.dart';
import 'package:vs_femalefellows/services/controller.dart';
import 'package:vs_femalefellows/services/user_model.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AuthRepository _authpage = AuthRepository();
  RegistrationBloc() : super(RegistrationInitial()) {
    on<Signup>((event, emit) async {
      emit(FormSignup());
      try {
        FFUser userdata = FFUser(
          password: Controller.passwordController.text,
          lastname: Controller.lastnameController.text,
          profilpicture: Controller.profilpictureController.text,
          birthday: Controller.birthdayController.text,
          streetname: Controller.streetnameController.text,
          postcode: Controller.postcodeController.text,
          place: Controller.placeController.text,
          notification: false,
          phonenumber: Controller.phonenumberController.text,
          callortext: false,
          meeting: false,
          safty: false,
          email: Controller.emailController.text,
          firstname: Controller.firstnameController.text,
        );
        
        final User? currentuser = await _authpage.signUp(
            email: event.email, password: event.password);
        if (currentuser != null) {
          userdata.email = currentuser.email;
          emit(SignUpSuccess(currentuser: currentuser, userdata: userdata));
        } else {
          emit(SignUpFailure());
        }
      } catch (e) {
        emit(SignUpFailure());
      }
    });
  }
}
