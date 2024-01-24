import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:vs_femalefellows/models/event_participant.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:vs_femalefellows/provider/firestore/authrepository.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event_repository.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_user_profile_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required AuthRepository authenticationRepository})
      : _authenticationProvider = authenticationRepository,
        super(
          authenticationRepository.currentUser != null ? AuthenticatedUser(user: authenticationRepository.currentUser!) : UnauthenticatedUser(),
        ) {
    on<RegisterWithMailEvent>(_onRegisterWithMailEvent);
    on<AuthenticationUserChangedEvent>(_onAuthenticationUserChanged);
    on<SignOutEvent>(_onSignOutEvent);
    on<UpdateUserProfileEvent>(_onUpdateUserProfile);
    on<SetEventParticipationEvent>(_onSetEventParticipationEvent);
    on<RevokeEventParticipationEvent>(_onRevokeEventParticipationEvent);

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

  Future<String> _getCityStringFromCoords(GeoPoint coords) async {
    final List<Placemark> placemarks = await placemarkFromCoordinates(coords.latitude, coords.longitude, localeIdentifier: 'de_de');
    final String? address = (placemarks.first.subLocality != null && placemarks.first.subLocality!.isNotEmpty) ? '${placemarks.first.subLocality}, ${placemarks.first.locality}' : placemarks.first.locality;
    return address ?? '';
  }

  Future<void> _onUpdateUserProfile(UpdateUserProfileEvent event, Emitter<AuthenticationState> emit) async {
    try {
      final FFUser updated = event.userProfile;

      if (event.latitude != null && event.longitude != null) {
        final String address = await _getCityStringFromCoords(GeoPoint(event.latitude!, event.longitude!));
        final GeoFirePoint geoFirePoint = GeoFirePoint(GeoPoint(event.latitude!, event.longitude!));
        final UserLocation location = UserLocation(geo: Geo(geohash: geoFirePoint.geohash, geopoint: GeoPoint(event.latitude!, event.longitude!)), name: address, isVisible: true);
        updated.location = location;
      }

      await _firestoreUserProfileRepository.updateUserProfile(updated, userID: event.userId);
    } catch (_) {}
  }

  Future<void> _onRegisterWithMailEvent(RegisterWithMailEvent event, Emitter<AuthenticationState> emit) async {
    //emit(FormSignup());
    emit(AuthenticationLoading());

    try {
      FFUser userdata = event.profile;

      final User? currentuser = await _authpage.signUp(email: event.email, password: event.password);
      if (currentuser != null) {
        userdata.email = currentuser.email;
        final IdTokenResult tokenResult = await currentuser.getIdTokenResult();
        await _firestoreUserProfileRepository.updateUserProfile(userdata, userID: currentuser.uid);
        emit(AuthenticatedUser(user: currentuser, userProfile: userdata, tokenResult: tokenResult));
      } else {
        emit(UnauthenticatedUser());
      }
    } catch (e) {
      emit(UnauthenticatedUser());
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

  Future<void> _onRevokeEventParticipationEvent(RevokeEventParticipationEvent event, Emitter<AuthenticationState> emit) async {
    try {
      await _firestoreEventRepository.revokeEventParticipation(event.userId, event.eventId, event.participation);

      final FFUser userProfile = event.userData;
      List<String> partEvents = userProfile.participatingEvents;

      partEvents.remove(event.eventId);

      userProfile.participatingEvents = partEvents;
      await _firestoreUserProfileRepository.updateUserProfile(userProfile, userID: event.userId);
    } catch (_) {}
  }

  Future<void> _onSignOutEvent(SignOutEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      _authenticationProvider.logOut();
      emit(UnauthenticatedUser());
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
