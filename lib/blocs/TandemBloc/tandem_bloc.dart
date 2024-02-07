import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:vs_femalefellows/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/user_model.dart';
import 'package:vs_femalefellows/provider/firestore/firestore_user_profile_repository.dart';

part 'tandem_event.dart';
part 'tandem_state.dart';

class TandemBloc extends Bloc<TandemEvent, TandemState> {
  TandemBloc(this._firestoreUserprofileRepository, this._authBloc) : super(TandemInitial()) {
    on<LoadAllTandemLocalsEvent>(_onLoadAllTandemLocalsEvent);
    on<LoadAllTandemNewcomersEvent>(_onLoadAllTandemNewcomersEvent);
    on<UpdateTandemFilterEvent>(_onUpdateTandemFilterEvent);
    on<UnloadAllTandemsEvent>((UnloadAllTandemsEvent event, Emitter<TandemState> emit) => emit(TandemsNotLoaded()));

    _authBlocStreamSub = _authBloc.stream.listen((AuthenticationState state) {
      if (state is AuthenticatedUser) {
        if (state.userProfile!.localOrNewcomer == LocalOrNewcomer.local) {
          add(LoadAllTandemNewcomersEvent(state.userProfile!));
        }
        if (state.userProfile!.localOrNewcomer == LocalOrNewcomer.newcomer) {
          add(LoadAllTandemLocalsEvent(state.userProfile!));
        }
      } else if (state is UnauthenticatedUser) {
        add(UnloadAllTandemsEvent());
      }
    });
  }

  final AuthenticationBloc _authBloc;

  StreamSubscription<dynamic>? _authBlocStreamSub;

  final FirestoreUserProfileRepository _firestoreUserprofileRepository;

  Future<void> _onUpdateTandemFilterEvent(UpdateTandemFilterEvent event, Emitter<TandemState> emit) async {
    return emit.onEach(
      _firestoreUserprofileRepository.getAllTandems(event.profile.tandemTypeFilter.toString()),
      onData: (List<FFUser> tandems) async {
        if (tandems.isEmpty) emit(TandemsNotLoaded());

        emit(TandemNewcomersLoaded(tandems: await _filterGeoTandems(event.profile, tandems)));
      },
    );
  }

  Future<void> _onLoadAllTandemLocalsEvent(LoadAllTandemLocalsEvent event, Emitter<TandemState> emit) async {
    return emit.onEach(
      _firestoreUserprofileRepository.getAllTandems('local'),
      onData: (List<FFUser> tandems) async {
        if (tandems.isEmpty) emit(TandemsNotLoaded());

        final List<FFUser> current = await _filterGeoTandems(event.profile, tandems);

        emit(TandemLocalsLoaded(tandems: current));
      },
    );
  }

  Future<void> _onLoadAllTandemNewcomersEvent(LoadAllTandemNewcomersEvent event, Emitter<TandemState> emit) async {
    return emit.onEach(
      _firestoreUserprofileRepository.getAllTandems('newcomer'),
      onData: (List<FFUser> tandems) async {
        if (tandems.isEmpty) emit(TandemsNotLoaded());

        emit(TandemNewcomersLoaded(tandems: await _filterGeoTandems(event.profile, tandems)));
      },
    );
  }

  Future<List<FFUser>> _filterGeoTandems(FFUser profile, List<FFUser> tandems) async {
    List<FFUser> temp = List.empty();

    if (profile.tandemTypeFilter == TandemTypeFilter.all || profile.tandemTypeFilter == null) {
      for (final FFUser user in tandems) {
        user.tandemMatch = _getMatchByAge(profile, user);
      }
      tandems.sort((a, b) => b.tandemMatch!.compareTo(a.tandemMatch!));
      temp = List<FFUser>.from(<FFUser>[...tandems.getRange(0, 5)]);
      return temp;
    } else {
      final List<FFUser> geoTandems = [];

      if (profile.location!.data != null) {
        final GeoFirePoint ownGeoFire = GeoFirePoint(profile.location!.data!.location);

        for (final FFUser user in tandems) {
          double locationDistance = 0.0;
          user.location = await _firestoreUserprofileRepository.getUserLocation(user.id!);
          if (user.location != null) {
            final double distanceBetween = ownGeoFire.distanceBetweenInKm(geopoint: user.location!.data!.location);
            if (distanceBetween < 20) {
              geoTandems.add(user);
              locationDistance = 1 / distanceBetween / 2;
            }
          }
          user.tandemMatch = (locationDistance.abs() + _getMatchByAge(profile, user)).clamp(0, 1);
        }
        temp = List<FFUser>.from(<FFUser>[...geoTandems]);
        temp.sort((a, b) => b.tandemMatch!.compareTo(a.tandemMatch!));
      }
    }
    return temp;
  }

  double _getMatchByAge(FFUser profile, FFUser tandem) {
    double ageDistance = 0.0;

    if (tandem.birthday != null && profile.birthday != null) {
      final DateTime ownBirthday = profile.birthday!.toDate();
      final Duration difference = ownBirthday.difference(tandem.birthday!.toDate());
      ageDistance = 1 / (difference.inDays / 365);
    }
    if (profile.tandemTypeFilter == TandemTypeFilter.all) {
      return ageDistance.abs().clamp(0, 1);
    } else {
      return ageDistance.abs().clamp(0, 1) / 2;
    }
  }

  @override
  Future<void> close() {
    _authBlocStreamSub?.cancel();
    return super.close();
  }
}
