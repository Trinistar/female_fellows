import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:femalefellows/helper_functions.dart';
import 'package:femalefellows/models/address.dart';
import 'package:femalefellows/models/event_participant.dart';
import 'package:femalefellows/models/user_model.dart';
import 'package:femalefellows/provider/firebase/authrepository.dart';
import 'package:femalefellows/provider/firebase/cloud_functions.dart';
import 'package:femalefellows/provider/firebase/firestore_event_repository.dart';
import 'package:femalefellows/provider/firebase/firestore_tandem_repository.dart';
import 'package:femalefellows/provider/firebase/firestore_user_profile_repository.dart';
import 'package:femalefellows/provider/firebase/messaging.dart';
import 'package:femalefellows/provider/firebase/storage_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

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
    on<ReloadUserEvent>(_onReloadUserEvent);
    on<DeleteAccountEvent>(_onDeleteAccountEvent);

    _userSubscription = _authenticationProvider.user.listen((User? user) => add(AuthenticationUserChangedEvent(user)));
  }
  final AuthRepository _authpage = AuthRepository();
  final FirestoreUserProfileRepository _firestoreUserProfileRepository = FirestoreUserProfileRepository();
  final FirestoreEventRepository _firestoreEventRepository = FirestoreEventRepository();
  final FirestoreTandemRepository _firestoreTandemRepository = FirestoreTandemRepository();
  final StorageRepository _storageRepository = StorageRepository();
  late IdTokenResult _idTokenResult;

  StreamSubscription<User?>? _userSubscription;

  final AuthRepository _authenticationProvider;

  Future<void> _onAuthenticationUserChanged(AuthenticationUserChangedEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());

    if (event.user != null) {
      _idTokenResult = await event.user!.getIdTokenResult();
      await emit.onEach(
        CombineLatestStream.list(<Stream>[_firestoreUserProfileRepository.loadUserProfile(event.user!.uid), _firestoreUserProfileRepository.loadUserProfileLocationData(event.user!.uid)]),
        onData: (List<dynamic> streams) async {
          UserLocation location = UserLocation(data: GeoData(geohash: '', location: GeoPoint(0, 0)), name: '', isVisible: true);
          FFUser profile = FFUser();
          if (streams[0] == null) {
            emit(AuthenticationLoading());
          }
          profile = streams[0];

          if (streams[1] != null) {
            location = streams[1];
          }
          if (profile.localOrNewcomer != null) {
            _firestoreUserProfileRepository.loadTandemMatches(event.user!.uid, profile.localOrNewcomer!).listen((matches) async {
              profile.tandemMatches = matches;
              if (profile.tandemMatches != null) {
                profile.tandemMatches!.first.otherProfile = await _firestoreUserProfileRepository.getUserProfile(profile.tandemMatches!.first.otherUserId);
                emit(AuthenticatedUser(user: event.user!, userProfile: profile, tokenResult: _idTokenResult));
              }
            });
          }

          profile.location = location;
          emit(AuthenticatedUser(user: event.user!, userProfile: profile, tokenResult: _idTokenResult));
        },
      );
    } else {
      emit(UnauthenticatedUser());
    }
  }

  Future<Address> _getCityStringFromCoords(GeoPoint coords) async {
    final List<Placemark> placemarks = await placemarkFromCoordinates(coords.latitude, coords.longitude);
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
        //FirebaseAuth.instance.sendSignInLinkToEmail(email: event.email, actionCodeSettings: actionCodeSettings);
        currentuser.sendEmailVerification(HelperFunctions.getActionCodeSettings(currentuser.email!));
        _idTokenResult = await currentuser.getIdTokenResult();
        if (event.picture != null && event.picture!.path.isNotEmpty) {
          final UploadTask? task = await _getUploadTask(event.picture, currentuser.uid);

          if (task != null) {
            await emit.onEach(task.snapshotEvents, onData: (uploadState) async {
              switch (uploadState.state) {
                case TaskState.running:
                  break;

                case TaskState.success:
                  final String downloadUrl = await uploadState.ref.getDownloadURL();
                  userdata.profilPicture = downloadUrl;
                  await _firestoreUserProfileRepository.updateUserProfile(userdata, userID: currentuser.uid);
                  break;
                default:
              }
            });
          } else {
            await _firestoreUserProfileRepository.updateUserProfile(userdata, userID: currentuser.uid);
          }
        } else {
          await _firestoreUserProfileRepository.updateUserProfile(userdata, userID: currentuser.uid);
        }

        emit(AuthenticatedUser(user: currentuser, userProfile: userdata, tokenResult: _idTokenResult));
      } else {
        emit(UnauthenticatedUser());
      }
    } catch (e) {
      emit(UnauthenticatedUser());
    }
  }

  Future<UploadTask?> _getUploadTask(XFile? picture, String userId) async {
    if (picture == null) return null;
    try {
      final PickedFile file = PickedFile(picture.path);
      final UploadTask? task = await _storageRepository.uploadFile(file, userId);

      if (task == null) return null;

      return task;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> _onSetTandemMatchEvent(SetTandemMatchEvent event, Emitter<AuthenticationState> emit) async {
    try {
      await _firestoreTandemRepository.setTandemMatch(event.tandemMatch, event.profile, event.otherId);
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
      final String? token = await Messaging().firebaseMessaging.getToken();

      if (token != null) {
        CloudFunctions().firebaseFunctions.httpsCallable('removeFcmToken').call(<String, dynamic>{
          'token': token,
        });
      }
      _authenticationProvider.logOut();
      emit(UnauthenticatedUser());
    } catch (error) {
      print(error);
      //emit(state.copyWith(errorCode: AuthenticationErrorCode.SIGN_OUT_FAILED, error: error.toString()) as AuthenticationState);
      //emit(const UnauthenticatedUser());
    }
  }

  Future<void> _onReloadUserEvent(ReloadUserEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final UserCredential cred = await _authenticationProvider.reauthenticateWithMail(event.email, event.password);
      _idTokenResult = await cred.user!.getIdTokenResult();
      emit(AuthenticatedUser(user: cred.user, userProfile: event.profile, tokenResult: _idTokenResult));
    } catch (error) {
      print(error);
      //emit(state.copyWith(errorCode: AuthenticationErrorCode.SIGN_OUT_FAILED, error: error.toString()) as AuthenticationState);
      //emit(const UnauthenticatedUser());
    }
  }

  Future<void> _onDeleteAccountEvent(DeleteAccountEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final String? token = await Messaging().firebaseMessaging.getToken();

      if (token != null) {
        CloudFunctions().firebaseFunctions.httpsCallable('removeFcmToken').call(<String, dynamic>{
          'token': token,
        });
      }
      await event.user.delete();

      //emit(const UnauthenticatedUser());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        emit(Reauthenticate());
        //event.user!.reauthenticateWithCredential(credential);
      }
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
