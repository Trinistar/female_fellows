import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vs_femalefellows/models/address.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/event_participant.dart';
import 'package:vs_femalefellows/models/tandem_match.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:vs_femalefellows/provider/firestore/authrepository.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_event_repository.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_tandem_repository.dart';
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
    on<SetTandemMatchEvent>(_onSetTandemMatchEvent);

    _userSubscription = _authenticationProvider.user.listen((User? user) => add(AuthenticationUserChangedEvent(user)));
  }
  final AuthRepository _authpage = AuthRepository();
  final FirestoreUserProfileRepository _firestoreUserProfileRepository = FirestoreUserProfileRepository();
  final FirestoreEventRepository _firestoreEventRepository = FirestoreEventRepository();
  final FirestoreTandemRepository _firestoreTandemRepository = FirestoreTandemRepository();

  StreamSubscription<User?>? _userSubscription;

  final AuthRepository _authenticationProvider;

  Future<void> _onAuthenticationUserChanged(AuthenticationUserChangedEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());

    if (event.user != null) {
      final IdTokenResult tokenResult = await event.user!.getIdTokenResult();

      await emit.onEach(
        CombineLatestStream.list(<Stream>[_firestoreUserProfileRepository.loadUserProfile(event.user!.uid), _firestoreUserProfileRepository.loadUserProfileLocationData(event.user!.uid)]),
        onData: (List<dynamic> streams) async {
          UserLocation location = UserLocation(data: GeoData(geohash: '', location: GeoPoint(0, 0)), name: '', isVisible: true);
          final FFUser profile = streams[0];
          if (streams[1] != null) {
            location = streams[1];
          }
          _firestoreUserProfileRepository.loadTandemMatches(event.user!.uid, profile.localOrNewcomer!).listen((event) async {
            profile.tandemMatches = event;
            if (profile.tandemMatches != null) {
              profile.tandemMatches!.first.otherProfile = await _firestoreUserProfileRepository.getUserProfile(profile.tandemMatches!.first.otherUserId);
            }
          });

          profile.location = location;
          emit(AuthenticatedUser(user: event.user!, userProfile: profile, tokenResult: tokenResult));
        },
      );
    } else {
      emit(UnauthenticatedUser());
    }
  }

  Future<Address> _getCityStringFromCoords(GeoPoint coords) async {
    final List<Placemark> placemarks = await placemarkFromCoordinates(coords.latitude, coords.longitude, localeIdentifier: 'de_de');
    final Address address = Address(
      city: placemarks.first.locality!,
      street: placemarks.first.street!,
      zipCode: placemarks.first.postalCode!,
    );
    //final String? address = (placemarks.first.subLocality != null && placemarks.first.subLocality!.isNotEmpty) ? '${placemarks.first.subLocality}, ${placemarks.first.locality}' : placemarks.first.locality;
    return address;
  }

  Future<void> _onUpdateUserProfile(UpdateUserProfileEvent event, Emitter<AuthenticationState> emit) async {
    try {
      final FFUser updated = event.userProfile;

      if (event.latitude != null && event.longitude != null) {
        final Address address = await _getCityStringFromCoords(GeoPoint(event.latitude!, event.longitude!));
        //final GeoFirePoint geoFirePoint = GeoFirePoint(GeoPoint(event.latitude!, event.longitude!));
        //final UserLocation location = UserLocation(data: GeoData(geohash: geoFirePoint.geohash, location: GeoPoint(event.latitude!, event.longitude!)), name: address, isVisible: true);
        //await _firestoreUserProfileRepository.setUserLocation(event.userId, location);
        updated.address = address;
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

  Future<void> _onSetTandemMatchEvent(SetTandemMatchEvent event, Emitter<AuthenticationState> emit) async {
    try {
      await _firestoreTandemRepository.setTandemMatch(event.tandemMatch, event.profile);
    } catch (_) {}
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
