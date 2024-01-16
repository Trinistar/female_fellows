import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vs_femalefellows/models/address.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/event_participant.dart';
import 'package:vs_femalefellows/models/notifications.dart';
import 'package:vs_femalefellows/provider/firestore/authrepository.dart';
import 'package:vs_femalefellows/provider/controller.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event_repository.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_user_profile_repository.dart';
import 'package:vs_femalefellows/models/user_model.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required AuthRepository authenticationRepository})
      : _authenticationProvider = authenticationRepository,
        super(
          authenticationRepository.currentUser != null ? AuthenticatedUser(user: authenticationRepository.currentUser!) : UnauthenticatedUser(),
        ) {
    on<Signup>(_onSignUp);
    on<AuthenticationUserChangedEvent>(_onAuthenticationUserChanged);
    on<SignOutEvent>(_onSignOutEvent);
    on<UpdateUserProfileEvent>(_onUpdateUserProfile);
    on<SetEventParticipationEvent>(_onSetEventParticipationEvent);

    _userSubscription = _authenticationProvider.user.listen((User? user) => add(AuthenticationUserChangedEvent(user)));
  }
  final AuthRepository _authpage = AuthRepository();

  final FirestoreUserProfileRepository _firestoreUserProfileRepository = FirestoreUserProfileRepository();

  final FirestoreEventRepository _firestoreEventRepository = FirestoreEventRepository();

  StreamSubscription<User?>? _userSubscription;

  final AuthRepository _authenticationProvider;

  Future<void> _onAuthenticationUserChanged(AuthenticationUserChangedEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());

    if (event.user != null) {
      final IdTokenResult tokenResult = await event.user!.getIdTokenResult();

      await emit.onEach(_firestoreUserProfileRepository.loadUserProfile(event.user!.uid), onData: (FFUser? userProfile) async {
        emit(AuthenticatedUser(user: event.user!, userProfile: userProfile!, tokenResult: tokenResult));
      });
    } else {
      emit(UnauthenticatedUser());
    }
  }

  Future<void> _onUpdateUserProfile(UpdateUserProfileEvent event, Emitter<AuthenticationState> emit) async {
    try {
      await _firestoreUserProfileRepository.updateUserProfile(event.userProfile, userID: event.userId);
    } catch (_) {}
  }

  Future<void> _onSignUp(Signup event, Emitter<AuthenticationState> emit) async {
    emit(FormSignup());
    try {
      FFUser userdata = FFUser(
        firstname: Controller.firstnameController.text,
        lastname: Controller.lastnameController.text,
        profilPicture: Controller.profilpictureController.text,
        birthday: Controller.birthdayController.text,
        newsletter: event.newsletter,
        //Adress//
        address: Address(street: Controller.streetnameController.text, zipCode: Controller.zipCodeController.text, city: Controller.placeController.text),
        //Notification
        notification: Notifications(
          phonenumber: Controller.phonenumberController.text,
          contactemail: false,
          contactcall: false,
          contactwhatsapp: false,
        ),
        //Enum LocalOrNot
        localOrNewcomer: event.localOrNewcomer,
        //Enum Socailmedia
        socialmedia: event.socialmedia,
      );

      final User? currentuser = await _authpage.signUp(email: event.email, password: event.password);
      if (currentuser != null) {
        userdata.email = currentuser.email;
        await _firestoreUserProfileRepository.updateUserProfile(userdata, userID: currentuser.uid);
        emit(SignUpSuccess(currentuser: currentuser, userdata: userdata));
      } else {
        emit(SignUpFailure());
      }
    } catch (e) {
      emit(SignUpFailure());
    }
  }

  Future<void> _onSetEventParticipationEvent(SetEventParticipationEvent event, Emitter<AuthenticationState> emit) async {
    try {
      await _firestoreEventRepository.setEventParticipation(event.userId, event.eventId, event.eventParticipant);

      final FFUser userProfile = event.userData;
      List<String> partEvents = userProfile.participatingEvents;

      if (event.eventParticipant.participating) {
        partEvents.add(event.eventId);
      } else {
        partEvents.remove(event.eventId);
      }
      userProfile.participatingEvents = partEvents;
      await _firestoreUserProfileRepository.updateUserProfile(userProfile, userID: event.userId);
    } catch (_) {}
  }

  Future<void> _onSignOutEvent(SignOutEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      _authenticationProvider.logOut();
      emit(SignOutSuccess());
    } catch (error) {
      //emit(state.copyWith(errorCode: AuthenticationErrorCode.SIGN_OUT_FAILED, error: error.toString()) as AuthenticationState);
      //emit(const UnauthenticatedUser());
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
